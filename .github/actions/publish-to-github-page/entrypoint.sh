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
cp ${DIST_FOLDER} ~/dist/

# publish any new files
dist_branch="gh-pages"
repo_name=`echo "${GITHUB_REPOSITORY}" | cut -d "/" -f 2`
git checkout --orphan ${dist_branch}
git checkout ${dist_branch}
git rm -rf .
echo "https://${GITHUB_ACTOR}.github.io/${repo_name}" > README.md
cp -r ~/dist/* .
git add -A
timestamp=$(date -u)
git commit -m "Automated publish: ${timestamp} ${GITHUB_SHA}"
git push publisher ${dist_branch}
