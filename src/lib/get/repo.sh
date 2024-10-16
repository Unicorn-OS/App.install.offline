# TEST
# repo_path=$(dirname $(dirname `pwd`))
# repo=`basename $repo_path`
#echo $repo


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

repo_path=`dirname $(dirname $(dirname $(dirname $SCRIPT_DIR)))`
repo=`basename $repo_path`

app_install_repo=$repo_path/App.install.offline
src=$app_install_repo/src

# debug
# echo $repo_path
# echo $repo