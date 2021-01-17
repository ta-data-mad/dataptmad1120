"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.
The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

import random
import sys
#for proper libraries

#clearer definitions and we locate our inputs and rename them
str_len = 12
str_list = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
min_len = input('Enter minimum string len: ')
max_len = input('Enter maximum string len: ')
str_number = int(input('How many random strings to generate? '))


#variables renamed

def RandomStringGenerator(str_len, str_list):
    p = 0
    s = ''
    while p < str_len:
        s += random.choice(str_list)
        p += 1
    return s    
    
    
def BatchStringGenerator(n, min_lenght=8, max_lenght=12):
    r = []
    for i in range(str_number):
        c = None
        if min_len < max_len:
            c = random.choice(range(min_len, max_len))
        elif min_len == max_len:
            c = min_len
        else:
            sys.exit('Incorrect min and max string lens. Try again.')
        r.append(RandomStringGenerator(c,str_list))
    return r



print(BatchStringGenerator(int(str_number), int(min_len), int(max_len)))
                