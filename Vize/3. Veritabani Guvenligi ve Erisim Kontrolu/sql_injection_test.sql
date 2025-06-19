CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Role NVARCHAR(20),
);

INSERT INTO Users (Username, Password, Email, Role)
VALUES 
('admin', 'admin123', 'admin@example.com', 'admin'),
('user1', 'userpass1', 'user1@example.com', 'user'),
('user2', 'userpass2', 'user2@example.com', 'user'),
('user3', 'userpass3', 'user3@example.com', 'user'),
('guest', 'guestpass', 'guest@example.com', 'user'),
('sysadmin', 'sys123', 'sys@example.com', 'admin');

SELECT * FROM Users;

-------
USE TestSQLInjection
ALTER TABLE Users
ADD CONSTRAINT CK_Username_NoInjection
CHECK (
    Username NOT LIKE '%--%' AND
    Username NOT LIKE '%''%' AND
    Username NOT LIKE '%;%' AND
    Username NOT LIKE '% OR %'
);

-------




