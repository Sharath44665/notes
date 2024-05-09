- work on logical operation
   - treasure island #
- work on loops, functions
   - [caesar-cipher-1-start](https://github.com/Sharath44665/pythonWorkSpace/tree/main/caesar-cipher-1-start)
- work on dictionary 
   - [auction bidding game](#https://github.com/Sharath44665/pythonWorkSpace/tree/main/caesar-cipher-1-start)
   - [Guess the number](https://github.com/Sharath44665/pythonWorkSpace/tree/main/guess-the-number)

- Work on Class and OOPs 
   - [coffee Machine](https://github.com/Sharath44665/pythonWorkSpace/tree/main/coffee-machine-start) 
   - [Quiz game](https://github.com/Sharath44665/pythonWorkSpace/tree/main/quiz-game-start)

- Work on GUI

    ![turte Graphics](./img/Screenshot_20240509_075622.png)

   - [hirst painting](https://github.com/Sharath44665/pythonWorkSpace/tree/main/hirst-painting)
   - [snake game](https://github.com/Sharath44665/pythonWorkSpace/tree/main/snake-game-better)
   - [pong game](https://github.com/Sharath44665/pythonWorkSpace/tree/main/pong_game) # in linux this game have some problems

- Files
   - [mail merge](https://github.com/Sharath44665/pythonWorkSpace/tree/main/mail-merge)
   - Reading a file

``` py
with open("./Input/Letters/starting_letter.txt") as letterFile:
    # returns the first line
    content = letterFile.readline()
    # returns rest, with list with its content
    fullContent = letterFile.readlines()
```

- pandas
   - [reading csv data](https://github.com/Sharath44665/pythonWorkSpace/tree/main/reading-csv-data)
   - [squirrel census data](https://github.com/Sharath44665/pythonWorkSpace/tree/main/squirrel-census-data)
   - [us state game](https://github.com/Sharath44665/pythonWorkSpace/tree/main/us-states-games)

``` py
import pandas
csvData = pandas.read_csv("weather_data.csv")
```

- list comprehension
   -  [NATO alphabet](https://github.com/Sharath44665/pythonWorkSpace/tree/main/NATO-alphabet)

``` py
myList = [1,2,3]
newList = [n+1 for n in myList]
print(newList) # [2, 3, 4]

name = "Sharath"
newName = [letter for letter in name ]
print(newName) # ['S', 'h', 'a', 'r', 'a', 't', 'h']


doubleList = [val*2 for val in range(1,5)]
print(doubleList) # [2, 4, 6, 8]

print("squaring list:")
squareList = [val*val for val in range(1,6)]
print(squareList) 


names = ["Ada", "Remy", "Kylen", "Alex", "Tristan", "Lian", "Jayleen","Trace"]
# generate a list containing less than or equal to 4 letters of names
namesOf4char = [newName for newName in names if len(newName) < 5]
print(namesOf4char) # ['Ada', 'Remy', 'Alex', 'Lian']
```

[Screencast_20240509_171612.webm](https://github.com/Sharath44665/notes/assets/66732823/902f0e38-1bfa-4548-b586-cf7ce76a48bc)


- args, kwargs
   - [tkinter basics](https://github.com/Sharath44665/pythonWorkSpace/tree/main/basics-tkinter)
   - [miles to km project](https://github.com/Sharath44665/pythonWorkSpace/tree/main/miles-to-km-converter)


``` py
# args:

def add(*args):
    sum = 0
    for val in args:
        sum += val

    print(sum)

add(3,4,10) # 17

# -------------------------
# kwargs:

def calculate(**kwargs): # kwargs = Key Word Arguments
    # print(kwargs) # {'add': [1, 2], 'multiply': (2, 3, 4)}
    sum = 0
    answer = 1
    for key,value in kwargs.items():

        if key == "add":
            for val in value:
                sum += val

        if key == "multiply":
            for val in value:
                answer *= val
    return [sum, answer]

answer = calculate(add= [1,2])
print(answer) # [3,1] = [sum, answer]
answer = calculate(multiply= [1,2])
print(answer) # [0,2] = = [sum, answer]

# ----------
# excercise

class Car:
    def __init__(self, **kwargs):
        self.color = kwargs.get("color")  # getting from dictionary
        self.model = kwargs.get("model")  # if you dont pass model, then it will return None


carOne = Car(color="blue", model="audi")
print(carOne.color) # blue
print(carOne.model) # audi
carTwo = Car(model="innova")
print(carTwo.color) # None
print(carTwo.model) # innova
```
- pomodoro game
  
[Screencast_20240509_201943.webm](https://github.com/Sharath44665/notes/assets/66732823/a8da7fdc-f42f-4a9c-a8c6-23db9e395e9c)

- password manager

| 1 ![firstImg](./img/Screenshot_20240509_203347.png) | 2 ![secondImg](./img/Screenshot_20240509_203501.png) |
| --- | --- |
| 3 ![third img](./img/Screenshot_20240509_203550.png) | No img |

- try catch basics:

``` py
try:
    with open("some.txt") as myFile:
        myFile.read()
except:
    print("something went wrong")

# something went wrong

try:
    with open("data.txt") as dataFile:
        pass
    mydict ={"a": "apple"}
    print(mydict["b"])
except FileNotFoundError: # if no file, create file
    print("file not found, so file is created") 
    with open("data.txt", mode="w") as myFile:
        pass
except KeyError: # if no key found, print the following
    print("Hey that key not found")

# ---- important ---
try:
    with open("data.txt") as dataFile:
        pass
    mydict ={"a": "apple"}
    print(mydict["b"])
    print(mydict["a"])
except FileNotFoundError:
    print("file not found, so file is created")
    with open("data.txt", mode="w") as myFile:
        myFile.write("Hello, this is something")
        pass
except KeyError as errorMsg: # errorMsg is not key word, its just a variable, can name anything you want
    print(f"Hey, that key: {errorMsg} not found") # Hey, that key: 'b' not found

else: # optional
    # if there is exception following code NOT WORK
    # if there is no exceptions following code will execute
    with open("data.txt") as myFile:
        content = myFile.read()
        print(content)

finally: # optional, prints the following no matter what
    print("this prints finally")
```

``` py
# raise exception example 1
try:
    with open("data.txt") as dataFile:
        pass
    mydict = {"a": "apple"}
    # print(mydict["b"])
    print(mydict["a"])
except FileNotFoundError:
    print("file not found, so file is created")
    with open("data.txt", mode="w") as myFile:
        myFile.write("Hello, this is something")
        pass
except KeyError as errorMsg:  # errorMsg is not key word, its just a variable, can name anything you want
    print(f"Hey, that key: {errorMsg} not found")

else:  # optional
    # if there is exception following code not work
    # if there is no exceptions following code will execute
    with open("data.txt") as myFile:
        content = myFile.read()
        print(content)

finally:  # optional
    # print("this prints finally")
    raise IndexError("index error has been raised by me") 
```

output:

![Screenshot_20240509_211738.png](./img/Screenshot_20240509_211738.png)

``` py
# raise exception example 2
height = float(input("Enter Hieght: "))
weight = int(input("Enter weight: "))

if height >3:
    raise ValueError("Human height should not be greater than 3 meters")
bmi = weight/(height*height)
print(bmi)
```
output

![Screenshot_20240509_212419.png](./img/Screenshot_20240509_212419.png)



