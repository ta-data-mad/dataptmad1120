"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.
"""
#The input variable X has been changed to maximum in order to be more descriptive and avoid capital letters
#The variable m has been changed to long_side in order to be more descriptive
#The function has been rewitten with list comprehension to avoid for loops.

def my_function(maximum):
    solutions = [[x, y, z]
    for x in range(5, maximum)
    for y in range(4, maximum)
    for z in range(3, maximum) if (x**2 == y**2 + z**2)] 

#This second loop should be rewitten avoiding for loop, but I could't reproduce it without errors.
       					
    long_side = 0
    for solution in solutions:
        if long_side < max(solution):
            long_side = max(solution)
    return long_side
    
#The input variable X has been changed to max_length in order to be more descriptive and avoid capital letters. Also "int" command has been included to rise an error if the input is not a number.

max_length = int(input("What is the maximal length of the triangle side? Enter a number: "))

#The input should be a number larger than 5, thus an error message should be included in case the input is not correct.
if (max_length < 5):
    	print("Error! the input number should be larger than 5")
else:
	print(f'The longest side possible is {str(my_function(int(max_length)))}')
