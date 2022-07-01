mkdir -p /task/student/projet_git
cd /task/student/projet_git

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

git init
echo "Ceci est la ligne de départ" > /task/student/projet_git/file
git add -A
git commit -m "init - first commit"