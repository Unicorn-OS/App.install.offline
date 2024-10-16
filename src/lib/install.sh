# env passed in from SSH
source $SRC/lib/default.sh
source $SRC/lib/clean.sh
var=~/$src_dir/$REPO/var

# app specific vars
source $var/package
source $var/test.sh

install(){
    
    cd ~/$cache/archives

    for p in ${package[@]}; do
        packages="${packages} ${p}*"
    done

    echo "$PASSWORD" | sudo -S dpkg -i $packages* 
}

main(){
    # Install if doesn't exist! then cleanup files
    if ! command -v $bin 2>&1 >/dev/null
    then
        install
        cleanup
    fi

    # test
    try
}

main
