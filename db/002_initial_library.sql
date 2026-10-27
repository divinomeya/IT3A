-- Table #1 students table
CREATE TABLE IF NOT EXISTS students (
    -- Primary key for students table
    student_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Student Name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- Student Course
    student_course VARCHAR(50) NOT NULL,

    -- Student created at timestamp
    student_created_at TIMESTAMP NOT NULL 
        DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- Table #2 books table
CREATE TABLE IF NOT EXISTS books (
    -- Primary Key for books table
    book_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Book Details
    book_title VARCHAR(50) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_category VARCHAR(50) NOT NULL,

    -- Book created at timestamp
    book_created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

-- Table #3 borrow
CREATE TABLE IF NOT EXISTS borrow (
    -- Primary Key for borrow table
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign key references
    student_id INT NOT NULL,
    book_id INT NOT NULL,

    -- BORROW TIMESTAMP NOT NULL BY DEFAULT
    borrow_date TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    -- BORROW RETURN TIMESTAMP NULL BY DEFAULT
    borrow_return_date TIMESTAMP NULL
        DEFAULT NULL,

    -- BORROW TABLE CONSTRAINTS AND FOREIGN KEYS
    CONSTRAINT fk_borrow_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_borrow_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

-- INSERT STATEMENT #1: Insert Students
INSERT INTO students (
    student_first_name,
    student_last_name,
    student_course
) VALUES 
    ('MEYA', 'DIVINO', 'BSIT'),
    ('ARRIEL DENVER', 'CADAVOZ', 'BSIT'),
    ('EUNACE FAITH', 'EMACTAO', 'BSIT');

-- INSERT STATEMENT #2: Insert Books
INSERT INTO books (
    book_title,
    book_author,
    book_category
) VALUES
    ('Hidden Love','Zhu Yi','Romance'),
    ('Everyone Loves Me','Gu Yao','Romance'),
    ('Florante at Laura','Francisco Balagtas','Philippine Literature');

-- INSERT STATEMENT #3: Insert Borrow
INSERT INTO borrow (
    student_id,
    book_id
) VALUES
    (1, 2),
    (2, 3),
    (3, 1);