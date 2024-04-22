DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

CREATE TABLE Students(
    Sno VARCHAR(100),
    Sname TEXT,
    SGPA TEXT,
    Scity VARCHAR(25),
    Cno TEXT
);

CREATE TABLE Courses(
    Cno TEXT,
    Cname TEXT,
    Cduration_year VARCHAR(25)
);
INSERT INTO Students (Sno, Sname, SGPA, Scity, Cno)
VALUES ('S1', 'Saman', '2.60', 'Kegalle', 'C1'),
       ('S2', 'Kamal', '2.45', 'Kandy', 'C2'),
       ('S3', 'Joe', '3.20', 'Galle', 'C3'),
       ('S4', 'Ruwan', '4.00', 'Kandy', 'C1'),
       ('S5', 'Asela', '3.50', 'Jaffna', 'C4'),
       ('S6', 'Asanka', '2.88', 'Galle', 'C2'),
       ('S7', 'Wasana', '2.75', 'Colombo', 'C3'),
       ('S8', 'Dilini', '3.35', 'Kandy', 'C1'),
       ('S9', 'Aruna', '2.76', 'Galle', 'C4'),
       ('S10', 'Gavani', '3.00', 'Jaffna', 'C4');

 
INSERT INTO Courses (Cno, Cname, Cduration_year)
VALUES ('C1', 'HNDA', '4'),
       ('C2', 'HNDIT', '2'),
       ('C3', 'HNDM', '3'),
       ('C4', 'HNDE', '2');

SELECT Sname, SGPA FROM Students;

SELECT Sname FROM Students WHERE CAST(SGPA AS FLOAT) > 3.00;

SELECT Cno, COUNT(*) AS Num_Students FROM Students GROUP BY Cno;

SELECT Students.Sname, Students.SGPA, Courses.Cname FROM Students JOIN Courses ON Students.Cno = Courses.Cno;

SELECT * FROM Students ORDER BY CAST(SGPA AS FLOAT) ASC;


