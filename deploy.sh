#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build the project -> outputs to public folder
hugo --minify --buildFuture

# pull in any changes from the gh-pages branch
git subtree pull --prefix public origin gh-pages

# commit the public folder
git add -f public && git commit -m "Update content"

# push the public folder ONLY to the gh-pages branch
git subtree push --prefix public origin gh-pages --squash

echo -e "\033[0;32mFinished deploying.\033[0m"