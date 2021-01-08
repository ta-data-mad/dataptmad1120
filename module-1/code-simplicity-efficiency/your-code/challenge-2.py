"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

import random
import sys


def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
	result = ""

	for i in range(l):
		result += random.choice(a)

	return result


def BatchStringGenerator(num_random_strings, min_string_len=8, max_string_len=12):
	result = []
	string_len_ranges = list(range(min_string_len, max_string_len + 1))

	if len(string_len_ranges) == 0:
		sys.exit('Incorrect min and max string lengths. Try again.')

	for i in range(num_random_strings):
		string_len = random.choice(string_len_ranges)
		result.append(RandomStringGenerator(string_len))

	return result


a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))

