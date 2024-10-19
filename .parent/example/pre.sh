# Choose one
type=apt

#
repo=App.install.offline
[[ -d $repo ]] || git clone https://github.com/Unicorn-OS/$repo.git

cp -r $repo/.parent/example/var .
cp $repo/.parent/example/install.sh .
cp $repo/.parent/example/.gitignore .

mv var/package.$type var/package
