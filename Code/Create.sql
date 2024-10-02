CREATE DATABASE PostalService;
GO

USE PostalService;
GO

-- Таблица Пользователи
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Таблица Письма
CREATE TABLE emails (
    email_id INT PRIMARY KEY IDENTITY(1,1),
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    subject VARCHAR(255),
    content TEXT,
    sent_date DATETIME DEFAULT GETDATE(),
    read_status BIT DEFAULT 0,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Таблица Адресаты
CREATE TABLE recipients (
    recipient_id INT PRIMARY KEY IDENTITY(1,1),
    email_address VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица Вложения
CREATE TABLE attachments (
    attachment_id INT PRIMARY KEY IDENTITY(1,1),
    email_id INT NOT NULL,
    filename VARCHAR(255),
    file_size INT,
    file_type VARCHAR(50),
    file_content VARBINARY(MAX),
    FOREIGN KEY (email_id) REFERENCES emails(email_id)
);
