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
fi
