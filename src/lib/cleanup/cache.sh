recursiveRemoveEmpty(){
    # recursively remove empty dirs in ~/.uni
    cd ~/.uni && find * -type d -exec rmdir {} + 2>/dev/null
    cd ~/.uni && find * -type d -exec rmdir {} + 2>/dev/null

    # Bug: some reason I neeed to run twice to remove ~/.uni/mirror
    # Fix this!
}

cleanup(){
    if [ $node != "localhost" ]; then   # If localhost, skip to keep cache mirror from being deleted!
        echo removing unneeded files
        rm -rf ~/$cache/$name ~/$src_tmp

        recursiveRemoveEmpty
    fi
}