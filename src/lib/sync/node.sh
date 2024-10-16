hello="world"

makeDir(){
    ssh $node mkdir -p ${cache} ${src_tmp}
}

syncCache(){
    rsync -av --progress ${HOME}/${cache} $node:./`dirname $cache`
}

syncSrc(){
    rsync -av --progress --delete ../../../ $node:./${src_tmp}/
}