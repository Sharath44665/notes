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

## Aggregate Functions
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


