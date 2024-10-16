# sub module repo!
app_install_repo=App.install.offline

# get location on master
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

repo_path=`dirname $(dirname $(dirname $(dirname $SCRIPT_DIR)))`
repo=`basename $repo_path`

# on master
src=$repo_path/$app_install_repo/src