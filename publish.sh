flutter build web
git commit -m "publish web" build/web/*
git subtree push --prefix build/web/ origin gh-pages
