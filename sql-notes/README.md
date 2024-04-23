### creating Table:

``` sql
CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
```

``` sql
INSERT INTO cats(name, age)
VALUES('Charlie', 17);

INSERT INTO cats(name, age)
VALUES('Connie', 10);

SELECT * FROM cats;
```
![table-show](./img/Screenshot_20240413_130123.png)

### Run a file
``` sql
source file_name.sql
```
### working with Concat
```sql
SELECT CONCAT("Hello", "World") 
```
output:

![~/Downloads/Screenshot_20240413_144638.png](./img/Screenshot_20240413_144638.png)

``` sql
select author_fname, author_lname FROM books;
```
output:
![Screenshot_20240413_144216](./img/Screenshot_20240413_144216.png)

``` sql
SELECT CONCAT(author_fname, " ", author_lname) FROM books; 
```

output:
![~/Downloads/Screenshot_20240413_145113.png](./img/Screenshot_20240413_145113.png)

#### fancy heading
``` sql
SELECT CONCAT(author_fname, " ", author_lname) AS 'Full name' FROM books; 
```

output:
![~/Downloads/Screenshot_20240413_145520.png](./img/Screenshot_20240413_145520.png)

``` sql
SELECT author_fname AS first, 
	author_lname AS last, 
	CONCAT(author_fname, " ", author_lname) AS 'Full name' FROM books;
```

output:
![~/Downloads/Screenshot_20240413_150407.png](./img/Screenshot_20240413_150407.png)

#### CONCAT_WS:
``` sql
SELECT CONCAT_WS(" - ",title,author_fname,author_lname) AS 'Title - first - last' FROM books;
```

output:
![~/Downloads/Screenshot_20240413_151722.png](./img/Screenshot_20240413_151722.png)

### working on SUBSTRING or SUBSTR

``` sql
SELECT SUBSTRING('Hello world ', 1, 4 ) AS demo;
```

output:
![~/Downloads/Screenshot_20240413_152340.png](./img/Screenshot_20240413_152340.png)

``` sql
SELECT SUBSTRING('Hello world ', 7) AS demo;
```

![~/Downloads/Screenshot_20240413_152530.png](./img/Screenshot_20240413_152530.png)

``` sql
SELECT SUBSTRING('Hello world ', -3) AS demo;
```
![~/Downloads/Screenshot_20240413_153122.png](./img//Screenshot_20240413_153122.png)

``` sql
SELECT SUBSTRING(title, 1, 10) AS 'Substring of title' FROM books;
```

O/p:
![Screenshot_20240413_153601](./img/Screenshot_20240413_153601.png)

``` sql
SELECT CONCAT(
	SUBSTRING(title, 1, 10),
	"...") AS 'Short title' FROM books;
```

O/p:
![Screenshot_20240413_154213](./img/Screenshot_20240413_154213.png)

### working with REPLACE
 -  case sensitive

``` sql
SELECT REPLACE("Hello world", "Hell", "abcd") AS demo;
```
![Screenshot_20240413_154939.png](./img/Screenshot_20240413_154939.png)

``` sql
SELECT REPLACE("Hello world", "l", "8") AS demo;
```
![Screenshot_20240413_155232.png](./img/Screenshot_20240413_155232.png)

``` sql
SELECT REPLACE("cheese bread coffee milk", " ", " and ") AS demo;
```
![Screenshot_20240413_155634.png](./img/Screenshot_20240413_155634.png)

``` sql
SELECT REPLACE(title, "e", "3") AS 'title Replace e with 3' FROM books;
``` 
![Screenshot_20240413_160025.png](./img/Screenshot_20240413_160025.png)


### woring with REVERSE
``` sql
SELECT REVERSE('Hello World') AS demo;
``` 
![Screenshot_20240413_160429.png](./img/Screenshot_20240413_160429.png)

### woring with CHAR_LENGTH

``` sql
SELECT CHAR_LENGTH('Hello world') AS demo;
```
![Screenshot_20240413_161331.png](./img/Screenshot_20240413_161331.png)


``` sql
SELECT title, CHAR_LENGTH(title) AS 'Title length' FROM books;

```
![Screenshot_20240413_161654.png](./img/Screenshot_20240413_161654.png)


### working with UPPER, LOWER

``` sql
SELECT UPPER('hello World') as demo;
```

![Screenshot_20240413_162312.png](./img/Screenshot_20240413_162312.png)

``` sql
SELECT LOWER('hello World') as demo;
``` 

![Screenshot_20240413_162548.png](./img/Screenshot_20240413_162548.png)

***

### working with DISTINCT

``` sql
SELECT DISTINCT author_lname FROM books;
``` 
![Screenshot_20240413_165432.png](./img/Screenshot_20240413_165432.png)

``` sql
SELECT DISTINCT CONCAT(author_fname , " ", author_lname ) as FullName FROM books;
```
![Screenshot_20240413_170034.png](./img/Screenshot_20240413_170034.png)

``` sql
MariaDB [mydb]> SELECT DISTINCT author_fname, author_lname FROM books;
``` 
![Screenshot_20240413_170415.png](./img/Screenshot_20240413_170415.png)

### Sorting ORDER BY
- works on numbers
- works on strings
``` sql
SELECT author_lname FROM books ORDER BY author_lname;
``` 
> above one is ascending order by default

![Screenshot_20240413_170830.png](./img/Screenshot_20240413_170830.png)

``` sql
SELECT author_lname FROM books ORDER BY author_lname DESC;
``` 
> Descending order

![Screenshot_20240413_171304.png](./img/Screenshot_20240413_171304.png)

``` sql
SELECT title, pages , released_year FROM books ORDER BY released_year ;
``` 

![Screenshot_20240413_171905.png](./img/Screenshot_20240413_171905.png)

**please Note** that, you can avoid using **released_year**  in SELECT => which works totally fine.

``` sql
SELECT title, pages FROM books ORDER BY released_year ;
``` 

``` sql
SELECT title, pages , released_year FROM books ORDER BY 3 ;
```

see the pic below

![Screenshot_20240413_172638.png](./img/Screenshot_20240413_172638.png)

#### at ORDER BY you can add two or more columns.

``` sql
SELECT author_fname , author_lname FROM books ORDER BY author_fname , author_lname ;
``` 

![Screenshot_20240413_173423.png](./img/Screenshot_20240413_173423.png)

### Using LIMIT
``` sql
SELECT title FROM books LIMIT 3;
``` 
![Screenshot_20240413_173947.png](./img/Screenshot_20240413_173947.png)

get 5 latest released books:

``` sql
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
``` 
or

``` sql
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0, 5;
``` 

![Screenshot_20240413_174249.png](./img/Screenshot_20240413_174249.png)

### Better searches using LIKE

get books having author name 'da'?

``` sql
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
``` 

![Screenshot_20240413_181052.png](./img/Screenshot_20240413_181052.png)


get books **starting** author name from 'da'?

``` sql
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
``` 

![Screenshot_20240413_181408.png](./img/Screenshot_20240413_181408.png)

get the quatity having 4 charecters/digits?

``` sql
SELECT title , stock_quantity FROM books WHERE stock_quantity LIKE "____";
``` 
![Screenshot_20240413_182110.png](./img/Screenshot_20240413_182110.png)

search for books having title "%" symbol

or

search for books having title "%" symbol

see below.

``` sql
SELECT title, pages FROM books WHERE title LIKE '%\%%';
```

![Screenshot_20240413_182851.png](./img/Screenshot_20240413_182851.png)

``` sql
SELECT title, pages FROM books WHERE title LIKE '%\_%';
```

![Screenshot_20240413_183056.png](./img/Screenshot_20240413_183056.png)

### Aggregate Functions

### COUNT

How many books in the table?

``` sql
SELECT count(*) from books;
``` 

![Screenshot_20240413_185157.png](./img/Screenshot_20240413_185157.png)

``` sql
SELECT count(DISTINCT author_fname ) FROM books;
```

![Screenshot_20240413_185726.png](./img/Screenshot_20240413_185726.png)

Display total number of unique authors

``` sql
SELECT COUNT(DISTINCT author_lname , author_fname ) FROM books;
``` 

![Screenshot_20240413_190152.png](./img/Screenshot_20240413_190152.png)


How many titles contain "the"?

``` sql
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
``` 
![Screenshot_20240413_190724.png](./img/Screenshot_20240413_190724.png)

``` sql
SELECT title, author_lname FROM books GROUP BY author_lname ;
```
![Screenshot_20240413_192236.png](./img/Screenshot_20240413_192236.png)

the above image is grouped like this:

![Screenshot_20240413_192405.png](./img/Screenshot_20240413_192405.png)

``` sql
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname ;
``` 
![Screenshot_20240414_211150.png](./img/Screenshot_20240414_211150.png)

``` sql
-- try this code also;
SELECT author_fname , author_lname , COUNT(*) FROM books GROUP BY author_fname , author_lname ;
```

get the count of books that released in respective year:

``` sql
SELECT released_year , COUNT(*) FROM books GROUP BY released_year ;
```

### using MIN and MAX

Get minimum pages in the books

``` sql
SELECT MIN(pages ) FROM books;
```

![Screenshot_20240414_213136.png](./img/Screenshot_20240414_213136.png)

// respectively MAX works for highest values

### SubQuery

**Q**: What if i want the title of the longest Book?

``` sql
SELECT title , pages FROM books WHERE pages = (SELECT  MAX(pages) FROM books);
```

OR 

``` sql
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
```

![Screenshot_20240415_132609.png](./img/Screenshot_20240415_132609.png)

**Q**: Name the book having longest title?

### MIN and MAX using GROUP BY

**Q:** Find the year each author published their first book?

``` sql
SELECT author_fname , author_lname , MIN(released_year) AS 'first released' 
    FROM books 
    GROUP BY author_lname , author_fname ;
```

![Screenshot_20240415_134643.png](./img/Screenshot_20240415_134643.png)

### Using SUM

``` sql
SELECT SUM(pages) FROM books;
```

![Screenshot_20240415_162113.png](./img/Screenshot_20240415_162113.png)


Sum all page each author has written

``` sql
SELECT author_fname , author_lname , SUM(pages) AS 'total pages' FROM books GROUP BY author_fname , author_lname ;
``` 

![Screenshot_20240418_125910.png](./img/Screenshot_20240418_125910.png)

### The AVG functions

``` sql
SELECT AVG(released_year ) FROM books;
```

![Screenshot_20240418_130308.png](./img/Screenshot_20240418_130308.png)

**Q**: calculate the average stock quantity for books released in the same year 

``` sql
SELECT released_year , AVG( stock_quantity ) AS 'average sold'  FROM books GROUP BY released_year ;
``` 

![Screenshot_20240418_130904.png](./img/Screenshot_20240418_130904.png)

Q: print the number of books in the database?

Q: print out how many books released in each year?

Q: print out the total number of books in stock? 

Q: find the average released year by each author?

Q: find the full name of author who wrote a longest book?

Q: print this:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![Screenshot_20240418_133953.png](./img/Screenshot_20240418_133953.png)

solution:

``` sql
-- print the number of books in the database?
SELECT COUNT(*) FROM books;

-- print out how many books released in each year?
SELECT released_year , COUNT(*) FROM books GROUP BY released_year ;

-- print out the total number of books in stock? 
SELECT SUM( stock_quantity ) AS 'Total number of books' FROM books;

-- find the average released year by each author?
SELECT CONCAT(author_fname , " ", author_lname ) AS 'Author', AVG( released_year ) FROM books GROUP BY author_lname, author_fname;

-- find the full name of author who wrote a longest book?
SELECT CONCAT(author_fname , author_lname ) AS 'Full name' , pages AS 'big book page no' FROM books WHERE pages= (SELECT MAX(pages) FROM books);

-- last question
select released_year as year , count(*) as '#books' , AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ;
```

### DATE, TIME, DATETIME
- DAY()
- DAYNAME()
- DAYOFWEEK()
- DAYOFYEAR()

### Using CURDATE, CURTIME, NOW
``` sql
INSERT INTO people(name, birthdate,  birthtime,birthdt )
    VALUES('Microwave', CURDATE(), CURTIME(),NOW());
```

![Screenshot_20240418_153524](./img/Screenshot_20240418_153524.png)

### Formatting DATE

[click here to check the docs](https://www.w3schools.com/sql/func_mysql_date_format.asp)
``` sql
SELECT name ,DAY(birthdate) FROM people;
```

![Screenshot_20240418_160139](./img/Screenshot_20240418_160139.png)

``` sql
SELECT name ,DAYNAME(birthdate), birthdate FROM people;
```

![Screenshot_20240418_160356](./img/Screenshot_20240418_160356.png)

``` sql
SELECT name ,DAYOFWEEK(birthdate), birthdate FROM people;
```

![Screenshot_20240418_160517](./img/Screenshot_20240418_160517.png)

``` sql
SELECT name ,DAYOFYEAR(birthdt), birthdt FROM people;
```

![Screenshot_20240418_162344](./img/Screenshot_20240418_162344.png)

``` sql
SELECT name , MONTH(birthdate), birthdate FROM people;
```

![Screenshot_20240418_163445](./img/Screenshot_20240418_163445.png)

``` sql
SELECT name , MONTHNAME(birthdate), birthdate FROM people;
```

![Screenshot_20240418_164335](./img/Screenshot_20240418_164335.png)

``` sql
SELECT name , HOUR(birthtime), birthtime FROM people;
```

![Screenshot_20240418_164503](./img/Screenshot_20240418_164503.png)

// Using above, do same for MINUTE

**Q**: get 'april 04th 2024'

``` sql
SELECT name, CONCAT( month(birthdate), " ", DAY(birthdate),"th ", YEAR(birthdate)) AS 'new date' FROM people;
```

![Screenshot_20240418_175542](./img/Screenshot_20240418_175542.png)

// other examples

``` sql
SELECT name, DATE_FORMAT(birthdt, '%W %M %Y') FROM people;

-- or 
-- SELECT name, DATE_FORMAT(birthdt, '%W-%M-%Y') FROM people;
```

![Screenshot_20240418_175846](./img/Screenshot_20240418_175846.png)

``` sql
SELECT name, DATE_FORMAT(birthdt, '%D/%c/%Y'), birthdate FROM people;
```

![Screenshot_20240418_182026](./img/Screenshot_20240418_182026.png)

#### DATEDIFF

``` sql
SELECT name, birthdate, DATEDIFF(NOW(), birthdt) FROM people;
```

![Screenshot_20240418_183214](./img/Screenshot_20240418_183214.png)

**TIMESTAMP and DATETIME are used to store date and time values, but they have some differences**:

1. DATETIME stores the date and time value as two separate entities, with a **range of** '0000-01-01 00:00:00' to '9999-12-31 23:59:59'.

2. TIMESTAMP, on the other hand, stores both date and time as a single entity and is typically used to record the time of an event (like when a row was inserted or updated). It has a **range of** '1970-01-01 00:00:01' to '2038-01-19 03:14:07'.

3. **TIMESTAMP can be set to automatically update whenever a change is made to the row, which is not typically the case with DATETIME**.

Remember, the use of these data types can depend on the specific requirements of your database.

**Q**: display current time

**Q**: display current date

**Q**: display current day of week

**Q**: display current day Name?

``` sql
-- display current time
SELECT CURRENT_TIME();

-- display current date
SELECT CURRENT_DATE();

-- display current day of week
SELECT DAYOFWEEK(CURRENT_DATE());

-- display current day Name?
SELECT DAYNAME(CURRENT_DATE());
```

***

### NOT LIKE

Display books with title not start with 'w'

```sql
SELECT title FROM books WHERE title NOT LIKE 'w%';
```

![Screenshot_20240418_191246](./img/Screenshot_20240418_191246.png)

### greter than or lesser than

- also use for greater than or equal to >=
- also use for greater than or equal to <=

``` sql
SELECT title, released_year FROM books WHERE released_year > 2000; 
```

![Screenshot_20240423_132620](./img/Screenshot_20240423_132620.png)

``` sql
SELECT 99 > 1;
SELECT 99 < 1;
```

![Screenshot_20240423_132937](./img/Screenshot_20240423_132937.png)

### logical AND / OR

SELECT book writtn by dave eggars, published after the year 2010

- ### AND
``` sql
SELECT title , author_fname , author_lname , released_year FROM books WHERE author_fname = 'Dave' AND author_lname = 'Eggers' AND released_year >= 2010;

-- or 

SELECT title , author_fname , author_lname , released_year FROM books WHERE author_fname = 'Dave' && author_lname = 'Eggers' && released_year >= 2010;
``` 

![Screenshot_20240423_133946](./img/Screenshot_20240423_133946.png)

- ### OR

``` sql
SELECT title, author_lname , released_year FROM books WHERE author_lname= 'Eggers' OR released_year > 2010 

-- or

SELECT title, author_lname , released_year FROM books WHERE author_lname= 'Eggers' || released_year > 2010 
```

![Screenshot_20240423_134936](./img/Screenshot_20240423_134936.png)

### working on BETWEEN
 - BETWEEN x AND y
 - **NOT BETWEEN** is also a thing

SELECT all books released between 2004 and 2015

``` sql
SELECT title, released_year FROM books WHERE released_year >=2004 AND released_year <=2015;

-- OR 

SELECT title , released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
```

![Screenshot_20240423_135623](./img/Screenshot_20240423_135623.png)

``` sql
SELECT title , released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;
```

![Screenshot_20240423_160007](./img/Screenshot_20240423_160007.png)

``` sql
SELECT CAST('2024-04-23' AS DATETIME)
```

![Screenshot_20240423_160354](./img/Screenshot_20240423_160354.png)

note: retrieve dates as below code

``` sql
SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);
``` 

Use second output:

![Screenshot_20240423_161158](./img/Screenshot_20240423_161158.png)


### IN / NOT IN
``` sql
SELECT title, author_lname FROM books WHERE author_lname IN('carver', 'lahiri', 'smith');
```
![Screenshot_20240423_161940](./img/Screenshot_20240423_161940.png)

















