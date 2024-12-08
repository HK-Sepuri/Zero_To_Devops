-- sample_data.sql

-- Insert into Books
INSERT INTO books (title, author, published_year, genre)
VALUES
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction');

-- Insert into Members
INSERT INTO members (name, email)
VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com');

-- Insert into Borrowings
INSERT INTO borrowings (member_id, book_id, borrowed_date, return_date)
VALUES
(1, 1, '2023-12-01', '2023-12-08'),
(2, 2, '2023-12-03', NULL); -- NULL means not returned yet
