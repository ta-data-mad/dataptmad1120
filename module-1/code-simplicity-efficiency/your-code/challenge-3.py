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
#Changing some variable's name to make it more descriptive. 

def my_function(max_length):
    solutions = []
    #this first for loop is too complicated to turn it to a list comprehension
    for x in range(5, max_length):
        for y in range(4, max_length):
            for z in range(3, max_length):
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
    longest_side_value = 0
#is avaliable to make a list comprehension here

    longest_side_value = max([i for solution in solutions for i in solution])
    return longest_side_value

max_length = input("What is the maximal length of the triangle side? Enter a number: ")
#also improving how to write an string
print(f'The longest side possible is {my_function(int(max_length))}')
