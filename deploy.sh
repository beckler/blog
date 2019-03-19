#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build the project -> outputs to public folder
hugo --minify --buildFuture

# setup worktree
git worktree add --checkout -b gh-pages public origin/gh-pages

# commit the public folder
git add --all && git commit -m "Update content"

# push to the gh-pages branch
git push origin gh-pages

# remove the local branch 
git branch -D gh-pages

echo -e "\033[0;32mFinished deploying.\033[0m"