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
| StudentFees       |
| StudentMaster     |
+-------------------+
7 rows in set (0.00 sec)

mysql> create table LibraryBook (BookID int primary key,BookTitle varchar(30) NOT NULL,Price float(8,2) NOT NULL,Status varchar(20) NOT NULL);
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> desc LibraryBook;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| BookID    | int         | NO   | PRI | NULL    |       |
| BookTitle | varchar(30) | NO   |     | NULL    |       |
| Price     | float(8,2)  | NO   |     | NULL    |       |
| Status    | varchar(20) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> INSERT INTO LibraryBook VALUES
    -> (1, 'DBMS', '978101', 101, 450, 'Available'),
    -> (2, 'Java Programming', '978102', 102, 600, 'Issued'),
    -> (3, 'Python Basics', '978103', 103, 550, 'Available'),
    -> (4, 'C Programming', '978104', 101, 400, 'Issued'),
    -> (5, 'Web Development', '978105', 104, 750, 'Available'),
    -> (6, 'Computer Networks', '978106', 102, 650, 'Issued'),
    -> (7, 'Operating System', '978107', 103, 500, 'Available'),
    -> (8, 'Data Structures', '978108', 104, 800, 'Available');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> drop LibraryBook;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'LibraryBook' at line 1
mysql> CREATE TABLE LibraryBook (
    ->     BookID INT PRIMARY KEY,
    ->     BookTitle VARCHAR(100) NOT NULL,
    ->     ISBN VARCHAR(20) UNIQUE,
    ->     SupplierID INT,
    ->     Price DECIMAL(10,2),
    ->     Status VARCHAR(20)
    -> );
ERROR 1050 (42S01): Table 'LibraryBook' already exists
mysql> drop table LibraryBook;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE LibraryBook (     BookID INT PRIMARY KEY,     BookTitle VARCHAR(100) NOT NULL,     ISBN VARCHAR(20) UNIQUE,     SupplierID INT,     Price DECIMAL(10,2),     Status VARCHAR(20) );
Query OK, 0 rows affected (0.02 sec)

mysql> desc LibraryBook;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| BookID     | int           | NO   | PRI | NULL    |       |
| BookTitle  | varchar(100)  | NO   |     | NULL    |       |
| ISBN       | varchar(20)   | YES  | UNI | NULL    |       |
| SupplierID | int           | YES  |     | NULL    |       |
| Price      | decimal(10,2) | YES  |     | NULL    |       |
| Status     | varchar(20)   | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> NSERT INTO LibraryBook VALUES
    -> (1, 'DBMS', '978101', 101, 450, 'Available'),
    -> (2, 'Java Programming', '978102', 102, 600, 'Issued'),
    -> (3, 'Python Basics', '978103', 103, 550, 'Available'),
    -> (4, 'C Programming', '978104', 101, 400, 'Issued'),
    -> (5, 'Web Development', '978105', 104, 750, 'Available'),
    -> (6, 'Computer Networks', '978106', 102, 650, 'Issued'),
    -> (7, 'Operating System', '978107', 103, 500, 'Available'),
    -> (8, 'Data Structures', '978108', 104, 800, 'Available');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NSERT INTO LibraryBook VALUES
(1, 'DBMS', '978101', 101, 450, 'Available'),
(2, ' at line 1
mysql> INSERT INTO LibraryBook VALUES (1, 'DBMS', '978101', 101, 450, 'Available'), (2, 'Java Programming', '978102', 102, 600, 'Issued'), (3, 'Python Basics', '978103', 103, 550, 'Available'), (4, 'C Programming', '978104', 101, 400, 'Issued'), (5, 'Web Development', '978105', 104, 750, 'Available'), (6, 'Computer Networks', '978106', 102, 650, 'Issued'), (7, 'Operating System', '978107', 103, 500, 'Available'), (8, 'Data Structures', '978108', 104, 800, 'Available');
Query OK, 8 rows affected (0.03 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from LiberaryBook;
ERROR 1146 (42S02): Table 'Harshad.LiberaryBook' doesn't exist
mysql> select * from LibraryBook;
+--------+-------------------+--------+------------+--------+-----------+
| BookID | BookTitle         | ISBN   | SupplierID | Price  | Status    |
+--------+-------------------+--------+------------+--------+-----------+
|      1 | DBMS              | 978101 |        101 | 450.00 | Available |
|      2 | Java Programming  | 978102 |        102 | 600.00 | Issued    |
|      3 | Python Basics     | 978103 |        103 | 550.00 | Available |
|      4 | C Programming     | 978104 |        101 | 400.00 | Issued    |
|      5 | Web Development   | 978105 |        104 | 750.00 | Available |
|      6 | Computer Networks | 978106 |        102 | 650.00 | Issued    |
|      7 | Operating System  | 978107 |        103 | 500.00 | Available |
|      8 | Data Structures   | 978108 |        104 | 800.00 | Available |
+--------+-------------------+--------+------------+--------+-----------+
8 rows in set (0.00 sec)

mysql> CREATE VIEW AvailableBooks AS
    -> SELECT BookID, BookTitle, ISBN, Price
    -> FROM LibraryBook
    -> WHERE Status = 'Available';
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM AvailableBooks;
+--------+------------------+--------+--------+
| BookID | BookTitle        | ISBN   | Price  |
+--------+------------------+--------+--------+
|      1 | DBMS             | 978101 | 450.00 |
|      3 | Python Basics    | 978103 | 550.00 |
|      5 | Web Development  | 978105 | 750.00 |
|      7 | Operating System | 978107 | 500.00 |
|      8 | Data Structures  | 978108 | 800.00 |
+--------+------------------+--------+--------+
5 rows in set (0.00 sec)

mysql> create VIEW ExpensiveBooks as select BookID,BookTitle,ISBN,Price from LibraryBook where Price > 500;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from ExpensiveBooks;
+--------+-------------------+--------+--------+
| BookID | BookTitle         | ISBN   | Price  |
+--------+-------------------+--------+--------+
|      2 | Java Programming  | 978102 | 600.00 |
|      3 | Python Basics     | 978103 | 550.00 |
|      5 | Web Development   | 978105 | 750.00 |
|      6 | Computer Networks | 978106 | 650.00 |
|      8 | Data Structures   | 978108 | 800.00 |
+--------+-------------------+--------+--------+
5 rows in set (0.00 sec)

mysql> select BookTitle,Price  from ExpensiveBooks ORDER BY Price DESC;
+-------------------+--------+
| BookTitle         | Price  |
+-------------------+--------+
| Data Structures   | 800.00 |
| Web Development   | 750.00 |
| Computer Networks | 650.00 |
| Java Programming  | 600.00 |
| Python Basics     | 550.00 |
+-------------------+--------+
5 rows in set (0.00 sec)

mysql> create VIEW BookSummary as select Count(BookID) as Total_Books ,AVG(Price) as Average_Price from LibraryBook;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from BookSummary;
+-------------+---------------+
| Total_Books | Average_Price |
+-------------+---------------+
|           8 |    587.500000 |
+-------------+---------------+
1 row in set (0.00 sec)

mysql> create VIEW BookStatusView as select BookTitle,Status from LibraryBook where Status='Issues';
Query OK, 0 rows affected (0.03 sec)

mysql> select * from BookStatusView;
Empty set (0.00 sec)

mysql> create VIEW BookStatusView as select BookTitle,Status from LibraryBook where Status='Issued';
ERROR 1050 (42S01): Table 'BookStatusView' already exists
mysql> DROP VIEW BookStatusView;
Query OK, 0 rows affected (0.01 sec)

mysql> create VIEW BookStatusView as select BookTitle,Status from LibraryBook where Status='Issued';
Query OK, 0 rows affected (0.00 sec)

mysql> select * from BookStatusView;
+-------------------+--------+
| BookTitle         | Status |
+-------------------+--------+
| Java Programming  | Issued |
| C Programming     | Issued |
| Computer Networks | Issued |
+-------------------+--------+
3 rows in set (0.00 sec)

mysql> select * form AvailableBooks;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form AvailableBooks' at line 1
mysql> select * form AvailableBooks;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form AvailableBooks' at line 1
mysql> select * form AvailableBooks;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form AvailableBooks' at line 1
mysql> select * from AvailableBooks;
+--------+------------------+--------+--------+
| BookID | BookTitle        | ISBN   | Price  |
+--------+------------------+--------+--------+
|      1 | DBMS             | 978101 | 450.00 |
|      3 | Python Basics    | 978103 | 550.00 |
|      5 | Web Development  | 978105 | 750.00 |
|      7 | Operating System | 978107 | 500.00 |
|      8 | Data Structures  | 978108 | 800.00 |
+--------+------------------+--------+--------+

