"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import random
import sys
import string 

min_length = input('Enter minimum string length: ')
max_length  = input('Enter maximum string length: ')
string_number = input('How many random strings to generate? ')

strings = []
letters = None


def BatchStringGenerator(string_number, max_length, min_length):
    for i in range(string_number):
        if min_length <= max_length:
            letters = random.choice(range(min_length, max_length))
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
            
        strings.append(RandomStringGenerator(letters))
    return strings



def RandomStringGenerator(letters,lst_posible=list(string.ascii_lowercase)+list(string.digits)):
    number = 0
    string = ''
    while number<letters:
        string += random.choice(lst_posible)
        number += 1
    return string

print(BatchStringGenerator(int(string_number), int(max_length), int(min_length)))
