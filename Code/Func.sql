--Функция для отправки письма
CREATE PROCEDURE send_email
    @sender_id INT,
    @recipient_id INT,
    @subject VARCHAR(255),
    @content TEXT
AS
BEGIN
    INSERT INTO emails (sender_id, recipient_id, subject, content)
    VALUES (@sender_id, @recipient_id, @subject, @content);
END;
GO

--Функция для получения непрочитанных писем
CREATE FUNCTION get_unread_emails (@user_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM emails
    WHERE recipient_id = @user_id AND read_status = 0
);
GO

--Функция для пометки письма как прочитанного
CREATE PROCEDURE mark_email_as_read
    @email_id INT
AS
BEGIN
    UPDATE emails
    SET read_status = 1
    WHERE email_id = @email_id;
END;
GO

--Отправка письма
EXEC send_email @sender_id = 1, @recipient_id = 2, @subject = 'New Subject', @content = 'New Content';

--Получение непрочитанных писем
SELECT * FROM get_unread_emails(2);

--Пометка письма как прочитанного
EXEC mark_email_as_read @email_id = 1;
