#!/bin/bash

SUCCESS="true"

if [[ "$#" -gt 2 ]]
then
    echo -e "[!] - ERROR : Extra Argument Specified\nUsage : $0 [path_to_challs_directory] [path_to_readme_file]" >&2
	exit 1
elif [[ "$#" -lt 2 ]]
then
    echo -e "[!] - ERROR : Missing Argument\nUsage : $0 [path_to_challs_directory] [path_to_readme_file]" >&2
	exit 1
else
    mapfile -t CHALLS_UNDER_DIR < <(echo $(ls "$1" | sort))

    for dir_chall in ${CHALLS_UNDER_DIR[@]}
    do
        CHALL_LINE=$(grep -P "(?<=(\||\[))$dir_chall(?=(\||\]))" $2 | cut -d '|' -f 2)
        if [[ -n $CHALL_LINE ]]
        then
            echo "[*] - SUCCESS : $dir_chall is Found in $2 file"
            if [[ "$CHALL_LINE" = "[$dir_chall]($1/$dir_chall)" ]]
            then
                echo "[*] - SUCCESS : $dir_chall Challenge is Linked to its directory"
            else
                echo "[?] - WARNING : No link found for $dir_chall Challenge"
                SUCCESS="Warning"
            fi
        else
            echo "[!] - ERROR : $dir_chall Not Found in $2 file" >&2
            SUCCESS="False"
        fi
    done

    if [[ $SUCCESS = "True" ]]
    then
        echo "[*] - SUCCESS : Checking Completed Successfully"
        exit 0
    elif [[ $SUCCESS = "Warning" ]]
    then
        echo "[?] - WARNING : Fix Missing Links in $2 File"
        exit 0
    elif [[ $SUCCESS = "False" ]]
    then
        echo "[!] - ERROR : Checking Failed, Missing Challegnes in $2 File"
        exit 1
    fi
fi