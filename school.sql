create database School;
use school;


-- Create a table to store general student details
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    ContactNumber VARCHAR(15),
    YearOfAdmission INT,
    Course VARCHAR(50)
);

-- Create a table to store attendance records
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    Date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create a table to store exam results
CREATE TABLE Results (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    ExamDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create a table to store fee payments
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY,
    StudentID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create a table to store scholarship information
CREATE TABLE Scholarships (
    ScholarshipID INT PRIMARY KEY,
    StudentID INT,
    ScholarshipName VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


/*--------INSERT VALUES IN EACH TABLES-------*/

-- Insert values into the Students table
INSERT INTO Students (StudentID, FirstName, LastName, Address, ContactNumber, YearOfAdmission, Course)
VALUES
(1, 'John', 'Doe', '123 Main St', '555-123-4567', 2020, 'Computer Science'),
(2, 'Jane', 'Smith', '456 Elm St', '555-987-6543', 2019, 'Mathematics'),
(3, 'Emily', 'Johnson', '789 Oak St', '555-567-8901', 2021, 'Biology'),
(4, 'Michael', 'Brown', '101 Pine St', '555-234-5678', 2022, 'History'),
(5, 'Sophia', 'Lee', '555 Cedar St', '555-678-1234', 2020, 'Physics'),
(6, 'Daniel', 'Garcia', '222 Maple St', '555-345-6789', 2021, 'Chemistry'),
(7, 'Olivia', 'Martinez', '777 Birch St', '555-789-2345', 2019, 'English'),
(8, 'William', 'Miller', '444 Spruce St', '555-456-7890', 2022, 'Psychology'),
(9, 'Ava', 'Davis', '666 Willow St', '555-890-1234', 2020, 'Sociology'),
(10, 'James', 'Harris', '888 Redwood St', '555-123-5678', 2021, 'Geology'),
(11, 'Mia', 'Clark', '123 Sequoia St', '555-234-8901', 2022, 'Economics'),
(12, 'Benjamin', 'White', '333 Cedar St', '555-678-2345', 2019, 'Political Science');

-- Insert values into the Attendance table
INSERT INTO Attendance (AttendanceID, StudentID, Date, Status)
VALUES
(1, 1, '2023-09-20', 'Present'),
(2, 2, '2023-09-20', 'Absent'),
(3, 3, '2023-09-20', 'Present'),
(4, 4, '2023-09-20', 'Absent'),
(5, 5, '2023-09-20', 'Present'),
(6, 6, '2023-09-20', 'Present'),
(7, 7, '2023-09-20', 'Absent'),
(8, 8, '2023-09-20', 'Present'),
(9, 9, '2023-09-20', 'Absent'),
(10, 10, '2023-09-20', 'Present'),
(11, 11, '2023-09-20', 'Present'),
(12, 12, '2023-09-20', 'Absent');

-- Insert values into the Results table
INSERT INTO Results (ResultID, StudentID, CourseName, ExamDate, Grade)
VALUES
(1, 1, 'Math101', '2023-09-15', 'A'),
(2, 2, 'CS101', '2023-09-15', 'B'),
(3, 3, 'Biology101', '2023-09-15', 'B'),
(4, 4, 'History101', '2023-09-15', 'C'),
(5, 5, 'Physics101', '2023-09-15', 'A'),
(6, 6, 'Chemistry101', '2023-09-15', 'A+'),
(7, 7, 'English101', '2023-09-15', 'B'),
(8, 8, 'Psychology101', '2023-09-15', 'A'),
(9, 9, 'Sociology101', '2023-09-15', 'B+'),
(10, 10, 'Geology101', '2023-09-15', 'A'),
(11, 11, 'Economics101', '2023-09-15', 'C+'),
(12, 12, 'PoliticalScience101', '2023-09-15', 'B');

-- Insert values into the Fees table
INSERT INTO Fees (FeeID, StudentID, PaymentDate, Amount)
VALUES
(1, 1, '2023-09-10', 1000.00),
(2, 2, '2023-09-12', 800.00),
(3, 3, '2023-09-10', 1200.00),
(4, 4, '2023-09-12', 950.00),
(5, 5, '2023-09-10', 1100.00),
(6, 6, '2023-09-12', 1300.00),
(7, 7, '2023-09-10', 1000.00),
(8, 8, '2023-09-12', 1250.00),
(9, 9, '2023-09-10', 1050.00),
(10, 10, '2023-09-12', 1150.00),
(11, 11, '2023-09-10', 900.00),
(12, 12, '2023-09-12', 1100.00);


-- Insert values into the Scholarships table
INSERT INTO Scholarships (ScholarshipID, StudentID, ScholarshipName, Amount)
VALUES
(1, 1, 'Merit Scholarship', 500.00),
(2, 2, 'STEM Scholarship', 700.00),
(3, 3, 'Science Scholarship', 500.00),
(4, 4, 'History Scholarship', 400.00),
(5, 5, 'Math Scholarship', 600.00),
(6, 6, 'Chemistry Scholarship', 700.00),
(7, 7, 'English Scholarship', 450.00),
(8, 8, 'Psychology Scholarship', 550.00),
(9, 9, 'Sociology Scholarship', 480.00),
(10, 10, 'Geology Scholarship', 520.00),
(11, 11, 'Economics Scholarship', 420.00),
(12, 12, 'Political Science Scholarship', 470.00);

/*------- relationship------*/

ALTER TABLE Attendance
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE Results
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE Fees
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE Scholarships
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);


/*----store procedure----*/

DELIMITER //

CREATE PROCEDURE GetStudentDetails(IN studentID INT)
BEGIN
    SELECT
        S.FirstName,
        S.LastName,
        S.Address,
        S.ContactNumber,
        S.YearOfAdmission,
        S.Course,
        A.Date AS AttendanceDate,
        A.Status AS AttendanceStatus,
        R.CourseName AS ResultCourse,
        R.ExamDate AS ResultExamDate,
        R.Grade AS ResultGrade,
        F.PaymentDate AS FeePaymentDate,
        F.Amount AS FeeAmount,
        SCH.ScholarshipName,
        SCH.Amount AS ScholarshipAmount
    FROM Students S
    LEFT JOIN Attendance A ON S.StudentID = A.StudentID
    LEFT JOIN Results R ON S.StudentID = R.StudentID
    LEFT JOIN Fees F ON S.StudentID = F.StudentID
    LEFT JOIN Scholarships SCH ON S.StudentID = SCH.StudentID
    WHERE S.StudentID = studentID;
END //

DELIMITER ;




