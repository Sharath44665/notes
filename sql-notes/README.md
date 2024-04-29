## Index
- [creating table](#creating-table)
- [how to run a sql file? ](#run-a-file)
- [working with concat](#working-with-concat)
- [working with alias/ fancy heading](#fancy-heading)
- [substrings](#working-on-substring-or-substr)
- [replacing](#working-with-replace)
- [reversing](#working-with-reverse)
- [length of charecter](#working-with-char_length)
- [UPPER, lower](#working-with-upper-lower)
- [distinct](#working-with-distinct)
- [sorting](#sorting-order-by)
- [limit](#using-limit)
- [searching, like](#better-searches-using-like)
  - [not like](#not-like)
- [aggregate functions](#aggregate-functions)
  - [count](#count)
  - [min, max](#using-min-and-max)
  - [min max group by](#min-and-max-using-group-by)
  - [sum](#using-sum)
  - [average](#the-avg-functions)
- [subquery](#subquery)
- [date time ](#date-time-datetime)
  - [curdate](#using-curdate-curtime-now)
  - [formatting date](#formatting-date)
  - [date difference](#datediff)
- [greater than, lesser than](#greter-than-or-lesser-than)
- [AND OR](#logical-and--or)
- [BETWEEN](#working-on-between)
- [type conversion using cast](#type-conversion-using-cast)
- [in not in](#in--not-in)
- [case statements](#case-statements)
- [one to many](#one-to-many)
  - [foreign key](#working-with-foreign-key)
  - [cross join](#cross-join)
  - [implicit inner join](#implicit-inner-join)
  - [explicit inner join - recommended ](#explicit-inner-join)
  - [left join](#left-join)
  - [right join](#right-join)
  - [on delete cascade](#on-delete-cascade)
- [many to many](#many-to-many)
- [having](#using-having2)

## cheat sheat

![sqlCheatsheet](./img/sqlCheatsheet.png)

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
source path/to/file_name.sql
```
### working with Concat
```sql
SELECT CONCAT("Hello", "World") 
```

![~/Downloads/Screenshot_20240413_144638.png](./img/Screenshot_20240413_144638.png)

``` sql
select author_fname, author_lname FROM books;
```

![Screenshot_20240413_144216](./img/Screenshot_20240413_144216.png)

``` sql
SELECT CONCAT(author_fname, " ", author_lname) FROM books; 
```


![~/Downloads/Screenshot_20240413_145113.png](./img/Screenshot_20240413_145113.png)

#### fancy heading
``` sql
SELECT CONCAT(author_fname, " ", author_lname) AS 'Full name' FROM books; 
```


![~/Downloads/Screenshot_20240413_145520.png](./img/Screenshot_20240413_145520.png)

``` sql
SELECT author_fname AS first, 
	author_lname AS last, 
	CONCAT(author_fname, " ", author_lname) AS 'Full name' FROM books;
```


![~/Downloads/Screenshot_20240413_150407.png](./img/Screenshot_20240413_150407.png)

#### CONCAT_WS:
``` sql
SELECT CONCAT_WS(" - ",title,author_fname,author_lname) AS 'Title - first - last' FROM books;
```


![~/Downloads/Screenshot_20240413_151722.png](./img/Screenshot_20240413_151722.png)

### working on SUBSTRING or SUBSTR

``` sql
SELECT SUBSTRING('Hello world ', 1, 4 ) AS demo;
```


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


### working with REVERSE
``` sql
SELECT REVERSE('Hello World') AS demo;
``` 
![Screenshot_20240413_160429.png](./img/Screenshot_20240413_160429.png)

### working with CHAR_LENGTH

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

### DATEDIFF

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

### Type conversion using CAST

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


### CASE statements

``` sql
SELECT title , released_year ,
    CASE
    WHEN released_year >= 2000 THEN 'Modern Lit'
    ELSE '20th Century Lit'
    END AS 'Genre'
    FROM books;
```

![Screenshot_20240423_205518](./img/Screenshot_20240423_205518.png)

``` sql
SELECT title , stock_quantity ,
    CASE
    WHEN stock_quantity < 50 THEN '*'
    WHEN stock_quantity < 100 THEN '**'
    ELSE '***'
    END AS 'stock stars'
    FROM books;

-- or

SELECT title , stock_quantity ,
    CASE
    WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    ELSE '***'
    END AS 'stock stars'
    FROM books;
```

![Screenshot_20240423_205953](./img/Screenshot_20240423_205953.png)

q: Select all books written before 1980 (not inclusive)

q: select all books written by Eggers or Chabon

Q: select all books written by Lahiri, published after 2000

Q: select all books with page count between 100 and 200

Q: select all books where author_lname starts with a 'c' or 's'

q: if title contains 'stories' -> Short stories

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;just kids  and heartbreaking work -> Memoir

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Everything else -> Novel

**q**: make this happen:

![Screenshot_20240423_215854](./img/Screenshot_20240423_215854.png)

``` sql
-- Select all books written before 1980 (not inclusive)
SELECT title , released_year FROM books WHERE released_year < 1980;

-- select all books written by Eggers or Chabon
SELECT title , author_lname FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

-- or

SELECT title , author_lname FROM books WHERE author_lname IN ('Eggers','Chabon');

-- select all books written by Lahiri, published after 2000
SELECT title , author_lname , released_year FROM books WHERE released_year >= 2000 AND author_lname = 'Lahiri';

-- select all books with page count between 100 and 200
SELECT title , pages FROM books WHERE pages BETWEEN 100 AND 200;

-- select all books where author_lname starts with a 'c' or 's'
SELECT title , author_lname FROM books  WHERE author_lname LIKE 'c%' OR author_lname LIKE 's%';

-- or
SELECT title , author_lname FROM books  
    WHERE SUBSTR(author_lname, 1,1) IN ('c%' ,'s%');

-- if title contains 'stories' -> Short stories...
SELECT title, author_lname , 
    CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title LIKE '%Just Kids%' OR title LIKE 'Heartbreaking work' THEN 'Memoir'
    ELSE 'Novel'
    END AS TYPE
    FROM books;
```
``` sql
-- make this happen:
SELECT title , author_lname , 
    CASE 
    WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' Books')
    ELSE CONCAT(COUNT(*), ' Book')
    END as 'COUNT' FROM books GROUP BY author_lname, author_fname ;
```

***
### ONE TO MANY
### working with foreign Key

``` sql
CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount DECIMAL,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```

insert respective values.

error on inserting value which doesnot relate to foreign key:

``` sql
INSERT INTO orders (order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 55);
```


![Screenshot_20240424_171907](./img/Screenshot_20240424_171907.png)

q: get orders of 'Boy George'

``` sql
SELECT id, order_date, amount, customer_id FROM orders 
    where customer_id= (
        SELECT id FROM customers WHERE first_name='Boy' AND last_name= 'George'
    );
```

![Screenshot_20240424_173114](./img/Screenshot_20240424_173114.png)

### Cross join


| customers table | orders table |
| -- | -- |
| ![Screenshot_20240425_094849](./img/Screenshot_20240425_094849.png) | ![Screenshot_20240425_095251](./img/Screenshot_20240425_095251.png) | 


``` sql
SELECT * FROM customers, orders;
-- 5*5 (row*row)
```

### implicit inner join

``` sql
SELECT * FROM customers, orders WHERE customers.id =  orders.customer_id;
```

![Screenshot_20240424_174351](./img/Screenshot_20240424_174351.png)

``` sql
SELECT first_name, last_name, amount, customer_id FROM customers, orders WHERE customers.id = orders.customer_id;
```

![Screenshot_20240424_174832](./img/Screenshot_20240424_174832.png)


### explicit inner join

``` sql
SELECT * FROM customers 
    JOIN orders
    ON customers.id = orders.customer_id;
```

output will be same as below

![Screenshot_20240424_174351](./img/Screenshot_20240424_174351.png)

``` sql
SELECT first_name, last_name, amount, customer_id FROM customers
    JOIN orders
    ON customers.id = orders.customer_id;
```
output will be same as below

![Screenshot_20240424_174832](./img/Screenshot_20240424_174832.png)


``` sql
SELECT first_name, last_name, SUM(amount) as 'total spent', customer_id FROM customers
    JOIN orders
    ON customers.id = orders.customer_id
    GROUP BY orders.customer_id;

-- Try this:
SELECT first_name, last_name, SUM(amount) as total_spent, customer_id FROM customers     
    JOIN orders     
    ON customers.id = orders.customer_id
    GROUP BY orders.customer_id 
    ORDER BY total_spent DESC;
```

![Screenshot_20240424_180612](./img/Screenshot_20240424_180612.png)

### left join

[see table](#cross-join)

``` sql
SELECT * FROM customers 
    LEFT JOIN orders
    ON customers.id= orders.customer_id;
```
![Screenshot_20240425_163349](./img/Screenshot_20240425_163349.png)

``` sql
SELECT customers.id, first_name , last_name, 
    IFNULL(SUM(amount),0) AS total_spent 
    FROM customers 
    LEFT JOIN orders 
    ON customers.id = orders.customer_id 
    GROUP BY customers.id ORDER BY total_spent;
```

![Screenshot_20240425_165001](./img/Screenshot_20240425_165001.png)

### right join

**Deleting table doesnt work for foreign key constraint:**

![Screenshot_20240425_165924](./img/Screenshot_20240425_165924.png)

> NOTE: in below table, did not added foreign constraint for the demo table
>
> see customers_and_orders.sql

| customers_demo | orders_demo |
| -- | -- |
| ![Screenshot_20240425_171936](./img/Screenshot_20240425_171936.png) | ![Screenshot_20240425_173315](./img/Screenshot_20240425_173315.png) |

``` sql
SELECT first_name , last_name , amount , order_date 
    FROM customers_demo
    RIGHT JOIN orders_demo
    ON customers_demo.id=orders_demo.customer_id;
```

![Screenshot_20240425_174537](./img/Screenshot_20240425_174537.png)

``` sql
SELECT 
    IFNULL(first_name,'MISSING') AS first , 
    IFNULL(last_name,'USER') AS last , 
    SUM(amount) AS total_spent, customer_id  
    FROM customers_demo 
    RIGHT JOIN orders_demo 
    ON customers_demo.id = orders_demo.customer_id 
    GROUP BY customer_id;
```

![Screenshot_20240425_180957](./img/Screenshot_20240425_180957.png)

``` sql
SELECT
    IFNULL(first_name,'MISSING') AS first ,
    IFNULL(last_name,'USER') AS last ,
    SUM(amount) AS total_spent
    FROM customers_demo 
    RIGHT JOIN orders_demo 
    ON customers_demo.id = orders_demo.customer_id 
    GROUP BY first_name, last_name;
```

![Screenshot_20240425_181623](./img/Screenshot_20240425_181623.png)

### On DELETE CASCADE

``` sql
CREATE TABLE customers_two(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders_two(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount DECIMAL,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
	ON DELETE CASCADE
);
```
![Screenshot_20240425_190648](./img/Screenshot_20240425_190648.png)

``` sql
DELETE FROM customers_two WHERE first_name = 'Boy';

SELECT * FROM customers_two;

SELECT * FROM orders_two;
```

![Screenshot_20240425_191030](./img/Screenshot_20240425_191030.png)

| students table | papers table |
| -- | -- |
| ![Screenshot_20240426_130653](./img/Screenshot_20240426_130653.png) | ![Screenshot_20240426_130745](./img/Screenshot_20240426_130745.png) |


q1. print this:

![Screenshot_20240426_130352](./img/Screenshot_20240426_130352.png)

q2. print this:

![Screenshot_20240426_131123](./img/Screenshot_20240426_131123.png)

q3. print this:

![Screenshot_20240426_131523](./img/Screenshot_20240426_131523.png)

q4. print this:

![Screenshot_20240426_132257](./img/Screenshot_20240426_132257.png)

q5. print this, if average >= 75, then passing, else failing:

![Screenshot_20240426_134038](./img/Screenshot_20240426_134038.png)

``` sql
-- q1
SELECT first_name , title, grade 
    FROM students
    INNER JOIN papers
    ON students.id=papers.student_id
    ORDER BY grade DESC;

-- q2
SELECT first_name , title, grade
    FROM students
    LEFT JOIN papers
    ON students.id = papers.student_id;

-- q3
SELECT first_name ,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
    FROM students
    LEFT JOIN papers 
    ON students.id = papers.student_id;

-- q4

SELECT first_name , 
    IFNULL(AVG(grade),0) AS 'average' 
    FROM students 
    LEFT JOIN papers 
    ON students.id = papers.student_id 
    GROUP BY first_name 
    ORDER BY average DESC;

-- q5

SELECT first_name , 
    IFNULL(AVG(grade),0) AS average, 
    CASE 
    WHEN AVG(grade) >= 75 THEN 'PASSING' 
    ELSE 'FAILINIG' 
    END AS passing_status 
    FROM students 
    LEFT JOIN papers 
    ON students.id = papers.student_id 
    GROUP BY first_name 
    ORDER BY average DESC;
```
***
### MANY TO MANY

| series table | reviewers table | reviews table |
| -- | -- | -- |
| ![Screenshot_20240428_122145](./img/Screenshot_20240428_122145.png) | ![Screenshot_20240428_122415](./img/Screenshot_20240428_122415.png) | ![Screenshot_20240428_122620](./img/Screenshot_20240428_122620.png) |

challenges: 
1. print this:

![Screenshot_20240428_124458](./img/Screenshot_20240428_124458.png)
``` sql
SELECT title, rating  
    FROM series  
    INNER JOIN reviews 
    ON series.id = reviews.series_id LIMIT 15;
```

2. do this 

 ![Screenshot_20240428_125637](./img/Screenshot_20240428_125637.png)

``` sql
SELECT title, 
    AVG(rating) as avg_rating 
    FROM series INNER JOIN reviews  
    ON series.id = reviews.series_id 
    GROUP BY title 
    ORDER BY avg_rating;
```
3. do this

![Screenshot_20240428_130512](./img/Screenshot_20240428_130512.png)

``` sql
SELECT first_name, last_name , rating  FROM reviewers  INNER JOIN reviews ON reviewers.id = reviews.reviewer_id;
```

4. show not reviewd series like this

![Screenshot_20240428_131228](./img/Screenshot_20240428_131228.png)

``` sql
SELECT title as unreviewed_series 
    FROM series 
    LEFT JOIN reviews ON series.id = reviews.series_id 
    WHERE reviews.series_id IS NULL;

-- OR
SELECT title as unreviewed_series FROM series
    WHERE id NOT IN (select DISTINCT series_id FROM reviews);
```

5. print this (if possible make use of round - google it)

![Screenshot_20240428_132943](./img/Screenshot_20240428_132943.png)

``` sql
SELECT genre , AVG(rating) AS avg_rating
    FROM series
    INNER JOIN reviews 
    ON series.id = reviews.series_id
    GROUP BY genre ;
```

6. print this

![Screenshot_20240428_143141](./img/Screenshot_20240428_143141.png)

``` sql
SELECT first_name , last_name , 
	COUNT(*) AS 'COUNT',
	IFNULL(MIN(rating),0) AS 'MIN', 
	IFNULL(MAX(rating),0) AS 'MAX',
	IFNULL(AVG(rating),0) AS 'AVG',
	CASE
	WHEN rating IS NULL THEN 'INACTIVE'
	ELSE 'ACTIVE'
	END AS 'STATUS'
	FROM reviewers
	LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id 
	GROUP BY first_name, last_name;

-- or 
SELECT first_name , last_name , 
	COUNT(*) AS 'COUNT',
	IFNULL(MIN(rating),0) AS 'MIN', 
	IFNULL(MAX(rating),0) AS 'MAX',
	IFNULL(AVG(rating),0) AS 'AVG',
	CASE
	WHEN 'COUNT' = 1 THEN 'INACTIVE'
	ELSE 'ACTIVE'
	END AS 'STATUS'
	FROM reviewers
	LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id 
	GROUP BY first_name, last_name;
```

7. print this and sort by title

![Screenshot_20240428_154225](./img/Screenshot_20240428_154225.png)

``` sql
SELECT title, rating,  
    CONCAT(first_name , ' ', last_name ) AS reviewer  
    FROM series  
    INNER JOIN reviews ON series.id = reviews.series_id 
    INNER JOIN reviewers ON reviewers.id= reviews.reviewer_id 
    ORDER BY title;
```
***
 ### challenges
 1. find the 5 oldest users?

 ``` sql
 SELECT username, created_at FROM users ORDER BY created_at LIMIT 5;
```
![Screenshot_20240428_215401](./img/Screenshot_20240428_215401.png)

2. What day of week do most users register on?

we need to figure out when to schedule an ad compaign.

``` sql
SELECT DAYNAME(created_at) AS day, COUNT(*) AS counts
    FROM users
    GROUP BY day
    ORDER BY counts DESC LIMIT 1;
```

![Screenshot_20240429_105114](./img/Screenshot_20240429_105114.png)

3. we want to target our inactive users with an email campaign

find out the users who are not active or never posted the photo 

``` sql
SELECT username FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.created_at IS NULL;
```
![Screenshot_20240429_105918](./img/Screenshot_20240429_105918.png)

4. we are running a new contest to see who get the most likes on a single photo.

who won???

``` sql
-- below one is right
SELECT username,  photos.id as photo_id, 
    COUNT(*) AS photo_likes 
    FROM photos 
        INNER JOIN likes ON photos.id = likes.photo_id 
        INNER JOIN users ON users.id = photos.user_id
    GROUP BY likes.photo_id 
    ORDER BY photo_likes DESC LIMIT 1;

-- below one is wrong
SELECT username,  photos.id as photo_id, 
    COUNT(*) AS photo_likes 
    FROM photos 
        INNER JOIN likes ON photos.id = likes.photo_id
        INNER JOIN users ON users.id = likes.user_id 
    GROUP BY likes.photo_id 
    ORDER BY photo_likes DESC LIMIT 1;
```
![who get the most likes on a single photo.](./img/Screenshot_20240429_111639.png)



5. how many times does the average user posts?

``` sql
SELECT((SELECT COUNT(*) FROM photos)/ (SELECT COUNT(*) FROM users )) as avg_photos_per_user; 
```

![average user posts](./img/Screenshot_20240429_112843.png)

6. a brand wants to know which hash tags to use in a post?

what are the top 5 most commonly used hash tags?

``` sql
SELECT tag_name, COUNT(*) AS count_total 
    FROM photo_tags
    INNER JOIN tags
    ON tags.id =  photo_tags.tag_id GROUP BY tag_id ORDER BY count_total DESC LIMIT 5;
```

![commonly used hash tags](./img/Screenshot_20240429_114111.png)

7. we have small problem with bots on our site. 

logic: find the users who have liked every single photo on the site

### using HAVING

``` sql
SELECT username, count(*) AS photo_likes
    FROM users
    INNER JOIN likes ON users.id = likes.user_id
    GROUP BY user_id
    HAVING photo_likes = (SELECT COUNT(*) FROM photos);
```

![having use](./img/Screenshot_20240429_121303.png)









