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

#imput variable renamed

def my_function(input):
    solution = []
    for x in range(5, input):
        for y in range(4, input):
            for z in range(3, input):
#formula in a clever way
                if (x**2 == y**2 + z**2):     
                    solution.append([x, y, z])
#list comprehension used                   
#variable m renamed
    maximum = max([i for lst in solution for i in lst])  
    return maximum

print(f'The longest side possible is {my_function(value)}'
