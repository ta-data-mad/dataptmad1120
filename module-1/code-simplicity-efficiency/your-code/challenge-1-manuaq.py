"""
This is a dumb calculator that can add and subtract whole numbers from 0 (zero) to 5 (five).
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""
#This will calculator will add or substrack numbers from 0 to 5. 

# This function adds two numbers
def add(a,b):
    return a + b

# This function subtracs two numbers
def subtract(a,b):
    return a - b


#I TRIED CREATING LIST OF ACCEPTED INPUTS, TO TRY TO LIMIT MY ACCEPTED INPUTS. 
numbers_list = [0,1,2,3,4,5]
numbers_strings = ["0","1","2","3","4","5"]
numbers_words_strings = ["zero","one","two","three","four","five"]
word_numbers_dict = {"zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5}

print("\n")
print('Welcome to this calculator!')
print('It can add and subtract whole numbers from 0 (zero) to 5 (five)')
first_number = input('Please choose your first number 0 (zero) to 5 (five): ').lower()


#FOR SOME REASON I STRUGGLED USING "if first_number not in numbers_list or numbers_strings or numbers_words_strings"
#IT KEPT TRIGGERING THE ERROR SO I SWITCHED TO THIS DOWN HERE

if first_number not in [0,1,2,3,4,5,"0","1","2","3","4","5","zero","one","two","three","four","five"]:
    print("\n")
    raise ValueError("This calculator only takes numbers from 0 (zero) to 5 (five). Please check your input")
else:
    pass

# I DID THIS TO KEEP THE POSIBILITY OF INTERPRETING ENGLISH WORD NUMBERS
#ALL NUMBERS FOR THIS CALCULATOR WILL BE ONE DIGIT AND WRITTEN NUMBERS WILL NOT
if len(first_number) == 1:
    first_number = int(first_number)
elif len(first_number) > 1:
    first_number = word_numbers_dict.get(first_number)
        
b = input('What do you want to do?  "ADD"/"plus" (+) or "SUBTRACT"/"minus" (-):').lower()

#WITH THIS STEP, SINCE IT WILL ACCEPT LETTERS OR NUMBERS AS THE FIRST INPUT, I ALSO KEPT THIS ENGLISH WORD FUNCTIONALITY
#FOR THE OPERATOR
if b not in ['add', 'plus', '+','subtract', 'minus', '-']:
    raise ValueError("Please check operation input and try again")

second_number = input('Please choose your second number 0 (zero) to 5 (five): ').lower()

if len(second_number) == 1:
    second_number = int(second_number)
elif len(second_number) > 1:
    second_number = word_numbers_dict.get(second_number)


if b in ['add', 'plus', '+']:
    print(first_number, "+", second_number, "=", add(first_number, second_number))
if b in ['subtract', 'minus', '-']:
    print(first_number, "-", second_number, "=", subtract(first_number, second_number))

print("Thanks for using this calculator, goodbye :)")
