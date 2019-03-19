#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build the project -> outputs to public folder
hugo --minify --buildFuture

# setup worktree
git worktree add public gh-pages

# commit the public folder
git add public && git commit -m "Update content"

# push to the gh-pages branch
git push origin gh-pages

echo -e "\033[0;32mFinished deploying.\033[0m"