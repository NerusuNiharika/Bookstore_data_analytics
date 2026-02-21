CREATE DATABASE bookstore;
USE bookstore;
-- 1. Books table
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    genre TEXT,
    price DECIMAL(6,2),
    stock INTEGER
);
-- 2. Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    signup_date DATE
);
-- 3. Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    customer_id INTEGER,
    quantity INTEGER,
    order_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- 4. MarketingSpend table
CREATE TABLE MarketingSpend (
    spend_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    spend_amount DECIMAL(7,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

