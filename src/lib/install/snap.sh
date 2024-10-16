# Install Snapcraft!

# TODO: Need to Improve this to use JSON and have "classic" be a field!

# TODO: Deduplicate this! make a function that's used by both
dependency(){
    if $snap_depend_classic;then
        classic="--classic"
    else
        classic=""
    fi

    if [ ${#depends[@]} -gt 0 ]; then
        for snap in "${depends[@]}"
        do
            cd $cache/$snap
            echo "$PASSWORD" | sudo -S snap ack *.assert
            echo "$PASSWORD" | sudo -S snap install *.snap $classic
            cd -
        done
    fi
}

install(){
    if $snap_classic;then
        classic="--classic"
    else
        classic=""
    fi

    for snap in "${package[@]}"
    do
        cd $cache/$snap
        echo "$PASSWORD" | sudo -S snap ack *.assert
        echo "$PASSWORD" | sudo -S snap install *.snap $classic
        cd -
    done
}

if ! command -v $bin 2>&1 >/dev/null    #https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
then
    dependency
    install
fi