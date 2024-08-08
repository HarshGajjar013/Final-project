CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    biography TEXT,
    date_of_birth DATE
);

CREATE TABLE Publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    author_id INT,
    publisher_id INT,
    publication_date DATE,
    type VARCHAR(10) CHECK (type IN ('Physical', 'Ebook', 'Audiobook')),
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date DATE,
    total_spent DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    book_id INT,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


---------------------------------------------------------------------------------------------------


INSERT INTO Authors (name, biography, date_of_birth) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.', '1965-07-31'),
('George R.R. Martin', 'American novelist and short story writer, best known for A Song of Ice and Fire.', '1948-09-20'),
('J.R.R. Tolkien', 'English writer, poet, philologist, and university professor, best known for The Lord of the Rings.', '1892-01-03');

INSERT INTO Publishers (name, address) VALUES
('Bloomsbury Publishing', '50 Bedford Square, London, WC1B 3DP, UK'),
('Bantam Books', '1745 Broadway, New York, NY 10019, USA'),
('HarperCollins', '195 Broadway, New York, NY 10007, USA');

INSERT INTO Books (title, genre, author_id, publisher_id, publication_date, type, price) VALUES
('Harry Potter and the Philosopher''s Stone', 'Fantasy', 1, 1, '1997-06-26', 'Physical', 20.99),
('A Game of Thrones', 'Fantasy', 2, 2, '1996-08-06', 'Ebook', 9.99),
('The Hobbit', 'Fantasy', 3, 3, '1937-09-21', 'Audiobook', 14.99);

INSERT INTO Customers (name, email, password, registration_date, total_spent) VALUES
('Alice Smith', 'alice.smith@example.com', 'password123', '2023-01-15', 100.50),
('Bob Johnson', 'bob.johnson@example.com', 'password456', '2023-02-20', 200.75),
('Carol Williams', 'carol.williams@example.com', 'password789', '2023-03-10', 150.25);

INSERT INTO Reviews (book_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Amazing book! A must-read for all ages.', '2023-05-01'),
(2, 2, 4, 'Great start to an epic series.', '2023-06-15'),
(3, 3, 5, 'A timeless classic that never gets old.', '2023-07-22');

INSERT INTO Sales (book_id, customer_id, sale_date, amount) VALUES
(1, 1, '2023-05-01', 20.99),
(2, 2, '2023-06-15', 9.99),
(3, 3, '2023-07-22', 14.99);