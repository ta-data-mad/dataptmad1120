"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

# Improved code
# Renamed variable to improve readibility p = counter // s=rand_string// a = values // l= length // r= batch /
# a= min_length // b= max_length // c= length
# Imports moved from functions to main script
# Constants moved to variables
# Check of inputs out of for loop. Moved to main script.
# Values list moved to main script to avoid defining it every time  we generate a string

def RandomStringGenerator(length=12):
    counter = 0
    rand_string = ''
    while counter<length:
        rand_string += random.choice(values)
        counter += 1
    return rand_string

def BatchStringGenerator(n_strings, min_length=8, max_length=12):
    batch = []
    sel_length = 0
    for i in range(n_strings):
        if min_length < max_length:
            length = random.choice(range(min_length, max_length))
        elif min_length == max_length:
            length = min_length
        batch.append(RandomStringGenerator(length))
    return batch

import random
import sys
min_length = int(input('Enter minimum string length: '))
max_length = int(input('Enter maximum string length: '))
n_strings = int(input('How many random strings to generate? '))
if min_length > max_length: #moved out of funtion 
    sys.exit('Incorrect min and max string lengths. Try again.')
else:
    values=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
    print(BatchStringGenerator(n_strings, min_length, max_length))



# Original code
# def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
#     p = 0
#     s = ''
#     while p<l:
#         import random
#         s += random.choice(a)
#         p += 1
#     return s

# def BatchStringGenerator(n, a=8, b=12):
#     r = []
#     for i in range(n):
#         c = None
#         if a < b:
#             import random
#             c = random.choice(range(a, b))
#         elif a == b:
#             c = a
#         else:
#             import sys
#             sys.exit('Incorrect min and max string lengths. Try again.')
#         r.append(RandomStringGenerator(c))
#     return r

# a = input('Enter minimum string length: ')
# b = input('Enter maximum string length: ')
# n = input('How many random strings to generate? ')

# print(BatchStringGenerator(int(n), int(a), int(b)))
