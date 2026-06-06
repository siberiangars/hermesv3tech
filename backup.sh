#!/bin/bash
REPO_DIR=/root/workspace
cd $REPO_DIR || exit 1
GIT_SSH_COMMAND="ssh -i /root/.ssh/deploy_key -o StrictHostKeyChecking=no" git pull origin main 2>/dev/null
cp /root/.hermes/config.yaml $REPO_DIR/config.yaml 2>/dev/null
ls /root/.hermes/skills/ > $REPO_DIR/skills.txt 2>/dev/null
if ! git diff --quiet --exit-code; then
    git add -A
    git commit -m "Server backup $(date +%Y-%m-%d_%H:%M)"
    GIT_SSH_COMMAND="ssh -i /root/.ssh/deploy_key -o StrictHostKeyChecking=no" git push origin main
fi
