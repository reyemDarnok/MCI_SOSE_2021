#!/usr/bin/env bash
rm -r build/release
mkdir build/release
flutter build web
pushd build/web/ || exit
git add -- * .last_build_id
git commit -m "new version"
git push
tar -cf ../release/webHostable.tar.gz ./*
popd || exit
flutter build apk
cp build/app/outputs/apk/release/app-release.apk build/release/android.apk
