CREATE KEYSPACE IF NOT EXISTS Company WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE Company;

CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name TEXT,
    department TEXT,
    designation TEXT,
    salary FLOAT
);
INSERT INTO Employee (id, name, department, designation, salary) VALUES (1, 'John Doe', 'IT', 'Manager', 90000);
INSERT INTO Employee (id, name, department, designation, salary) VALUES (2, 'Jane Smith', 'HR', 'Manager', 95000);
INSERT INTO Employee (id, name, department, designation, salary) VALUES (3, 'Alice Johnson', 'Finance', 'Assistant Manager', 75000);
INSERT INTO Employee (id, name, department, designation, salary) VALUES (4, 'Bob Williams', 'IT', 'Manager', 100000);
SELECT name, department FROM Employee WHERE designation = 'Manager' AND salary > 85000 ORDER BY salary DESC;
UPDATE Employee SET previous_experience = 15 WHERE id = 4;

COPY Employee (id, name, department, designation, salary) FROM 'file_path.csv' WITH HEADER = true;





CREATE KEYSPACE Company WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};

USE Company;

CREATE TABLE Employee (
    id UUID PRIMARY KEY,
    name TEXT,
    department TEXT,
    designation TEXT,
    salary DECIMAL
);

INSERT INTO Employee (id, name, department, designation, salary)
VALUES (uuid(), 'Alice Johnson', 'HR', 'Manager', 90000);

SELECT name, department FROM Employee
WHERE designation = 'Manage  r' AND salary > 85000
ORDER BY salary DESC;

ALTER TABLE Employee ADD previous_experience INT;

UPDATE Employee SET previous_experience = 15 WHERE id = 4;

COPY Employee (id, name, department, designation, salary) 
FROM '/path/to/yourfile.csv' WITH HEADER = TRUE;







CREATE KEYSPACE IF NOT EXISTS Employee 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};


CREATE TABLE IF NOT EXISTS Employee_Info (
    Emp_Id INT,
    Emp_Name TEXT,
    Designation TEXT,
    Date_of_Joining DATE,
    Salary DECIMAL,
    Dept_Name TEXT,
    PRIMARY KEY (Dept_Name, Salary, Emp_Id)
);



BEGIN BATCH
INSERT INTO Employee_Info (Emp_Id, Emp_Name, Designation, Date_of_Joining, Salary, Dept_Name) 
VALUES (101, 'John Doe', 'Manager', '2023-01-15', 50000, 'Engineering');

INSERT INTO Employee_Info (Emp_Id, Emp_Name, Designation, Date_of_Joining, Salary, Dept_Name) 
VALUES (102, 'Jane Smith', 'Developer', '2023-02-20', 40000, 'Marketing');

APPLY BATCH;



UPDATE Employee_Info 
SET Emp_Name = 'New Name', Dept_Name = 'New Department' 
WHERE Emp_Id = 121;


SELECT * FROM Employee_Info 
WHERE Dept_Name = 'Engineering' 
ORDER BY Salary DESC;


ALTER TABLE Employee_Info 
ADD Projects SET<TEXT>;


UPDATE Employee_Info 
SET Projects = {'Project A', 'Project B'} 
WHERE Emp_Id = 101;


SELECT * FROM Employee_Info 
USING TTL 15;


