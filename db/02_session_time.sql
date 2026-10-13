CREATE TABLE user_sessions(
    sessions_id INT AUTO_INCREMENT PRIMARY_KEY,

    user_id INT NOT NULL,

    session_start DATETIME NOT NUL DEFULT CURRENT TIMESTAMP,
    session_end DATETIME DEFULT NULL,
    session_dduration INT DEFULT NULL,

    CONSTRAIN fk_user_sessions_user_id
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);