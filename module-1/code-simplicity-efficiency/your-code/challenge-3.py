def longest_side_triangle(max_len):
    """"
    This functions calculates the longest side possible in a right triangle whose 
    sides are not longer than the number you are given. The number has to be up to 5.
    
    Example:
    Input: 15
    Output: 13
    
    Posible_solutions = 
    1. [3, 4, 5]
    2. [6, 8, 10]
    3. [5, 12, 13]
    """
    
    solutions = []
    
    for hypotenuse in range(5, max_len):
        for cathetus_a in range(5, max_len):
            for cathetus_b in range(5, max_len):
                if (hypotenuse**2 == cathetus_a**2 + cathetus_b**2):
                    solutions.append([hypotenuse, cathetus_a, cathetus_b])
                        
    for number in solutions:
        longest_side = max(number)
                    
    return longest_side

max_len = input("What is the maximal length of the triangle side? Enter a number: ")
print("The longest side possible is " + str(longest_side_triangle(int(max_len))))

#I have improving the readability of the code, but I'm sure the for loop can be more improved but I din't know how do it. 