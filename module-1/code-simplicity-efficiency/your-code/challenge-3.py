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

# Improved code
# print statement changed to f-string 
# One letter variables changed to more descriptive names: m= max_length ; x = input_int ; X = value
# Variable type changes moved from print statement 

def my_function(value):
    solutions = []
    for x in range(5, value):
        for y in range(4, value):
            for z in range(3, value):
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
    #list comprehension does not seem clear with three for loops.
    max_length = 0
    #print(solutions) could help debugging
    for solution in solutions:
        if max_length < max(solution):
            max_length = max(solution)
    return str(max_length)

input_int = int(input("What is the maximal length of the triangle side? Enter a number: "))

print(f"The longest side possible is {my_function(input_int)}")





# Original code
# def my_function(X):
#     solutions = []
#     for x in range(5, X):
#         for y in range(4, X):
#             for z in range(3, X):
#                 if (x*x==y*y+z*z):
#                     solutions.append([x, y, z])
#     m = 0
#     for solution in solutions:
#         if m < max(solution):
#             m = max(solution)
#     return m

# X = input("What is the maximal length of the triangle side? Enter a number: ")

# print("The longest side possible is " + str(my_function(int(X))))
