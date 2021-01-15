import random
import sys

def RandomStringGenerator(length=12):
    counter = 0
    random_str = ''
    while counter < length:
        random_str += random.choice(letters)
        counter += 1
    return random_str

def BatchStringGenerator(num_str, min_len=8, max_len=12):
    batch_str = []
    for i in range(num_str):
        if min_len < max_len:
            length = random.choice(range(min_len, max_len))
        elif min_len == max_len:
            length = min_len
        batch_str.append(RandomStringGenerator(length))
    return batch_str
        

min_len = int(input('Enter minimum string length: '))
max_len = int(input('Enter maximum string length: '))
num_str = int(input('How many random strings to generate? '))

if min_len > max_len:
    sys.exit('Incorrect min and max string lengths. Try again.')
else:
    letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']
    
    print(BatchStringGenerator(num_str, min_len, max_len))
