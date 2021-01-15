print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')


a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')


input_numbers = ['zero','one','two', 'three','four','five']
operations = ['plus', 'minus']


if (a not in input_numbers) or (b not in operations) or (c not in input_numbers):
    print("I am not able to answer this question. Check your input (minus or plus).")

dict_numbers = {'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10}


if b == 'plus':
    
    output = dict_numbers[a] + dict_numbers[c]
    print(f'{a} plus {c} equals {list(dict_numbers.keys())[output]}')
    

if b == 'minus':
    output = dict_numbers[a] - dict_numbers[c]
    if output >= 0:
        print(f'{a} minus {c} equals {list(dict_numbers.keys())[output]}')
    if output < 0:
        print(f'{a} minus {c} equals negative {list(dict_numbers.keys())[abs(output)]}')

print("Thanks for using this calculator, goodbye :)")
