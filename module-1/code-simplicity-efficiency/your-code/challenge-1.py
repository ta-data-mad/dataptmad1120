print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')


a = int(input('Please choose your first number (zero to five): '))
b = input('What do you want to do? plus or minus: ')
c = int(input('Please choose your second number (zero to five): '))


if a >= 0 and a <= 5 and c >= 0 and c <= 5:
    if b == "plus":
        print (f'{a} {b} {c} equals {a + c}')
    elif b == "minus":
        print (f'{a} {b} {c} equals {a - c}')
    else:
        print("I am not able to answer this question. Check your input (minus or plus).")
else:
    print("I am not able to answer this question. Check your input (from zero to five).")

print("Thanks for using this calculator, goodbye :)")
