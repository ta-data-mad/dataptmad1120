"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
#The importations should be first
import random
import sys

#Functions redefined with lowercase and _.
#Variables renamed more descriptively.
#The list of elements that could be used to form the strings is defined apart as "letters" list.

   
def random_string_generator(str_length , digits):
    count = 0
    created_str = ''
    while count < str_length:
        created_str += random.choice(digits)
        count += 1
    return created_str
    

def batch_string_generator(num_strings, shorter, longer):
    final_list = []
    for i in range(num_strings,):
        actual_lenght = None
        if shorter < longer:
            actual_lenght = random.choice(range(shorter, longer))
        elif shorter == longer:
            actual_lenght = shorter
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
        final_list.append(random_string_generator(actual_lenght, letters))
    
    return final_list

letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
 

min_length = input('Enter minimum string length: ')
max_length = input('Enter maximum string length: ')
list_length = input('How many random strings to generate? ')

print(batch_string_generator(int(list_length), int(min_length), int(max_length)))
