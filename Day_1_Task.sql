-- Create table
CREATE TABLE student (
	s_id BIGINT PRIMARY KEY,
	s_name VARCHAR(100),
	semester INT
);

-- Read table
SELECT * FROM student;

-- add column into table
ALTER TABLE student ADD COLUMN branch VARCHAR(20);
-- add column into table
ALTER TABLE student ADD COLUMN semester INT;
-- delete column from table
ALTER TABLE student DROP COLUMN 
					 semester;
-- Read table
SELECT * FROM student;

-- add mutiple column
ALTER TABLE student
	ADD COLUMN branch VARCHAR(20) NOT NULL;
	SELECT*from student;



-- Create branch table
CREATE TABLE gtu_branch (
	b_id SERIAL PRIMARY KEY,
	b_name VARCHAR(20) UNIQUE NOT NULL
);
-- insert value into branch table
	INSERT INTO gtu_branch(b_name) VALUES ('CSE'),('IT'),('ICT'),('ME');
SELECT* FROM gtu_branch;

-- Insert values into table
-- INSERT INTO student(s_name,semester,branch) VALUES ('Parimal',7,'CSE');
-- INSERT INTO student(s_name,semester,branch) VALUES ('A',7,'CSE'),
-- 						   ('B',7,'IT'),
-- 						   ('C',7,'IT'),
-- 						   ('B',7,'ICT'),
-- 						   ('A',7,'IT'),
-- 						   ('D',5,'IT'),
-- 						   ('C',5,'IT'),
-- 						   ('E',3,'CIVIL');

INSERT INTO student(s_id, s_name, semester, branch)
VALUES 
  (1, 'Parimal',7,'CSE'),
  (2, 'A',7,'CSE'),
  (3, 'B',7,'IT'),
  (4, 'C',7,'IT'),
  (5, 'B',7,'ICT'),
  (6, 'A',7,'IT'),
  (7, 'D',5,'IT'),
  (8, 'C',5,'IT'),
  (9, 'E',3,'CIVIL');
  SELECT* FROM student;

-- order by 
SELECT s_name FROM student ORDER BY s_name ASC;
SELECT s_name,branch FROM student ORDER BY s_name ASC, branch DESC;

-- WHERE Clause 
SELECT * FROM student WHERE semester= '7';
SELECT s_name FROM student WHERE s_name LIKE '%A%';
SELECT s_name FROM student WHERE s_name ILIKE '%A%';
SELECT s_name FROM student WHERE s_name ILIKE '_A%';

-- join
SELECT * FROM student AS s INNER JOIN gtu_branch AS b ON s.branch = b.b_name;
SELECT * FROM student AS s LEFT JOIN gtu_branch AS b ON s.branch = b.b_name;
SELECT * FROM student AS s RIGHT JOIN gtu_branch AS b ON s.branch = b.b_name;
SELECT * FROM student AS s FULL JOIN gtu_branch AS b ON s.branch = b.b_name;
SELECT * FROM student AS s LEFT JOIN gtu_branch AS b ON s.branch = b.b_name WHERE b.b_name IS NULL;

-- Subqueries
SELECT * FROM student WHERE branch IN (SELECT b_name FROM gtu_branch);
SELECT * FROM student WHERE EXISTS (SELECT 1 FROM gtu_branch WHERE student.branch=gtu_branch.b_name);
SELECT * FROM student WHERE branch = ANY (SELECT b_name FROM gtu_branch);
SELECT * FROM student WHERE branch LIKE ANY (ARRAY['C%', '___']);

-- update row
UPDATE student SET s_name='ABC' WHERE s_id=3;

-- delete row
DELETE FROM student WHERE s_id=5;
