print("1. What is the form and type of the control expression?")
print("1.1 Forms of control expression")

# variable
x = 1
match x:
    case 1:
        print("x is 1")
    case 2:
        print("x is 2")

# arithmetic expression
x = 1
y = 2
match x+y:
    case 2:
        print("x+y is 2")
    case 3:
        print("x+y is 3")

# literal value
match "hello":
    case "hello":
        print("hello")
    case _:
        print("not hello")

# function call
def test():
    return 1

match test():
    case 1:
        print("test() is 1")
    case _:
        print("test() is not 1")


print("1.2 Types of the control expression")
# int
x = 1
print(type(x))
match x:
    case 1:
        print("x is 1")
    case 2:
        print("x is 2")

# str
x = "hello"
print(type(x))
match x:
    case "hello":
        print("x is 'hello'")
    case "world":
        print("x is 'world'")

# bool 
x = True
print(type(x))
match x:
    case True:
        print("x is True")
    case False:
        print("x is False")

# float
x = 1.0
print(type(x))
match x:
    case 1.0:
        print("x is 1.0")
    case 2.0:
        print("x is 2.0")

# tuple
x = (1, 2)
print(type(x))
match x:
    case (1, 2):
        print("x is (1, 2)")
    case (2, 1):
        print("x is (2, 1)")
    

# list
x = [1, 2]
print(type(x))
match x:
    case [1, 2]:
        print("x is [1, 2]")
    case [2, 1]:
        print("x is [2, 1]")


# dictionary
x = {"a": 1, "b": 2}
print(type(x))
match x:
    case {"a": 1, "b": 2}:
        print("x is {'a': 1, 'b': 2}")
    case {"b": 2, "a": 1}:
        print("x is {'b': 2, 'a': 1}")

# object
class ObjectForMatch:
    def __init__(self, num):
        self.num = num

x = ObjectForMatch(1)
y = ObjectForMatch(2)
z = ObjectForMatch(1)

print(type(x))
print(type(y))
print(type(z))
match x:
    case ObjectForMatch() if x.num == y.num: # if the if part is not used, it will give error: 
                            #Irrefutable pattern is allowed only for the last case 
        print("x is y")
    case ObjectForMatch() if x.num == z.num: 
        print("x is z")
    case _:
        print("default case")

print("\n\n2. How are the selectable segments specified?")

var = 1
match var:
    case 1:
        print("Matched 1")
        def test():
            return "Inside case 1"
        
        print(test())
        list1 = [3, 2, 1]
        list1.sort()
        print("Sorted list:", list1)
        var = 3
    case 2:
        print("Matched 2")
    case 3:
        print("Matched 3")


print("\n\n 3. Is execution flow through the structure restricted to include just a single selectable segment?")
var = 1
match var:
    case 1:
        print("var is 1")
        var = 3
    case 1:
        print("var is 1 again")
    case 3:
        print("var is 3")
print(var)

print("\n\n 4. How are the case values specified?")
var = 1
var2 = 1
match var:
    case "irem":
        print("var is irem")
    case [1, 2]:
        print("var is [1, 2]")
    case (1, 2):
        print("var is (1, 2)")
    case {"a": 1, "b": 2}:
        print("var is {'a': 1, 'b': 2}")
    case _ if var2 == var:
        print("var is var2")
    case _:
        print("not found")

x = 5
var2 = 10

match x:
    case var2:  
        print(f"var2 is {var2}")  


print("\n\n 5. What is done about unrepresented expression values?")
var = 2
match var:
    case 1:
        print("var is 1")
    case _:
        print("not found")
        
match var:
    case 1:
        print("var is 1")




