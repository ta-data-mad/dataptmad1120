"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
def BatchStringGenerator(n, a, b):
    
    import random
    import string
        
    if a < b:
            
            # string.ascii_lowercase returns a string with lowercase characters.
            # string.digits returns a string with numeric characters
            
            
            string_lowercase = [''.join(random.choice(string.ascii_lowercase + string.digits)  for i in range(a, b)) for i in range(n)]
            
            return string_lowercase


a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))
