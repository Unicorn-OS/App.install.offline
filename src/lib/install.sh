# env passed in from SSH
source $SRC/lib/default.sh

# app specific vars
source ~/$src_dir/$repo/var/package
source ~/$src_dir/$repo/var/test.sh

install(){
    cd ~/$cache/archives

    for p in ${package[@]}; do
        packages="${packages} ${p}*"
    done

    echo "$PASSWORD" | sudo -S dpkg -i $packages* 
}

install
try