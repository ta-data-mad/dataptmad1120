"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import string

# I changed the variables names so it was easier to understand both functions.
# Changed the list of detalied letters and digits using import string.
# I had the doubt the import random, 

def RandomStringGenerator(str_lenght=12, accepted_inputs = string.ascii_lowercase + string.digits):
    characters = 0
    string = ''
    while characters < str_lenght:
        import random
        string += random.choice(accepted_inputs)
        characters += 1
    return string


def BatchStringGenerator(strings_to_generate, min_str_len=8, max_str_len=12):
    batch = []
    for i in range(strings_to_generate):
        str_len = None
        if min_str_len < max_str_len:
            import random
            str_len = random.choice(range(min_str_len, max_str_len))
        elif min_str_len == max_str_len:
            str_len = min_str_len
        else:
            import sys
            sys.exit('Incorrect min and max string lengths. Try again.')
        batch.append(RandomStringGenerator(str_len))
    return batch

min_str_len = input('Enter minimum string length: ')
max_str_len = input('Enter maximum string length: ')
strings_to_generate = input('How many random strings to generate? ')

print(BatchStringGenerator(int(strings_to_generate), int(min_str_len), int(max_str_len)))
