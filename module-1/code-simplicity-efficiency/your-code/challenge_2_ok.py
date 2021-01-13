#!/usr/bin/env python
# coding: utf-8

# In[2]:


import random
import string


# In[3]:


a = input("Enter min string length: ")


# In[4]:


b = input("Enter max string length: ")


# In[5]:


n= input("Indicate how many random strings you would like to generate: ")


# In[9]:


def BatchStringGenerator(a,b,n):
    if a < b:
        letters = string.ascii_lowercase + string.digits
        random_string = ["".join(random.choice(letters) for i in range(a,b)) for i in range(n)]
        return random_string
    
    else:
        return "Incorrect string length. Please try again"


# In[10]:


print(BatchStringGenerator(int(a),int(b),int(n)))


# In[ ]:




