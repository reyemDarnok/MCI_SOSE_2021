flutter build web
git commit -m "publish web" build/web/* build/web/.last_build_id
git subtree push --prefix build/web/ origin gh-pages
