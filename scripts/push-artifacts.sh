#!/bin/bash

# Path to repos
DOWNSTREAM_REPO="$(pwd)"
MASTER_REPO="$HOME/Dev/artifacts-tracking/master-artifacts"

# Copy artifacts to master repo
cp -r "$DOWNSTREAM_REPO/artifacts/"* "$MASTER_REPO/projects/downstream-1/" 2>/dev/null

# Commit and push changes to master repo
cd "$MASTER_REPO"
git add projects/downstream-1/
git diff --staged --quiet || (git commit -m "Sync artifacts from downstream-1" && git push origin test-new)
