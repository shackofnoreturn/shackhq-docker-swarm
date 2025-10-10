#!/usr/bin/env bash
set -e

echo "🧹 Running Ansible cleanup..."
ansible-playbook playbooks/create_stack.yml -e cleanup=true

echo "📦 Staging changes..."
git add .

if git diff --cached --quiet; then
  echo "✅ No changes to commit or push"
else
  msg="Auto commit ($(date '+%Y-%m-%d %H:%M:%S'))"
  git commit -m "$msg"
  echo "💾 $msg"
  git push
  echo "🚀 Changes pushed to remote"

  # 🌀 Trigger only webhooks for stacks that changed
  WEBHOOK_FILE="scripts/webhooks.txt"
  RETRIES=3
  SLEEP_SEC=5

  if [[ -f "$WEBHOOK_FILE" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
      [[ -z "$line" ]] && continue
      stack_dir="${line%%=*}"
      webhook_url="${line#*=}"

      # Check if any staged files are in this stack directory
      if git diff --cached --name-only | grep -q "^$stack_dir/"; then
        echo "🌊 Triggering webhook for $stack_dir: $webhook_url"

        for attempt in $(seq 1 $RETRIES); do
          http_status=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
            "$webhook_url" \
            -H "Content-Type: application/json")

          if [[ "$http_status" == "200" || "$http_status" == "204" ]]; then
            echo "✅ Webhook triggered successfully (HTTP $http_status)"
            break
          else
            echo "⚠️ Attempt $attempt/$RETRIES failed with HTTP $http_status"
            if [[ $attempt -lt $RETRIES ]]; then
              echo "⏳ Retrying in $SLEEP_SEC seconds..."
              sleep $SLEEP_SEC
            else
              echo "❌ Webhook failed after $RETRIES attempts: $webhook_url"
            fi
          fi
        done
      else
        echo "ℹ️ No changes in $stack_dir, skipping webhook"
      fi
    done < "$WEBHOOK_FILE"
  else
    echo "⚠️ No webhook file found: $WEBHOOK_FILE"
  fi
fi
