"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')

words_to_numbers = {
'zero': 0,
'one': 1,
'two': 2,
'three': 3,
'four': 4,
'five': 5,
'six': 6,
'seven': 7,
'eight': 8,
'nine': 9
}

numbers_to_words = {
0: 'zero',
1: 'one',
2: 'two',
3: 'three',
4: 'four',
5: 'five',
6: 'six',
7: 'seven',
8: 'eight',
9: 'nine',
10: 'ten',
11: 'eleven',
12: 'twelve',
13: 'thirteen',
14: 'fourteen',
15: 'fifteen',
16: 'sixteen',
17: 'seventeen',
18: 'eighteen'
}

opps = ['plus', 'minus']


if a not in words_to_numbers.keys() or c not in words_to_numbers.keys() or b not in opps:
	print("I am not able to answer this question. Check your input.")
else:
	# print("zero plus zero equals zero")

	if b == 'plus':
		print(f"{a} plus {c} equals {numbers_to_words[words_to_numbers[a] + words_to_numbers[c]]}")
	elif b == 'minus':
		if words_to_numbers[a] >= words_to_numbers[c]:
			print(f"{a} minus {c} equals {numbers_to_words[words_to_numbers[a] - words_to_numbers[c]]}")
		else:
			print(f"{a} minus {c} equals negative {numbers_to_words[-1 * (words_to_numbers[a] - words_to_numbers[c])]}")

print("Thanks for using this calculator, goodbye :)")

