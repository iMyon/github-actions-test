#!/bin/sh

# check values
if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

# initialize git
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.name "Automated Publisher"
git config user.email "publish-to-github-action@users.noreply.github.com"
git remote add publisher "${remote_repo}"
git show-ref # useful for debugging
git branch --verbose

# copy dist files
mkdir ~/dist
cp ./index.html ~/dist/

# publish any new files
git checkout --orphan gh-pages
git checkout gh-pages
git rm -rf .
cp -r ~/dist/* .
git add -A
timestamp=$(date -u)
git commit -m "Automated publish: ${timestamp} ${GITHUB_SHA}"
git push publisher tmp
