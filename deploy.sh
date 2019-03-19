#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build the project -> outputs to public folder
hugo --minify --buildFuture

# commit the public folder
git add public && git commit -m "Update content"

# push the public folder ONLY to the gh-pages branch
git subtree push --prefix public origin gh-pages

echo -e "\033[0;32mFinished deploying.\033[0m"