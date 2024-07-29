#!/usr/bin/python

from sys import argv
from os import listdir
from os.path import isdir

must_contain = ['README.md', 'challenge', 'solution', 'challenge.yml']

def check_structure(path_to_chall_directory : str = None):
    if not isdir(path_to_chall_directory):
        print(f"[!] - {path_to_chall_directory} is not a directory\nPlease specify a correct path")
    else:
        subdirs = listdir(path=path_to_chall_directory)
        if all(x in subdirs for x in must_contain):
            return True
    return False

if __name__=='__main__':
    result = False
    try:
        result = check_structure(path_to_chall_directory=argv[1])
    except IndexError as e:
        print(f"[!] - ERROR : Missing Argument\nUsage : {argv[0]} [path_to_chall_directory]")
    finally:
        if result:
            exit(0)
        else:
            exit(1)

     