def BatchStringGenerator(a, b, n):
    """
    This function generate a list of n random strings.
    
    Example:
    Input: a = 1, b = 10, n = 2
    Output: ['q0z6ypj2u', 'jjx8wyncq']
    """
    import random
    import string
    
    if a < b:
        letters = string.ascii_lowercase + string.digits 
        list_random_str = [''.join(random.choice(letters) for i in range(a, b)) for i in range(n)]
        return list_random_str
    else: 
        return 'Incorrect min and max string lengths. Try again.'

a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')
print(BatchStringGenerator(int(a), int(b), int(n)))
