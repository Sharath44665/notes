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
![NATO.webm](./videos/NATO.webm)



