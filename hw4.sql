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

-- task-2 Заповніть таблиці простими видуманими тестовими даними
INSERT INTO authors(author_name) 
VALUES ('Jean Louis De Lolme'), ('Josephine Quintero'), ('Rosemary Kirstein');

INSERT INTO genres(genre_name)
VALUES ('historic'), ('cultural'), ('novel');

INSERT INTO books(title, publication_year, author_id, genre_id)
VALUES ("Constitution de l'Angleterre", 1971, 1, 1),
	   ("Dubaï en quelques jours", 2012, 2, 2),
       ("The Steerswoman", 1989, 3, 3);

INSERT INTO users(username, email)
VALUES 
    ('Олександр Петренко', 'alex.p@example.com'),
    ('Марія Сидоренко', 'maria.sydor@test.net'),
    ('Іван Коваль', 'ivan.koval@mail.com');
    
INSERT INTO borrowed_books(book_id, user_id, borrow_date, return_date)
VALUES 
    (1, 1, '2025-10-10', '2025-10-24'),
    (2, 2, '2025-11-05', NULL),
    (3, 1, '2025-11-12', '2025-11-20');


