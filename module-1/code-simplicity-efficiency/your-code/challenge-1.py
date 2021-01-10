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
a = int(input('Please choose your first number (zero to five): '))
b = input('What do you want to do? plus or minus: ')
c = int(input('Please choose your second number (zero to five): '))

if a >= 0 and a <= 5 and c >= 0 and c <= 5:
    if b == "plus":
        print(f'{a} {b} {c} equals {a+c}')
    elif b == "minus":
        print(f'{a} {b} {c} equals {a-c}')
    else:
        print("I am not able to answer this question. Choose between plus or minus.")
else: 
    print("I am not able to answer this question. Choose numbers between zero and five.")
    
print('Thank you for using this calculator, goodbye!')
