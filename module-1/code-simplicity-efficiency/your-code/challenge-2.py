"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

def RandomStringGenerator(length=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    count = 0
    string = ''
    while count<length:
        import random
        string += random.choice(a)
        count += 1
    return string

def BatchStringGenerator(number_of_random_strings, min_length=8, max_length=12):
    list_of_strings = []
    for i in range(number_of_random_strings):
        length = None
        if min_length < max_length:
            import random
            length = random.choice(range(min_length, max_length))
        elif min_length == max_length:
            length = min_length
        else:
            import sys
            sys.exit('Incorrect min and max string lengths. Try again.')
        list_of_strings.append(RandomStringGenerator(length))
    return list_of_strings

min_length = input('Enter minimum string length: ')
max_length = input('Enter maximum string length: ')
number_of_random_strings = input('How many random strings to generate? ')

print(BatchStringGenerator(int(number_of_random_strings), int(min_length), int(max_length)))


#the only thing that I think I could do with this code is change the variable's names to make them more descriptive.
#Even though, I tried to make the same thing with this code below:

#import secrets
#import random
#
#def RandomStringGenerator(number, min_lenght, max_lenght):
#    n = 0
#    string_list = []
#    lenght = random.choice(range(min_lenght, max_lenght))
#    while n < number:
#        string_list.append(secrets.token_urlsafe(lenght))
#        n += 1
#    return string_list
#RandomStringGenerator(3, 5, 10)

#My problem is that I don't know why each string isn't generated with different lenghts as the main code. 