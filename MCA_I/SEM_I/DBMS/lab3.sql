student@student-OptiPlex-SFF-Plus-7010:~$ sudo apt-get install libreoffice
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libreoffice is already the newest version (4:24.2.7-0ubuntu0.24.04.6).
The following packages were automatically installed and are no longer required:
  libgl1-amber-dri libglapi-mesa
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 117 not upgraded.
student@student-OptiPlex-SFF-Plus-7010:~$ sudo apt-get update
Get:1 https://packages.microsoft.com/repos/code stable InRelease [3,590 B]
Get:2 https://packages.microsoft.com/repos/code stable/main amd64 Packages [29.3 kB]
Get:3 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]      
Hit:4 http://archive.ubuntu.com/ubuntu noble InRelease  
Get:5 http://archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Get:6 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [981 kB]
Get:7 http://archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:8 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1,232 kB]
Get:9 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [210 kB]
Get:10 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [46.4 kB]
Get:11 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [1,205 kB]
Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [76.2 kB]
Get:13 http://archive.ubuntu.com/ubuntu noble-updates/main Translation-en [288 kB]
Get:14 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [181 kB]
Get:15 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [1,486 kB]
Get:16 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1,690 kB]
Get:17 http://archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [338 kB]
Get:18 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [388 kB]
Get:19 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
Get:20 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [5,740 B]
Get:21 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [12.6 kB]
Fetched 8,551 kB in 3s (2,518 kB/s)              
Reading package lists... Done
student@student-OptiPlex-SFF-Plus-7010:~$ sudo apt-get install libreoffice
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libreoffice is already the newest version (4:24.2.7-0ubuntu0.24.04.6).
The following packages were automatically installed and are no longer required:
  libgl1-amber-dri libglapi-mesa
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 127 not upgraded.
student@student-OptiPlex-SFF-Plus-7010:~$ show databases;
Command 'show' not found, but can be installed with:
sudo apt install mailutils-mh  # version 1:3.16-1build1, or
sudo apt install mmh           # version 0.4-6
sudo apt install nmh           # version 1.8-1
student@student-OptiPlex-SFF-Plus-7010:~$ sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.46-0ubuntu0.24.04.4 (Ubuntu)

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create database Harshad;
Query OK, 1 row affected (0.01 sec)

mysql> use Harshad;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> create table EmployeeDetails(EmpID int,EmpName varchar(40),Department varchar(20),MonthlySalary int,City varchar(20));
Query OK, 0 rows affected (0.05 sec)

mysql> desc EmployeeDetails;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| EmpID         | int         | YES  |     | NULL    |       |
| EmpName       | varchar(40) | YES  |     | NULL    |       |
| Department    | varchar(20) | YES  |     | NULL    |       |
| MonthlySalary | int         | YES  |     | NULL    |       |
| City          | varchar(20) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table EmployeeDetails add Primary Key(EmpID);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc EmployeeDetails;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| EmpID         | int         | NO   | PRI | NULL    |       |
| EmpName       | varchar(40) | YES  |     | NULL    |       |
| Department    | varchar(20) | YES  |     | NULL    |       |
| MonthlySalary | int         | YES  |     | NULL    |       |
| City          | varchar(20) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into EmployeeDetails(EmpID,EmpName,Department,MonthlySalary,City)values(1,'Harshad Teli','IT',60000,'KOP');
Query OK, 1 row affected (0.03 sec)

mysql> insert into EmployeeDetails(EmpID,EmpName,Department,MonthlySalary,City)values(2,'Anurag Lad','IT',45000,'Pune'),(3,'Vardhan Patki','Marketing',35000,'Satara');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into EmployeeDetails(EmpID,EmpName,Department,MonthlySalary,City)values(4,'Kartika Phalle','IT',75000,'Karad'),(5,'Anjali Patil','IT',25000,'Mumbai');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from EmployeeDetails;
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | IT         |         75000 | Karad  |
|     5 | Anjali Patil   | IT         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
5 rows in set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_Harshad |
+-------------------+
| EmployeeDetails   |
+-------------------+
1 row in set (0.00 sec)

mysql> desc EmployeeDetails;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| EmpID         | int         | NO   | PRI | NULL    |       |
| EmpName       | varchar(40) | YES  |     | NULL    |       |
| Department    | varchar(20) | YES  |     | NULL    |       |
| MonthlySalary | int         | YES  |     | NULL    |       |
| City          | varchar(20) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select EmpID,EmpName,Monthlysalary from EmployeeDetails;
+-------+----------------+---------------+
| EmpID | EmpName        | Monthlysalary |
+-------+----------------+---------------+
|     1 | Harshad Teli   |         60000 |
|     2 | Anurag Lad     |         45000 |
|     3 | Vardhan Patki  |         35000 |
|     4 | Kartika Phalle |         75000 |
|     5 | Anjali Patil   |         25000 |
+-------+----------------+---------------+
5 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where MonthlySalary > 30000;
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | IT         |         75000 | Karad  |
+-------+----------------+------------+---------------+--------+
4 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where MonthlySalary <= 50000;
+-------+---------------+------------+---------------+--------+
| EmpID | EmpName       | Department | MonthlySalary | City   |
+-------+---------------+------------+---------------+--------+
|     2 | Anurag Lad    | IT         |         45000 | Pune   |
|     3 | Vardhan Patki | Marketing  |         35000 | Satara |
|     5 | Anjali Patil  | IT         |         25000 | Mumbai |
+-------+---------------+------------+---------------+--------+
3 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where Department='IT' AND MonthlySalary > 30000;
+-------+----------------+------------+---------------+-------+
| EmpID | EmpName        | Department | MonthlySalary | City  |
+-------+----------------+------------+---------------+-------+
|     1 | Harshad Teli   | IT         |         60000 | KOP   |
|     2 | Anurag Lad     | IT         |         45000 | Pune  |
|     4 | Kartika Phalle | IT         |         75000 | Karad |
+-------+----------------+------------+---------------+-------+
3 rows in set (0.00 sec)

mysql> update EmployeeDetails set Department='HR' where EmpID=5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from EmployeeDetails;
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | IT         |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
5 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where Department='IT' OR Department='HR';
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     4 | Kartika Phalle | IT         |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
4 rows in set (0.00 sec)

mysql> update EmployeeDetails set Department='Finance' where EmpID=4;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from EmployeeDetails;
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | Finance    |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
5 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where Department IN ('IT','HR','Finance');
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     1 | Harshad Teli   | IT         |         60000 | KOP    |
|     2 | Anurag Lad     | IT         |         45000 | Pune   |
|     4 | Kartika Phalle | Finance    |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
4 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where MonthlySalary BETWEEN 25000 AND 50000;
+-------+---------------+------------+---------------+--------+
| EmpID | EmpName       | Department | MonthlySalary | City   |
+-------+---------------+------------+---------------+--------+
|     2 | Anurag Lad    | IT         |         45000 | Pune   |
|     3 | Vardhan Patki | Marketing  |         35000 | Satara |
|     5 | Anjali Patil  | HR         |         25000 | Mumbai |
+-------+---------------+------------+---------------+--------+
3 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where EmpName LIKE 'A%';
+-------+--------------+------------+---------------+--------+
| EmpID | EmpName      | Department | MonthlySalary | City   |
+-------+--------------+------------+---------------+--------+
|     2 | Anurag Lad   | IT         |         45000 | Pune   |
|     5 | Anjali Patil | HR         |         25000 | Mumbai |
+-------+--------------+------------+---------------+--------+
2 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where Department != 'IT';
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | Finance    |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
3 rows in set (0.00 sec)

mysql> select * from EmployeeDetails where NOT Department='IT';
+-------+----------------+------------+---------------+--------+
| EmpID | EmpName        | Department | MonthlySalary | City   |
+-------+----------------+------------+---------------+--------+
|     3 | Vardhan Patki  | Marketing  |         35000 | Satara |
|     4 | Kartika Phalle | Finance    |         75000 | Karad  |
|     5 | Anjali Patil   | HR         |         25000 | Mumbai |
+-------+----------------+------------+---------------+--------+
3 rows in set (0.00 sec)

mysql> select EmpID,EmpName,MonthlySalary,(MonthlySalary*12) AS AnnualSalary from EmployeeDetails;
+-------+----------------+---------------+--------------+
| EmpID | EmpName        | MonthlySalary | AnnualSalary |
+-------+----------------+---------------+--------------+
|     1 | Harshad Teli   |         60000 |       720000 |
|     2 | Anurag Lad     |         45000 |       540000 |
|     3 | Vardhan Patki  |         35000 |       420000 |
|     4 | Kartika Phalle |         75000 |       900000 |
|     5 | Anjali Patil   |         25000 |       300000 |
+-------+----------------+---------------+--------------+
5 rows in set (0.00 sec)

mysql> create table StudentMaster(StudentID int,StudentName varchar(30),Course varchar(30),StudentAge int,Email varhar(20));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varhar(20))' at line 1
mysql> create table StudentMaster(StudentID int,StudentName varchar(30),Course varchar(30),StudentAge int,Email varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> desc StudentMaster;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| StudentID   | int         | YES  |     | NULL    |       |
| StudentName | varchar(30) | YES  |     | NULL    |       |
| Course      | varchar(30) | YES  |     | NULL    |       |
| StudentAge  | int         | YES  |     | NULL    |       |
| Email       | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table StudentMaster add primary key(StudentID);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc StudentMaster;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| StudentID   | int         | NO   | PRI | NULL    |       |
| StudentName | varchar(30) | YES  |     | NULL    |       |
| Course      | varchar(30) | YES  |     | NULL    |       |
| StudentAge  | int         | YES  |     | NULL    |       |
| Email       | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into StudentMaster(StudentID,StudentName,Course,StudentAge,Email)values(1001,'Anadhut Phalle','BCA',20,'avadhutphalle@gmail.com');
ERROR 1406 (22001): Data too long for column 'Email' at row 1
mysql> insert into StudentMaster(StudentID,StudentName,Course,StudentAge,Email)values(1001,'Anadhut Phalle','BCA',20,'avadhut@gmail.com');
Query OK, 1 row affected (0.03 sec)

mysql> insert into StudentMaster(StudentID,StudentName,Course,StudentAge,Email)values(1002,'Shree Patil','MCA',23,'shree@gmail.com'),(1003,'Shreya Vibhute','MBA',21,'shreya@gmail.com');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into StudentMaster(StudentID,StudentName,Course,StudentAge,Email)values(1004,'Neha Sutar','BSC',19,'neha@gmail.com');
Query OK, 1 row affected (0.04 sec)

mysql> insert into StudentMaster(StudentID,StudentName,Course,StudentAge,Email)values(1005,'Anurag Lad','BCA',21,'anurag@gmail.com');
Query OK, 1 row affected (0.04 sec)

mysql> select * from StudentMaster;
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1004 | Neha Sutar     | BSC    |         19 | neha@gmail.com    |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
5 rows in set (0.01 sec)

mysql> select StudentID,StudentName,Course from StudentMaster;
+-----------+----------------+--------+
| StudentID | StudentName    | Course |
+-----------+----------------+--------+
|      1001 | Anadhut Phalle | BCA    |
|      1002 | Shree Patil    | MCA    |
|      1003 | Shreya Vibhute | MBA    |
|      1004 | Neha Sutar     | BSC    |
|      1005 | Anurag Lad     | BCA    |
+-----------+----------------+--------+
5 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentAge > 20;
+-----------+----------------+--------+------------+------------------+
| StudentID | StudentName    | Course | StudentAge | Email            |
+-----------+----------------+--------+------------+------------------+
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com  |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com |
+-----------+----------------+--------+------------+------------------+
3 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentAge <=25;
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1004 | Neha Sutar     | BSC    |         19 | neha@gmail.com    |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
5 rows in set (0.00 sec)

mysql> update table StudentMaster set StudentAge =26 where StudentID=1004;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table StudentMaster set StudentAge =26 where StudentID=1004' at line 1
mysql> update  StudentMaster set StudentAge =26 where StudentID=1004;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentMaster where StudentAge <=25;
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select * from StudentMaster where Course='MCA' AND StudentAge >20;
+-----------+-------------+--------+------------+-----------------+
| StudentID | StudentName | Course | StudentAge | Email           |
+-----------+-------------+--------+------------+-----------------+
|      1002 | Shree Patil | MCA    |         23 | shree@gmail.com |
+-----------+-------------+--------+------------+-----------------+
1 row in set (0.00 sec)

mysql> select * from StudentMaster where Course='MCA' OR Course='BCA';
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
3 rows in set (0.00 sec)

mysql> select * from StudentMaster where Course IN ('MCA','BCA','MBA');
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentAge BETWEEN 18 AND 25;
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentName LIKE 'S%';
+-----------+----------------+--------+------------+------------------+
| StudentID | StudentName    | Course | StudentAge | Email            |
+-----------+----------------+--------+------------+------------------+
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com  |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com |
+-----------+----------------+--------+------------+------------------+
2 rows in set (0.00 sec)

mysql> select * from StudentMaster where Course!='MCA';
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1004 | Neha Sutar     | BSC    |         26 | neha@gmail.com    |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select * from StudentMaster where NOT  Course='MCA';
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1004 | Neha Sutar     | BSC    |         26 | neha@gmail.com    |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentName LIKE 'A' ;
Empty set (0.00 sec)

mysql> select * from StudentMaster where StudentName LIKE 'A' AND StudentAge > 20 ;
Empty set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE StudentName LIKE '%a%'
    ->   AND StudentAge > 20;
ERROR 1146 (42S02): Table 'Harshad.Students' doesn't exist
mysql> select * from StudentMaster where StudentName LIKE "%a%";
+-----------+----------------+--------+------------+-------------------+
| StudentID | StudentName    | Course | StudentAge | Email             |
+-----------+----------------+--------+------------+-------------------+
|      1001 | Anadhut Phalle | BCA    |         20 | avadhut@gmail.com |
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com   |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com  |
|      1004 | Neha Sutar     | BSC    |         26 | neha@gmail.com    |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com  |
+-----------+----------------+--------+------------+-------------------+
5 rows in set (0.00 sec)

mysql> select * from StudentMaster where StudentName LIKE "%a%" AND StudentAge>20;
+-----------+----------------+--------+------------+------------------+
| StudentID | StudentName    | Course | StudentAge | Email            |
+-----------+----------------+--------+------------+------------------+
|      1002 | Shree Patil    | MCA    |         23 | shree@gmail.com  |
|      1003 | Shreya Vibhute | MBA    |         21 | shreya@gmail.com |
|      1004 | Neha Sutar     | BSC    |         26 | neha@gmail.com   |
|      1005 | Anurag Lad     | BCA    |         21 | anurag@gmail.com |
+-----------+----------------+--------+------------+------------------+
4 rows in set (0.00 sec)

mysql> 

