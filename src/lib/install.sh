# env passed in from SSH
source $SRC/lib/default.sh

# app specific vars
source ~/$src_tmp/$repo/var/package
source ~/$src_tmp/$repo/var/test.sh

install(){
    cd ~/$cache/archives

    for p in ${package[@]}; do
        sudo dpkg -i $p*
    done 
}

install
try