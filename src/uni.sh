parent=../..
source $parent/var/host $parent/var/package

source lib/default.sh
source lib/sync/node.sh

onNode(){
    makeDir
    syncCache
    syncSrc
}

onNode

# run
ssh $node SRC=$src PASSWORD=$become_password $src/lib/install.sh