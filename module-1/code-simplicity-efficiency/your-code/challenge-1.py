"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
""""


print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

a = input ('Please choose your first number (zero to five)')
number1 = int(a)
if number1 not in [0,1,2,3,4,5]:
    raise ValueError ('Input must be an intenger between zero to five')
    
b = input('Please choose your second number (zero to five): ')
number2 = int(b)
if number2 not in [0,1,2,3,4,5]:
    raise ValueError ('Input must be an intenger between zero to five')
    
c = input('What do you want to do? plus (+) or minus (-): ')

    def add(x,y):
        return x + y
    def subtract(x,y):
    return x - y

if c == '+':
    print(number1,"plus",number2, "equals", add(number1, number2))
elif c == '-':
    print(number1,"minus",number2, "equals", subtract(number1, number2))
else:
        print('I am not able to answer this question. Check your input again')
        

print("Thanks for using this calculator! goodbye :)")
