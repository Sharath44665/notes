
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

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
      

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       

CREATE TABLE customers_demo(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders_demo(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount DECIMAL,
	customer_id INT
);

INSERT INTO customers_demo (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
      

INSERT INTO orders_demo (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

 
INSERT INTO orders_demo (order_date, amount, customer_id)
VALUES ('2017/11/05', 23.45, 45),
	(CURDATE(), 777.77, 109);
   
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

INSERT INTO customers_two (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
      

INSERT INTO orders_two (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
      

CREATE TABLE students
    (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100)
    );

CREATE TABLE papers( 
    title VARCHAR(100), 
    grade DECIMAL, 
    student_id INT, 
    FOREIGN KEY (student_id) REFERENCES students(id) 
    ON DELETE CASCADE 
);
      


INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


      
