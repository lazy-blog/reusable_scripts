rm -rf .git
git init .

git config --global user.name "lazy-blog"
git config --global user.email "lazy-blog@github.com"

git add .
git commit -m1
git remote add origin "$1"

git push origin main -f