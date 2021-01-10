print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
a = input('Please choose your first number (zero to five): ')

first_input = (int(a))

if first_input not in [0,1,2,3,4,5]:
    print('Please choose an integer from 0 to 5')
    
b = input('What do you want to do? plus or minus: ')

c = input('Please choose your second number (zero to five): ')

second_input = (int(c))

if second_input not in [0,1,2,3,4,5]:
    print('Please choose an integer from 0 to 5')

if b == 'plus':
    print(f'{first_input} plus {second_input} equals to {first_input+second_input}')

if b == 'minus':
    print(f'{first_input} minus {second_input} equals to {first_input-second_input}')

print("Thanks for using this calculator, goodbye :)")