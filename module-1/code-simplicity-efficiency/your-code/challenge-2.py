import random
import string

def BatchStringGenerator(a, b, n):
    if a < b:
        letters = string.ascii_lowercase + string.digits
        random_list = [''.join(random.choice(letters) for i in range(a, b) for i in range(n))]
        return random_list
    else:
        return 'Incorrect min and max string lengths. Try again.'
        
a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(a), int(b), int(n)))
