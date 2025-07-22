-- Таблиця авторів
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255)
);

-- Таблиця книг
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Таблиця статусів читання
CREATE TABLE reading_status (
    id SERIAL PRIMARY KEY,
    book_id INT,
    status VARCHAR(20) CHECK (status IN ('reading', 'completed', 'planned')) NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Вставка авторів
INSERT INTO authors (name, country) VALUES 
('George Orwell', 'United Kingdom'),
('J.K. Rowling', 'United Kingdom'),
('Haruki Murakami', 'Japan');

-- Вставка книг
INSERT INTO books (title, author_id, genre) VALUES 
('1984', 1, 'Dystopian'),
('Harry Potter and the Philosopher''s Stone', 2, 'Fantasy'),
('Kafka on the Shore', 3, 'Magical realism');

-- Статус читання
INSERT INTO reading_status (book_id, status) VALUES 
(1, 'reading');

-- Запит: непрочитані книги
SELECT books.title, authors.name 
FROM books
JOIN authors ON books.author_id = authors.id
LEFT JOIN reading_status ON books.id = reading_status.book_id
WHERE reading_status.status IS NULL OR reading_status.status != 'completed';

-- Запит: скільки читається
SELECT COUNT(*) AS reading_books
FROM reading_status
WHERE status = 'reading';

-- Створення користувача та права доступу
CREATE USER library_user WITH PASSWORD 'qaz12#';
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO library_user;
