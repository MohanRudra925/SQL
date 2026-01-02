create database Jobs;

use Jobs;

create table Employees(emp_id int, emp_name varchar(50),dept_id int,
manager_id int,salary int);

Insert into Employees values (1,'Ravi',10,101,50000),
							(2,'Mohan',20,102,45000),
                            (3,'Sukku',30,103,60000),
                            (4,'Satya',40,101,52000),
                            (5,'Kiran',10,101,48000),
                            (6,'Bhavitha',20,102,61000),
                            (7,'Siddharth',30,103,47000),
                            (8,'Anusha',40,104,55000),
                            (9,'Balaji',50,105,65000),
                            (10,'Navya',null,101,43000),
                            (11,'Kavya',10,101,51000),
                            (12,'Vamsi',20,102,62000),
                            (13,'Sai',30,103,46000),
                            (14,'Sudeesh',null,null,39000),
                            (15,'Akhilesh',60,106,70000);
                            

show tables;

select * from Employees;









create table Departments(dept_id int, dept_name varchar(50), location varchar(50));

insert into Departments values(10,'HR','Hyderabad'), 
                              (20,'Finance','Mumbai'),
                              (30,'Marketing','Delhi'),
                              (40,'IT','Banglore'),
                              (50,'Sales','Chennai'),
                              (60,'Operations','Pune'),
                              (70,'Admin','Kolkata'),
                              (80,'Legal','Delhi'),
                              (90,'R & D','Banglore'),
                              (100,'Support','Hyderabad'),
                              (110,'Training','Mumbai'),
                              (120,'Logistics','Pune'),
                              (130,'Procurement','Chennai'),
                              (140,'Security','Delhi'),
                              (150,'Compliance','Mumbai');
                              
show tables;

select * from Departments;

-- Performing Inner Join
select e.emp_id,e.emp_name,d.dept_name,d.location from Employees e
Inner Join Departments d on e.dept_id=d.dept_id;

-- Performing Left Join
select e.emp_id,e.emp_name,d.dept_name from Employees e
Left Join Departments d on e.dept_id=d.dept_id;

-- Performing Right Join
select e.emp_id,e.emp_name,d.dept_name,d.location from Employees e
Right Join Departments d on e.dept_id=d.dept_id;

-- Performing Full Outer Join

select e.emp_id,e.emp_name,d.dept_name from Employees e
Left Join Departments d on e.dept_id=d.dept_id
union
select e.emp_id,e.emp_name,d.dept_name,d.location from Employees e
Right Join Departments d on e.dept_id=d.dept_id;

-- Performing Cross Join
select e.emp_name,d.dept_name from Employees e 
cross Join Departments d;