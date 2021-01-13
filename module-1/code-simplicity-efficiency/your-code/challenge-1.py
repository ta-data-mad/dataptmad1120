"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

#I have changed the code to a simple if's condtionals that worked out when I executed. If you insert other number which is not between 0 and 5, it tells you the numbers are not correct and if you don´t insert a plus or minus character, the code tells you, it cannot do the operation.



print('Welcome to this calculator!')

print('It can add and subtract whole numbers from zero to five')

a = int(input('Please choose your first number (zero to five): '))
b = input('What do you want to do? plus or minus: ')
c = int(input('Please choose your second number (zero to five): '))


if a in range(0,6) and c in range (0,6):

    if b == '+':
        print(f'{a} + {c} = {a+c}')

    elif b == '-':
        print(f'{a} - {c} = {a-c}')

    else:
        print('Cannot do the operation. Insert + or -')

else:
    print('The numbers are not correct. I am not that smart :((')


print("Thanks for using this calculator, goodbye :)")
