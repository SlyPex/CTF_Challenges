from flaglib import * 

try:
    with open("/home/tawat-cracked/flag.txt","rb") as flag:
        flaghash = filehash(flag)
        print(flaghash)
except:
    print("Permession denied")
    exit(2)
