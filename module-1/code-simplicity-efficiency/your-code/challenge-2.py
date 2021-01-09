"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

# Let's put some order in this mess. First of all is important to import all needed libraries at the very beginning.
# Also would seem a good idea to ask for all needed variables at the start of the code in order to facilitate the understanding.
# A very important improvement is provide a better name for all required variables.

import random
import sys
import string

min_str_leng = input('Enter minimum string length: ')
max_str_leng = input('Enter maximum string length: ')
number_str = input('How many random strings to generate? ')

def BatchStringGenerator(number_str, min_str_leng, max_str_leng):
    words = []
    for word in range(number_str):
        if min_str_leng <= max_str_leng:
            num_letters = random.choice(range(min_str_leng, max_str_leng))
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
            
        words.append(RandomStringGenerator(num_letters))
        
    return words

def RandomStringGenerator(num_letters, lst=list(string.ascii_lowercase)+list(string.digits)):
    letter = 0
    string = ''
    while letter<num_letters:
        string += random.choice(lst)
        letter += 1
    return string


print(BatchStringGenerator(int(number_str), int(min_str_leng), int(max_str_leng)))
