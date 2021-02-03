"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    p = 0
    s = ''
    while p<l:
        import random
        s += random.choice(a)
        p += 1
    return s

def BatchStringGenerator(n, a=8, b=12):
    r = []
    for i in range(n):
        c = None
        if a < b:
            import random
            c = random.choice(range(a, b))
        elif a == b:
            c = a
        else:
            import sys
            sys.exit('Incorrect min and max string lengths. Try again.')
        r.append(RandomStringGenerator(c))
    return r

a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))



"""MY CODE"""

#first, import libraries

import random
import sys


#then, all the inputs in the same place with names that can be easily understood 

str_length = 12
str_list = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
min_length = input('Enter minimum string length: ')
max_length = input('Enter maximum string length: ')
str_number = int(input('How many random strings to generate? '))


#then, variables definition

def RandomStringGenerator(str_length, str_list):
    p = 0
    s = ''
    while p < str_length:
        s += random.choice(str_list)
        p += 1
    return s    
    
    
def BatchStringGenerator(n, min_length=8, max_length=12):
    r = []
    for i in range(str_number):
        c = None
        if min_len < max_length:
            c = random.choice(range(min_length, max_length))
        elif min_len == max_length:
            c = min_length
        else:
            sys.exit('Incorrect min and max string length. Try again.')
        r.append(RandomStringGenerator(c,str_list))
    return r


#finally, last print

print(BatchStringGenerator(int(str_number), int(min_length), int(max_length)))
