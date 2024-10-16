source lib/default.sh
source $src_tmp/$repo/var/package
source $src_tmp/$repo/var/test.sh

install(){
    cd ~/$cache/archives

    for p in ${package[@]}; do
        sudo dpkg -i $p*
    done 
}

#install
try