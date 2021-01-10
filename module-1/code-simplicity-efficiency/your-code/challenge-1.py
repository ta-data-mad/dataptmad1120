"""
The dumb calculator

In my new code, I have built in a while loop to verify the validity of each of the three input statements (a,b,c). I also added an int condition to a and c to make sure only ints are provided, which in turn allows us to simplify the final calculation statement. 
"""

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

a = int(input('Please choose your first number (0 to 5): '))
while a not in range(0,6):
    print('Number provided must be between 1-5')
    a = int(input('Please correct your first number (0 to 5): '))
else:
    pass
    
b = input('What do you want to do? (- or +): ')
while b != '+' and b != '-':
    print('Operand must be + or -')
    b = input('Please choose operand again (- or +): ')
else:
    pass

c = int(input('Please choose your second number (0 to 5): '))
while c not in range(0,6):
    print('Number provided must be between 1-5')
    c = int(input('Please correct your first number (0 to 5): '))
else:
    pass
    
if b == '+':
    print(f'{a} plus {c} is equal to {a + c}')
if b == '-':
    print(f'{a} minus {c} is equal to {a - c}')


print("Thanks for using this calculator, goodbye :)")
