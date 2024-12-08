-- schema.sql
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    published_year INT,
    genre VARCHAR(50)
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    joined_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    book_id INT REFERENCES books(book_id),
    borrowed_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);
