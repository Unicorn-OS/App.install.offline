makeDir(){
    ssh $node mkdir -p ${cache} ${src_tmp}
}

syncCache(){
    rsync -av --progress ${HOME}/${cache} $node:./`dirname $cache`
}

syncSrc(){
    delete='--delete'
    rsync -av --progress $delete ../../../ $node:./${src_dir}/
}