parent=../..
source ../../var/host
source ../../var/package

source lib/default.sh
source lib/sync/node.sh

onNode(){
    makeDir
    syncCache
    syncSrc
}

runInstall(){
    ssh $node SRC=$src PASSWORD=$become_password $src/lib/install.sh
}

main(){
    if ! `ssh $node command -v $bin 2>&1 >/dev/null`
    then
        echo 'starting'
        onNode
        runInstall
    else
        echo 'already installed'
    fi
}

main