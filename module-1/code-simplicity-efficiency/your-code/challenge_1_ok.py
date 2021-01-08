#!/usr/bin/env python
# coding: utf-8

# ### Challenge 1 : code simplicity and efficiency

# In[ ]:


print('Welcome to this calculator!')
print('It can add and subtract whole numbers from 1 to 5')


# In[ ]:


input_first_number = input('Please choose your first number (0 to 5):  ')
first_number = int(input_first_number)

if first_number not in [0,1,2,3,4,5]:
    raise ValueError("Input should be an interger from 0 to 5")


# In[ ]:


input_second_number = input('Please choose your second number (0 to 5): ')
second_number = int(input_second_number)

if second_number not in [0,1,2,3,4,5]:
    raise ValueError("Input should be an interger from 0 to 5")


# In[ ]:


arithmetic_operation = input('Do you want to add or subtract? Enter + or - : ')


# In[ ]:


def add(x, y):
    return x + y


# In[ ]:


def subtract(x, y):
    return x - y


# In[ ]:


if arithmetic_operation == "+":
    print(first_number, arithmetic_operation, second_number, "=", add(first_number, second_number))
elif arithmetic_operation == "-":
    print(first_number, arithmetic_operation, second_number, "=", subtract(first_number, second_number))
else:
    print("Check out the input of the arithmetic_operation")


# In[ ]:

print("Thank you for using this calculator")
