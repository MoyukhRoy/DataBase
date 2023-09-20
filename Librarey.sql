create database Library;
Use library;



CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Status ENUM('Available', 'Checked Out') DEFAULT 'Available',
    TotalCopies INT,
    AvailableCopies INT,
    ISBN VARCHAR(20),
    PublicationYear INT,
    AddedDate DATE
);


CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);
ALTER TABLE Members
ADD MemberType VARCHAR(50),
ADD ExpirationDate DATE,
ADD BorrowingHistoryID INT ; 

CREATE TABLE BookReservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    ReservationDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


CREATE TABLE BookCheckouts (
    CheckoutID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    CheckoutDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
CREATE TABLE MemberBorrowingHistory (
    BorrowingHistoryID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    CheckoutDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);



-- Insert sample book data
INSERT INTO Books (Title, Author, Category, Price, Status, TotalCopies, AvailableCopies, ISBN, PublicationYear, AddedDate)
VALUES
    ('Book 1', 'Author A', 'Fiction', 19.99, 'Available', 5, 5, 'ISBN123456', 2020, '2022-01-01'),
    ('Book 2', 'Author B', 'Non-Fiction', 14.99, 'Available', 3, 3, 'ISBN789012', 2019, '2022-01-05'),
    ('Book 3', 'Author C', 'Mystery', 24.99, 'Checked Out', 2, 0, 'ISBN345678', 2021, '2022-02-10'),
    -- Add more books as needed
    ('Book 4', 'Author D', 'Science', 29.99, 'Available', 4, 4, 'ISBN567890', 2018, '2022-02-15'),
    ('Book 5', 'Author E', 'Biography', 18.99, 'Available', 7, 7, 'ISBN901234', 2022, '2022-03-20');
-- Add more books as needed


-- Insert sample member data
-- Insert sample member information
INSERT INTO Members (FirstName, LastName, Email, Phone, Address, MemberType, ExpirationDate)
VALUES
    ('John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St', 'Student', '2023-12-31'),
    ('Alice', 'Smith', 'alice@example.com', '987-654-3210', '456 Elm St', 'Faculty', '2024-06-30'),
    ('Bob', 'Johnson', 'bob@example.com', '555-123-4567', '789 Oak St', 'Student', '2023-09-30'),
    -- Add more members as needed
    ('Emily', 'Brown', 'emily@example.com', '444-789-1234', '567 Pine St', 'Student', '2023-12-31'),
    ('Michael', 'Wilson', 'michael@example.com', '111-222-3333', '678 Maple St', 'Faculty', '2024-03-31');
-- Add more members as needed

-- Add more members as needed

-- Insert sample book reservations
INSERT INTO BookReservations (MemberID, BookID, ReservationDate)
VALUES
    (1, 3, '2022-02-20'), -- John reserves Book 3
    (2, 1, '2022-03-05'), -- Alice reserves Book 1
    (4, 2, '2022-03-10'), -- Emily reserves Book 2
    -- Add more reservations as needed
    (3, 4, '2022-03-15'), -- Bob reserves Book 4
    (5, 5, '2022-03-25'); -- Michael reserves Book 5
-- Add more reservations as needed

ALTER TABLE BookReservations
ADD QueuePosition INT;
-- Example: Placing a reservation for Book 1 (which is checked out)
INSERT INTO BookReservations (MemberID, BookID, ReservationDate)
VALUES (2, 1, '2022-03-25');

-- Update QueuePosition for Book 1 reservations
UPDATE BookReservations
SET QueuePosition = QueuePosition + 1
WHERE BookID = 1
AND ReservationDate < '2022-03-25';

-- Check for the next member in the queue for Book 1
SELECT MemberID
FROM BookReservations
WHERE BookID = 1
AND QueuePosition = 1;



-- Insert sample book checkouts
INSERT INTO BookCheckouts (MemberID, BookID, CheckoutDate, DueDate)
VALUES
    (1, 1, '2022-02-15', '2022-03-15'), -- John checks out Book 1
    (2, 2, '2022-03-01', '2022-03-22'), -- Alice checks out Book 2
    (3, 5, '2022-03-12', '2022-03-28'), -- Bob checks out Book 5
    -- Add more checkouts as needed
    (4, 3, '2022-03-18', '2022-04-10'), -- Emily checks out Book 3
    (5, 4, '2022-03-20', '2022-04-15'); -- Michael checks out Book 4
-- Add more checkouts as needed

-- Insert sample data into the 'MemberBorrowingHistory' table with BorrowingHistoryID
INSERT INTO MemberBorrowingHistory (BorrowingHistoryID, MemberID, BookID, CheckoutDate, ReturnDate)
VALUES
    (1, 6, 1, '2022-03-01', '2022-03-15'), -- John borrowed Book 1
    (2, 7, 2, '2022-03-02', '2022-03-18'), -- Alice borrowed Book 2
    (3, 8, 3, '2022-03-05', '2022-03-20'), -- John borrowed Book 3
    (4, 9, 4, '2022-03-10', '2022-03-25'), -- Bob borrowed Book 4
    (5, 10, 5, '2022-03-12', '2022-03-28'); -- Emily borrowed Book 5
-- Add more borrowing history records as needed




CREATE TABLE Fines (

    FineID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    CheckoutID INT,
    FineAmount DECIMAL(10, 2),
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (CheckoutID) REFERENCES BookCheckouts(CheckoutID)
);

-- Insert sample fines for late returns
INSERT INTO Fines (MemberID, CheckoutID, FineAmount, Paid)
VALUES
    (1, 1, 5.00, TRUE), 
    (2, 2, 3.50, TRUE), 
    (4, 4, 7.00, FALSE),
    (3, 3, 6.00, TRUE), 
    (5, 5, 4.25, FALSE);
    
    
    DELIMITER //

CREATE PROCEDURE CheckoutBook(IN pMemberID INT, IN pBookID INT, IN pDueDate DATE)
BEGIN
    INSERT INTO BookCheckouts (MemberID, BookID, CheckoutDate, DueDate)
    VALUES (pMemberID, pBookID, CURDATE(), pDueDate);
    
    UPDATE Books
    SET Status = 'Checked Out'
    WHERE BookID = pBookID;
    
END //

DELIMITER ;


SELECT Books.Title, COUNT(BookCheckouts.CheckoutID) AS BorrowCount
FROM Books
LEFT JOIN BookCheckouts ON Books.BookID = BookCheckouts.BookID
GROUP BY Books.BookID
ORDER BY BorrowCount DESC
LIMIT 10; -- Limit to the top 10 most borrowed books



CREATE TABLE BookReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    Review TEXT,
    Rating INT, -- e.g., 1 to 5 for star ratings
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    Message TEXT,
    IsRead BOOLEAN DEFAULT FALSE,
    NotificationDate DATETIME,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


-- Insert sample book reviews and ratings
INSERT INTO BookReviews (MemberID, BookID, Review, Rating, ReviewDate)
VALUES
    (1, 1, 'Great book!', 5, '2022-03-10'), -- John's review for Book 1
    (2, 2, 'Interesting read.', 4, '2022-03-12'), -- Alice's review for Book 2
    (3, 5, 'Loved it!', 5, '2022-03-15'), -- Bob's review for Book 5
    -- Add more reviews as needed
    (4, 3, 'Suspenseful!', 4, '2022-03-18'), -- Emily's review for Book 3
    (5, 4, 'Informative.', 3, '2022-03-20'); -- Michael's review for Book 4
-- Add more reviews as needed


-- Insert sample notifications for members
INSERT INTO Notifications (MemberID, Message, IsRead, NotificationDate)
VALUES
    (1, 'Reminder: Your book is due soon.', FALSE, '2022-03-13 10:00:00'),
    (2, 'Your book reservation is ready for pickup.', FALSE, '2022-03-14 14:30:00'),
    (3, 'Reminder: Your book is due today.', FALSE, '2022-03-15 09:45:00'),
    -- Add more notifications as needed
    (4, 'Reminder: Your book is due soon.', FALSE, '2022-03-18 11:15:00'),
    (5, 'Your fine for Book 5 is pending payment.', FALSE, '2022-03-19 16:20:00');
-- Add more notifications as needed


-- Create the 'BookCopies' table with escaped column name
CREATE TABLE BookCopies (
    CopyID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    Location VARCHAR(255),
    `Condition` TEXT, -- Escaped column name
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data into the 'BookCopies' table
INSERT INTO BookCopies (BookID, Location, `Condition`)
VALUES
    (1, 'Shelf A, Row 1', 'Good condition'),
    (1, 'Shelf B, Row 2', 'Excellent condition'),
    (2, 'Shelf C, Row 3', 'Fair condition'),
    (2, 'Shelf D, Row 1', 'Good condition'),
    (2, 'Shelf E, Row 4', 'Excellent condition'),
    (3, 'Shelf F, Row 2', 'Good condition'),
    (3, 'Shelf G, Row 3', 'Excellent condition'),
    -- Add more copies as needed
    (4, 'Shelf H, Row 1', 'Fair condition'),
    (4, 'Shelf I, Row 2', 'Good condition'),
    (5, 'Shelf J, Row 4', 'Excellent condition'),
    (5, 'Shelf K, Row 3', 'Good condition'),
    (5, 'Shelf L, Row 5', 'Excellent condition');
-- Add more copies as needed


DELIMITER //

CREATE PROCEDURE CalculateFines(IN pMemberID INT)
BEGIN
    DECLARE late_fee DECIMAL(10, 2);
    
    -- Calculate late fee for overdue books
    SELECT SUM(DATEDIFF(ReturnDate, DueDate) * 0.50)
    INTO late_fee
    FROM MemberBorrowingHistory
    WHERE MemberID = pMemberID
    AND ReturnDate > DueDate;
    
    -- Update fines for the member
    UPDATE Fines
    SET FineAmount = late_fee
    WHERE MemberID = pMemberID;
    
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER UpdateFinesOnReturn
AFTER INSERT ON MemberBorrowingHistory
FOR EACH ROW
BEGIN
    CALL CalculateFines(NEW.MemberID);
END //

DELIMITER ;



Select * from BookCheckouts;
Select * from BookCopies;
Select * from BookReservations;
Select * from BookReviews;
Select * from Books;
Select * from Fines;
Select * from MemberBorrowingHistory;
Select * from MEMBERS;
Select * from Notifications;

