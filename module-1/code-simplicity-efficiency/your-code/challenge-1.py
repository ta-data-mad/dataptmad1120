"""
This is a dumb calculator that can add and subtract whole numbers from 0 to 5.
When you run the code, you are prompted to enter 2 numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""


print('Welcome to this calculator!')
print('It can add and subtract whole numbers from 0 to 5')
a = input('Please choose your first number (0 to 5): ')
b = input('What do you want to do? + or -: ')
c = input('Please choose your second number (0 to 5): ')


def add():
	return f'{a} {b} {c} equals {a+b}'
def substract():
	return f'{a} {b} {c} equals {a-b}'

if a >= 6 or b >= 6
    print("I am not able to answer this question. Check your input.")

print("Thanks for using this calculator, goodbye :)")
