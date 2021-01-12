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
# first goes the input, the variable will be renamed to something easier to understand and add the int():

input_value = int(input("What is the maximal length of the triangle side? Enter a number: "))


def my_function(input_value):
    solutions = []
    for x in range(5, input_value):
        for y in range(4, input_value):
            for z in range(3, input_value):
                if (x**2 == y**2 + z**2):       # change the formula to be easier to understand
                    solutions.append([x, y, z])
    maximum = max([i for lst in solutions for i in lst])   # changed name m for maximum for better readability and changed to a list comprehension
    return maximum

print(f'The longest side possible is {my_function(input_value)}')  # converted to f-string
