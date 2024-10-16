source $src/lib/cleanup/cache.sh

install(){
    cd ~/$cache/$name/archives

    for p in ${package[@]}; do
        packages="${packages} ${p}*"
    done

    echo "$PASSWORD" | sudo -S dpkg -i $packages* 
    cd - > /dev/null
}

main(){
    # Install if doesn't exist! then cleanup files
    if ! command -v $bin 2>&1 >/dev/null
    then
        install
        cleanup
    fi
}

main