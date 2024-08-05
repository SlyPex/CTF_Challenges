#!/bin/bash

set -euo pipefail

if [[ "$#" -gt 2 ]]
then
    echo -e "[!] - ERROR : Extra Argument Specified\nUsage : $0 [path_to_challs_directory] [path_to_readme_file]" >&2
	exit 1
elif [[ "$#" -lt 2 ]]
then
    echo -e "[!] - ERROR : Missing Argument\nUsage : $0 [path_to_challs_directory] [path_to_readme_file]" >&2
	exit 1
else
    LINES_IN_TABLE=$(grep -Pc "^\|" "$2")
    COUNTER=0

    mapfile -t CHALLS_UNDER_DIR < <(echo $(ls "$1" | sort))
    mapfile -t CHALLS_IN_TABLE < <(echo $(grep -P "^\|" "$2" | tail -n $(($LINES_IN_TABLE - 2)) | cut -d '|' -f 2 |  grep -Po "(?<=\[).+(?=\])" | sort ))

    for dir_chall in "${CHALLS_UNDER_DIR[@]}"
    do
        for tab_chall in "${CHALLS_IN_TABLE[@]}"
        do
            if [[ "$dir_chall" = "$tab_chall" ]]
            then
                COUNTER=$(( $COUNTER + 1 ))
            fi
        done
    done

    if [[ $COUNTER -eq $(($(ls -l "$1" | wc -l ) - 1)) ]]
    then
        echo "[*] - SUCCESS : Challs in README.md and Directory are the same"
        exit 0
    else
        echo "[!] - ERROR : Checking Failed" >&2
        exit 1
    fi
fi