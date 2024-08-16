# Signal_Party

## Write-up

> i'll probably change this write-up

You only have to reverse the binary, and using the extra information given in the challenge description we get this :

```python
from string import ascii_uppercase,digits

# Possible Charcters For The Flag : AlphaCTF{[^SI023468]+}.
letters = ascii_uppercase + digits + '_'
# Removing non-included letters
letters = [letter for letter in letters if letter not in 'SI023468']

# Building the dictionary where each letter from letters list matches its encrypted value
transformer = {}
for letter in letters:
    if ord(letter) > 64:
        transformer[ord(letter) % 32] = letter
    elif ord(letter) < 58:
        transformer[(ord(letter) % 32)% 5 + 27] = letter

# Getting the values of the Encrypted chars [output file].
f = open("output", "rb")
encoded_flag = f.read()[:-1] # Remove the new line char 
flag = 'AlphaCTF{'

for char in encoded_flag:
    flag += transformer[char - 0x7F]

flag += '}'
print(flag)
```

## Flag
`AlphaCTF{YOU_R_REALLY_A_519NAL_PLAY9ROUND_MA57ER}`