CREATE TABLE colleges (
	id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
	id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	collegeId INTEGER,
	FOREIGN KEY (collegeId) REFERENCES colleges(id)
);

CREATE TABLE rankings (
	studentId INTEGER,
	ranking INTEGER NOT NULL,
	year INTEGER NOT NULL,
	FOREIGN KEY (studentId) REFERENCES students(id)
);

INSERT INTO colleges (id, name) VALUES
(1, 'Greenwich University'),
(2, 'Riverside College'),
(3, 'Pinewood University'),
(4, 'Hilltop College'),
(5, 'Lakeside Institute'),
(6, 'Sunset University'),
(7, 'Broadway College'),
(8, 'Eastview University');


INSERT INTO students (id, name, collegeId) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Michael Johnson', 3),
(4, 'Emily Davis', 4),
(5, 'David Wilson', 5),
(6, 'Sarah Martinez', 6),
(7, 'James Brown', 7),
(8, 'Jessica Taylor', 8),
(9, 'Daniel Anderson', 1),
(10, 'Laura Thomas', 2),
(11, 'Ryan Jackson', 3),
(12, 'Olivia White', 4),
(13, 'Joshua Harris', 5),
(14, 'Megan Martin', 6),
(15, 'Matthew Lee', 7),
(16, 'Sophia Clark', 8),
(17, 'Andrew Lewis', 1),
(18, 'Chloe Walker', 2),
(19, 'Christopher Hall', 3),
(20, 'Abigail Young', 4),
(21, 'Nathan Allen', 5),
(22, 'Madison King', 6),
(23, 'Alexander Wright', 7),
(24, 'Elizabeth Scott', 8),
(25, 'Anthony Green', 1),
(26, 'Isabella Adams', 2),
(27, 'Nicholas Baker', 3),
(28, 'Samantha Gonzalez', 4),
(29, 'Tyler Nelson', 5),
(30, 'Grace Carter', 6),
(31, 'Ethan Mitchell', 7),
(32, 'Lily Perez', 8),
(33, 'Benjamin Roberts', 1),
(34, 'Hannah Turner', 2),
(35, 'Aiden Phillips', 3),
(36, 'Zoe Campbell', 4),
(37, 'Logan Parker', 5),
(38, 'Sofia Evans', 6),
(39, 'Lucas Edwards', 7),
(40, 'Victoria Collins', 8),
(41, 'Mason Stewart', 1),
(42, 'Amelia Sanchez', 2),
(43, 'Jackson Morris', 3),
(44, 'Ella Rogers', 4),
(45, 'Liam Reed', 5),
(46, 'Avery Cook', 6),
(47, 'Jacob Morgan', 7),
(48, 'Layla Bell', 8),
(49, 'William Murphy', 1),
(50, 'Harper Bailey', 2);

INSERT INTO rankings (studentId, ranking, year) VALUES
(1, 4, 2006),
(2, 2, 2015),
(3, 5, 2007),
(4, 6, 2008),
(5, 3, 2015),
(6, 7, 2009),
(7, 1, 2015),
(8, 8, 2010),
(9, 9, 2011),
(10, 10, 2012),
(11, 5, 2006),
(12, 1, 2015),
(13, 6, 2007),
(14, 7, 2008),
(15, 4, 2015),
(16, 8, 2009),
(17, 9, 2010),
(18, 10, 2011),
(19, 3, 2015),
(20, 5, 2010),
(21, 6, 2006),
(22, 10, 2007),
(23, 7, 2008),
(24, 8, 2009),
(25, 9, 2010),
(26, 2, 2015),
(27, 10, 2011),
(28, 4, 2006),
(29, 5, 2007),
(30, 6, 2008),
(31, 7, 2009),
(32, 8, 2010),
(33, 9, 2011),
(34, 10, 2012),
(35, 4, 2006),
(36, 1, 2015),
(37, 6, 2007),
(38, 7, 2008),
(39, 8, 2009),
(40, 9, 2010),
(41, 10, 2011),
(42, 3, 2015),
(43, 4, 2006),
(44, 5, 2007),
(45, 6, 2008),
(46, 7, 2009),
(47, 8, 2010),
(48, 9, 2011),
(49, 10, 2012),
(50, 5, 2015);


-- Submission Query :

SELECT c.name AS 'College Name', MIN(r.ranking) AS 'Highest Rank', COUNT(r.studentId) AS 'Number of Students'
FROM students s
JOIN rankings r
	ON s.id = r.studentId
JOIN colleges c
	ON s.collegeId = c.id
WHERE r.year = 2015 AND r.ranking BETWEEN 1 AND 3
GROUP BY c.name