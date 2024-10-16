recursiveRemoveEmpty(){
    # recursively remove empty dirs in ~/.uni
    cd ~/.uni && find * -type d -exec rmdir {} + 2>/dev/null
    cd ~/.uni && find * -type d -exec rmdir {} + 2>/dev/null

    # Bug: some reason I neeed to run twice to remove ~/.uni/mirror
    # Fix this!
}

cleanup(){
    echo removing unneeded files
    rm -rf ~/$cache/$name ~/$src_tmp

    recursiveRemoveEmpty
}