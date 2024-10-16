source lib/get/repo.sh

source $repo_path/var/host
source $repo_path/var/package

source $src/lib/default.sh
exit
source $src/lib/sync/node.sh

onNode(){
    makeDir
    syncCache
    syncSrc
}

runInstall(){
    ssh $node SRC=$src REPO=$repo PASSWORD=$become_password $src/lib/install.sh
}

main(){
    if ! `ssh $node command -v $bin 2>&1 >/dev/null`
    then
        echo 'starting'
        onNode
        runInstall
    else
        echo $bin
        echo 'already installed'
    fi
}

main
