flutter build web
pushd build/web/ || exit
git add -- *
git commit -m "new version"
git push
popd || exit
