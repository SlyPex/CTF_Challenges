#!/bin/bash

set -euo pipefail

if  [[ "$#" -gt 1 ]]
then
	echo -e "[!] - ERROR : Extra Argument Specified\nUsage : $0 [path_to_directory]" >&2
	exit 1
elif [[ "$#" -ne 1 ]]
then
	echo -e "[!] - ERROR : Missing Argument\nUsage : $0 [path_to_directory]" >&2
	exit 1
else
	if [[ ! -d "$1" ]] 
	then
		echo "[!] - ERROR : The specified Argument $1 is not a directory" >&2
		exit 1
	elif (ls -lA "$1" | grep -qo docker-compose.yml)
	then
		echo "[*] Deployable with docker-compose"
		echo "deploy_env=docker-compose" >> "$GITHUB_OUTPUT"
		exit 0
	elif (ls -lA "$1" | grep -qo Dockerfile)
	then
		echo "[*] Deployable with Dockerfile"
		echo "deploy_env=Dockerfile" >> "$GITHUB_OUTPUT"
		exit 0
	else
		echo "[*] This Challenge is not deployable"
		echo "deploy_env=None"
		exit 0
	fi
fi