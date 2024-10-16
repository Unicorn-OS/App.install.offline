# This runs on Master server, much like Ansible! It then installs software on nodes.

import(){
# dynamic import - detects paths
    src=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )  # will be overridden in minion
    source $src/lib/_inc.sh
}; import


installThis(){
    ssh $node REPO=$repo PASSWORD=$become_password $src_on_node/lib/install.sh
}

main(){
    if ! `ssh $node command -v $bin 2>&1 >/dev/null`
    then
        echo 'starting'
        setupNode
        installThis
    else
        echo $bin
        echo 'already installed'
    fi
}

# main

setupNode
installThis