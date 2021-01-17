"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

# First make one print instead 2. 

operands = {
            "zero": 0,
            "one": 1,
            "two": 2,
            "three": 3,
            "four": 4,
            "five": 5
           }

def do_operation(first_number, add_minus, second_number):
    
    # Check input
    if first_number not in operands.keys() or second_number not in operands.keys():
        return "I am not able to answer this question. Check your input."
    # Sum
    if add_minus == "plus":
        return operands[first_number] + operands[second_number]
    # Substract
    elif add_minus == "minus":
        return operands[first_number] - operands[second_number]
    # unrecognised operand
    else:
        print("unrecognised operand. Please specify 'plus' or 'minus'")
        return
    
def calculator():
    print('''Welcome to this calculator!
        It can add and subtract whole numbers from zero to five''')

    # Verbose variables

    first_number = input('Please choose your first number (zero to five): ')
    add_minus = input('What do you want to do? plus or minus: ')
    second_number = input('Please choose your second number (zero to five): ')

    print(f'your result is: {do_operation(first_number, add_minus, second_number)}')
    print("Thanks for using this calculator, goodbye :)")

calculator()






