-- task-1 Створіть базу даних для керування бібліотекою книг згідно зі структурою

-- a)
CREATE SCHEMA IF NOT EXISTS `LibraryManagement`;
use LibraryManagement;

-- b)
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, 
    author_name  VARCHAR(70)
);
-- c)
CREATE TABLE IF NOT EXISTS genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY, 
    genre_name  VARCHAR(50)
);

-- Then - the simple one "users"
-- e) 
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, 
    username  VARCHAR(50),
    email VARCHAR(60)
);

-- Then go back to previous: "books"
-- d)
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- f)
CREATE TABLE IF NOT EXISTS borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);