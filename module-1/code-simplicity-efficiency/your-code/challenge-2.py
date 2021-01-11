"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

# The first thing to do is to import all the necessary libraries:
import random
import sys

# Second, we define the variables out of the definitions and change the names to be more clear

str_length = 12
str_list = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']

# Third we move the inputs to the beginning and rename them with easier to understand names

min_lenght = input('Enter minimum string length: ')
max_lenght = input('Enter maximum string length: ')
string_number = int(input('How many random strings to generate? '))

# Lastly, we rename the variables inside the formulas

def RandomStringGenerator(str_length, str_list):
    p = 0
    s = ''
    while p<str_length:
        s += random.choice(str_list)
        p += 1
    return s

def BatchStringGenerator(n, min_lenght=8, max_lenght=12):
    r = []
    for i in range(string_number):
        c = None
        if min_lenght < max_lenght:
            c = random.choice(range(min_lenght, max_lenght))
        elif min_lenght == max_lenght:
            c = min_lenght
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
        r.append(RandomStringGenerator(c,str_list))
    return r



print(BatchStringGenerator(int(string_number), int(min_lenght), int(max_lenght)))




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
