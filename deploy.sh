CURRENT_BRANCH=$(git branch --show-current)
PREVIOUS_PATH=$(pwd)
git branch gh-pages HEAD --force
git checkout gh-pages
rm -rf dist
npm run build
cp -r dist deploy
git add deploy
git commit --amend --no-edit
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --subdirectory-filter deploy -- gh-pages
git checkout $CURRENT_BRANCH
cd $PREVIOUS_PATH
rm -rf deploy
echo If you have verified that the commit in the 'gh-pages' looks good, you may now wish to run:
echo "    git push origin gh-pages:gh-pages --force"
