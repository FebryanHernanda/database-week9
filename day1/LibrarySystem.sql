/* LIBRARIANS TABLE */
CREATE TABLE
  Librarians (
    "id" INT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
  )
  -- INSERT VALUES FOR LIBRARIANS TABLE
INSERT INTO
  Librarians (id, name)
VALUEs
  (1, 'Zack'),
  (2, 'Vengeance'),
  (3, 'Angels'),
  (4, 'Tom'),
  (5, 'Jerry'),
  (6, 'Brad'),
  (7, 'Lily'),
  (8, 'Xborg'),
  (9, 'Lasna'),
  (10, 'Lisa')
  /* MEMBERS TABLE */
CREATE TABLE
  Members (
    "id" INT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
  )
  -- INSERT VALUES FOR MEMBERS TABLE
INSERT INTO
  Members (id, name)
VALUES
  (1, 'Jeki'),
  (2, 'Gladies'),
  (3, 'Jasmine'),
  (4, 'Opet'),
  (5, 'Tasya'),
  (6, 'Audrey'),
  (7, 'Frank'),
  (8, 'Thomas'),
  (9, 'Shelby'),
  (10, 'Naben');

/* CATEGORIES TABLE */
CREATE TABLE
  Categories (
    "id" INT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
  )
  -- INSERT VALUES FOR CATEGORIES TABLE
INSERT INTO
  Categories (id, name)
VALUES
  (1, 'Fiction'),
  (2, 'Non-Fiction'),
  (3, 'Fantasy'),
  (4, 'Science Fiction (Sci-Fi)'),
  (5, 'Mystery'),
  (6, 'Romance'),
  (7, 'Horror'),
  (8, 'Thriller'),
  (9, 'Biography'),
  (10, 'Adventure')
  /* BOOKSHELF TABLE */
CREATE TABLE
  Bookshelf (
    "id" INT PRIMARY KEY,
    "code" VARCHAR(50) NOT NULL,
    "category_id" INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories (id)
  )
  -- INSERT VALUES FOR BOOKSHELF TABLE
INSERT INTO
  Bookshelf (id, code, category_id)
VALUES
  (1, 'F-1', 1),
  (2, 'NF-2', 2),
  (3, 'F-3', 3),
  (4, 'SCI-4', 4),
  (5, 'M-5', 5),
  (6, 'R-6', 6),
  (7, 'H-7', 7),
  (8, 'T-8', 8),
  (9, 'B-9', 9),
  (10, 'A-10', 10);

/* BORROWING BOOKS */
CREATE TABLE
  Books (
    "id" INT PRIMARY KEY,
    "title" VARCHAR(255) NOT NULL,
    "author" VARCHAR(255) NOT NULL,
    "category_id" INT NOT NULL,
    "bookshelf_id" INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories (id),
    FOREIGN KEY (bookshelf_id) REFERENCES Bookshelf (id)
  )
  -- INSERT VALUES FOR BOOKS TABLE
INSERT INTO
  Books (id, title, author, category_id, bookshelf_id)
VALUES
  (
    1,
    'The Great Gatsby',
    'F. Scott Fitzgerald',
    1,
    1
  ),
  (
    2,
    'Sapiens: A Brief History of Humankind',
    'Yuval Noah Harari',
    2,
    2
  ),
  (
    3,
    'Harry Potter and the Sorcerer''s Stone',
    'J.K. Rowling',
    3,
    3
  ),
  (4, 'Dune', 'Frank Herbert', 4, 4),
  (5, 'Gone Girl', 'Gillian Flynn', 5, 5),
  (6, 'Pride and Prejudice', 'Jane Austen', 6, 6),
  (7, 'It', 'Stephen King', 7, 7),
  (8, 'The Da Vinci Code', 'Dan Brown', 8, 8),
  (
    9,
    'The Diary of a Young Girl',
    'Anne Frank',
    9,
    9
  ),
  (10, 'The Hobbit', 'J.R.R. Tolkien', 10, 10);

/* BORROWING TABLE */
CREATE TABLE
  Borrowing (
    "id" INT PRIMARY KEY,
    "book_id" INT NOT NULL,
    "member_id" INT NOT NULL,
    "librarians_id" INT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Books (id),
    FOREIGN KEY (member_id) REFERENCES Members (id),
    FOREIGN KEY (librarians_id) REFERENCES Librarians (id)
  )
  -- INSERT VALUES FOR BORROWING TABLE
INSERT INTO
  Borrowing (id, book_id, member_id, librarians_id)
VALUES
  (1, 3, 1, 2),
  (2, 5, 4, 1),
  (3, 2, 3, 5),
  (4, 7, 6, 3),
  (5, 1, 2, 4),
  (6, 9, 8, 2),
  (7, 4, 7, 1),
  (8, 6, 5, 3),
  (9, 10, 9, 4),
  (10, 8, 10, 5);