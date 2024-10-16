makeDir(){
    ssh $node mkdir -p ${cache} ${src_tmp}
}

syncCache(){
    rsync -av --progress ${HOME}/${cache} $node:./`dirname $cache`
}

syncSrc(){
    delete='--delete'
    rsync -av --progress $delete $repo_path $node:./${src_tmp}/
}

setupNode(){
    makeDir
    syncCache
    syncSrc
}
