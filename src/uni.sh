source ../../var/host ../../var/package

source lib/default.sh
source lib/sync/node.sh

onNode(){
    makeDir
    syncCache
    syncSrc
}

onNode

# run
ssh $node cd ~/$src_tmp/$repo/src && lib/install.sh