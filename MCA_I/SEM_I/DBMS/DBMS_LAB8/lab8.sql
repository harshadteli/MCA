student@student-OptiPlex-SFF-Plus-7010:~$ sudo mysql
[sudo] password for student: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
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
| Harshad            |
| information_schema |
| mysql              |
| performance_schema |
| piyush             |
| sys                |
+--------------------+
6 rows in set (0.01 sec)

mysql> use Harshad;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_Harshad |
+-------------------+
| BankTransaction   |
| Department        |
| Employee          |
| EmployeeDetails   |
| ProductDetails    |
| StudentMaster     |
+-------------------+
6 rows in set (0.00 sec)

mysql> create table StudentFees(StudentID int Primary Key,StudentName varchar(30),TotalFees int,PaidFees int,PendingFees int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc StudentFees;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| StudentID   | int         | NO   | PRI | NULL    |       |
| StudentName | varchar(30) | YES  |     | NULL    |       |
| TotalFees   | int         | YES  |     | NULL    |       |
| PaidFees    | int         | YES  |     | NULL    |       |
| PendingFees | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.03 sec)

mysql> insert into StudentFees(StudentID,StudentName,TotalFees,PaidFees,PendingFees)values(1001,'Anurag Lad',100000,60000.40000);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into StudentFees(StudentID,StudentName,TotalFees,PaidFees,PendingFees)values(1001,'Anurag Lad',100000,60000.40000);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into StudentFees(StudentID,StudentName,TotalFees,PaidFees,PendingFees)values(1001,'Anurag Lad',100000,60000,40000);
Query OK, 1 row affected (0.03 sec)

mysql> insert into StudentFees(StudentID,StudentName,TotalFees,PaidFees,PendingFees)values(1002,'Harshad Teli',100000,50000,50000),(1003,'Vardhan Patki',100000,90000,10000),(1003,'Neha Sutar',100000,70000,30000),(1005,'Anjali Patil',100000,65000,35000);
ERROR 1062 (23000): Duplicate entry '1003' for key 'StudentFees.PRIMARY'
mysql> insert into StudentFees(StudentID,StudentName,TotalFees,PaidFees,PendingFees)values(1002,'Harshad Teli',100000,50000,50000),(1003,'Vardhan Patki',100000,90000,10000),(1004,'Neha
 Sutar',100000,70000,30000),(1005,'Anjali Patil',100000,65000,35000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    60000 |       40000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> savepoint a;
Query OK, 0 rows affected (0.00 sec)

mysql> update StudentFees set PaidFees=70000 where StudentID=1001;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       40000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> end transcation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'end transcation' at line 1
mysql> update StudentFees set PaidFees=60000 where StudentID=1001;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> start transcation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'transcation' at line 1
mysql> start transaction;
Query OK, 0 rows affected (0.01 sec)

mysql> update StudentFees set PaidFees=PaidFess+10000,PendingFees=PendingFees-10000 where StudentID=1001;
ERROR 1054 (42S22): Unknown column 'PaidFess' in 'field list'
mysql> update StudentFees set PaidFees=PaidFees+10000,PendingFees=PendingFees-10000 where StudentID=1001;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> SAVEPOINT S1;
Query OK, 0 rows affected (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+20000,PendingFees=PendingFees-20000 where StudentID=1002;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    70000 |       30000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> SAVEPOINT SP2;
Query OK, 0 rows affected (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees-20000,PendingFees=PendingFees+20000 where StudentID=1002;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+15000,PendingFees=PendingFees-15000 where StudentID=1002;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    65000 |       35000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+20000,PendingFees=PendingFees-20000 where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    65000 |       35000 |
|      1003 | Vardhan Patki |    100000 |   110000 |      -10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> ROLLBACK TO SP1;
ERROR 1305 (42000): SAVEPOINT SP1 does not exist
mysql> ROLLBACK TO S1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    70000 |       30000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+5000,PendingFees=PendingFees-5000 where StudentID=1004;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |    90000 |       10000 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=80000 where StduentID=1003;
ERROR 1054 (42S22): Unknown column 'StduentID' in 'where clause'
mysql> update StudentFees set PaidFees=80000 where StuduentID=1003;
ERROR 1054 (42S22): Unknown column 'StuduentID' in 'where clause'
mysql> update StudentFees set PaidFees=80000 where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update StudentFees set PaidFees=PaidFees+20000,PendingFees=PendingFees-20000 where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |   100000 |      -10000 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+20000,PendingFees=TotalFees-PaidFees where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |   120000 |      -20000 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> update StudentFees set PaidFees=80000 where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update StudentFees set PaidFees=PaidFees+20000,PendingFees=TotalFees-PaidFees where StudentID=1003;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |   100000 |           0 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql> Start Transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update StudentFees set PaidFees=PaidFees+8000,PendingFees=TotalFees-PaidFees where StudentID=1005;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |   100000 |           0 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    73000 |       27000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from StudentFees;
+-----------+---------------+-----------+----------+-------------+
| StudentID | StudentName   | TotalFees | PaidFees | PendingFees |
+-----------+---------------+-----------+----------+-------------+
|      1001 | Anurag Lad    |    100000 |    70000 |       30000 |
|      1002 | Harshad Teli  |    100000 |    50000 |       50000 |
|      1003 | Vardhan Patki |    100000 |   100000 |           0 |
|      1004 | Neha Sutar    |    100000 |    75000 |       25000 |
|      1005 | Anjali Patil  |    100000 |    65000 |       35000 |
+-----------+---------------+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> /q
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '/q' at line 1
mysql> \q

