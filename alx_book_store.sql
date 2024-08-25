-- Creating the alx_book_store database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Using the database
USE alx_book_store;

-- Creating the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Creating the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Creating the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- Creating the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,  -- Corrected data type
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);