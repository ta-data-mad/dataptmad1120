#!/usr/bin/env python
# coding: utf-8

# In[1]:


def longest_side_length(max_length):
    solutions = []
    for x in range(5, max_length):
        for y in range(4, max_length):
            for z in range(3, max_length):
                if (x**2 == y**2 + z**2):
                    solutions.append([x, y, z])
    
    for number in solutions:
        longest_side = max(number) 
    
    return longest_side

max_len = input("What is the maximal length of the triangle side? Enter a number: ")

print("The longest side possible is " + str(longest_side_length(int(max_len))))


# In[ ]:




