def my_function(max_lenght):
    solutions = []
    for x in range(5, max_lenght):
        for y in range(4, max_lenght):
            for z in range(3, max_lenght):
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
    m = 0
    for solution in solutions:
        if m < max(solution):
            m = max(solution)
    return str(m)

X = int(input("What is the maximal length of the triangle side? Enter a number: "))

if X < 5:
    print('Please introduce a number larger than 5')
else:
    print('The longest side possible is ' + my_function(X))
