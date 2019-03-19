#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# remove public folder 
rm -rf public/

# # pull subtree
# git subtree add --prefix public origin gh-pages

# build the project -> outputs to public folder
hugo --minify --buildFuture

# commit the public folder
git add public && git commit -m "Update content"

# push to the gh-pages branch
git subtree push --prefix public origin gh-pages --squash

echo -e "\033[0;32mFinished deploying.\033[0m"