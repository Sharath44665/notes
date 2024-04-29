DROP TABLE cats;

CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);


SHOW Tables;

DESC cats;

INSERT INTO cats(name, age)
VALUES('Charlie', 17);

INSERT INTO cats(name, age)
VALUES('Connie', 10);

SELECT * FROM cats;


CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);



SELECT * FROM books;

select author_fname, author_lname from books;

SELECT CONCAT("Hello", "World") 

SELECT CONCAT(author_fname, " ", author_lname) from books; 

SELECT author_fname AS first, 
	author_lname AS last, 
	CONCAT(author_fname, " ", author_lname) AS 'Full name' FROM books;

SELECT CONCAT_WS(" - ",title,author_fname,author_lname) AS 'Title - first - last' FROM books;

SELECT SUBSTRING('Hello world ', 1, 4 ) AS demo;

SELECT SUBSTRING(title, 1, 10) AS 'Substring of title' FROM books; 

SELECT CONCAT(
	SUBSTRING(title, 1, 10),
	"...") AS 'Short title' FROM books;

SELECT REPLACE("Hello world", "Hell", "abcd");

desc books;

SELECT REPLACE(title, "e", "3") FROM books;

CREATE TABLE people(
	name VARCHAR(100),
	birthdate DATE,
	birthtime TIME,
	birthdt DATETIME
);


INSERT INTO people(name, birthdate,  birthtime,birthdt )
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people(name, birthdate,  birthtime,birthdt )
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');


CREATE TABLE comments(
	content VARCHAR(100),
	created_at TIMESTAMP DEFAULT NOW()
);







