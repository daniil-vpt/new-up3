-- Заполнение таблицы Пользователи
INSERT INTO users (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3');

-- Заполнение таблицы Адресаты
INSERT INTO recipients (email_address) VALUES
('recipient1@example.com'),
('recipient2@example.com'),
('recipient3@example.com');

-- Заполнение таблицы Письма
INSERT INTO emails (sender_id, recipient_id, subject, content) VALUES
(1, 2, 'Subject 1', 'Content of email 1'),
(2, 3, 'Subject 2', 'Content of email 2'),
(3, 1, 'Subject 3', 'Content of email 3');

-- Заполнение таблицы Вложения
INSERT INTO attachments (email_id, filename, file_size, file_type, file_content) VALUES
(1, 'file1.txt', 1024, 'text/plain', 0x),
(2, 'file2.jpg', 2048, 'image/jpeg', 0x),
(3, 'file3.pdf', 3072, 'application/pdf', 0x);
