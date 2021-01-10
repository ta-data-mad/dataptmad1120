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

# Some easy improvements to apply to this code are: provide a better name to the variables (e.g:"hyptenuses") and
# give a different exit in case the input is lower than 5. 

max_length = int(input("What is the maximal length of the triangle side? Enter an integer number larger than 5: "))

def my_function(max_length):
    solutions = []
    for x in range(5, max_length):
        for y in range(4, max_length):
            for z in range(3, max_length):
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
                    
    hypotenuses = []
    for solution in solutions:
        hypotenuse = max(solution)
        hypotenuses.append(hypotenuse)
        max_hypo = max(hypotenuses)
    return max_hypo

if max_length < 5:
    print("Please enter an integer number larger than 5")
else:
    print("The longest side possible is ", my_function(max_length))

