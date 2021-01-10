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
number1=int(a)

if number1 not in [1,2,3,4,5]:
        raise ValueError("Input should be a number from zero to five")
        
sign = input('What do you want to do? + or -: ')

c = input('Please choose your second number (zero to five): ')
number2=int(c)

if number2 not in [1,2,3,4,5]:
        raise ValueError("Input should be a number from zero to five")


def add(x, y):
      return x + y
    
def subtract(x, y):
        return x - y

if sign=="+":
    print(f'the result is {add(number1,number2)}')
elif sign=="-":
    print(f'the result is {subtract(number1,number2)}')
else:
    raise ValueError("Input should be a - or a +")
    
print("Thanks for using this calculator, goodbye.")
