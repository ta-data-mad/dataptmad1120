"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

#I have redesigned the code putting the imports at the top and naming the variables correctly.

import random
import sys



def RandomStringGenerator(length=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    
    counter = 0
    string = ''

    while counter<length:
        
        string += random.choice(a)
        counter += 1

    return string

def BatchStringGenerator(number_strings, min_len=8, max_len=12):
      string_list = []
      
      for i in range(number_strings):


            if min_len < max_len:

                  choice_length = random.choice(range(min_len, max_len))

            elif min_len == max_len:

                  choice_length = min_len

            else:
            
                  sys.exit('Incorrect min and max string lengths. Try again.')
            string_list.append(RandomStringGenerator(choice_length))
    return string_list

min_len = input('Enter minimum string length: ')
max_len = input('Enter maximum string length: ')
number_strings = input('How many random strings to generate? ')

print(BatchStringGenerator(int(number_strings), int(min_len), int(max_len)))
