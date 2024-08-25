-- Creating the 'books' table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    author_id INT,
    genre VARCHAR(50),
    publication_date DATE,
    price DECIMAL(6,2),
    description TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Creating the 'authors' table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    bio TEXT
);

-- Creating the 'customers' table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(10)
);

-- Creating the 'orders' table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(8,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Creating the 'order_details' table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price_per_item DECIMAL(6,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);