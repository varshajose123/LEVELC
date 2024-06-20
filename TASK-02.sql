mysql> CREATE TABLE Students (
    ->     ID INT,
    ->     Name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Friends (
    ->     ID INT,
    ->     Friend_ID INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Packages (
    ->     ID INT,
    ->     Salary FLOAT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> -- Insert into Students table
mysql> INSERT INTO Students (ID, Name)
    -> VALUES
    ->     (1, 'Alice'),
    ->     (2, 'Bob'),
    ->     (3, 'Charlie'),
    ->     (4, 'David');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert into Friends table
mysql> INSERT INTO Friends (ID, Friend_ID)
    -> VALUES
    ->     (1, 2),  -- Alice's best friend is Bob
    ->     (2, 1),  -- Bob's best friend is Alice
    ->     (3, 4),  -- Charlie's best friend is David
    ->     (4, 3);  -- David's best friend is Charlie
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert into Packages table
mysql> INSERT INTO Packages (ID, Salary)
    -> VALUES
    ->     (1, 80.0),   -- Alice's best friend (Bob) has a higher salary
    ->     (2, 75.0),   -- Charlie's best friend (David) has a higher salary
    ->     (3, 90.0),   -- Bob's best friend (Alice) has a higher salary
    ->     (4, 70.0);   -- David's best friend (Charlie) has a higher salary
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT s.Name
    -> FROM Students s
    -> JOIN Friends f ON s.ID = f.ID
    -> JOIN Packages p1 ON f.Friend_ID = p1.ID
    -> JOIN Packages p2 ON s.ID = p2.ID
    -> WHERE p1.Salary > p2.Salary
    -> ORDER BY p1.Salary;
+-------+
| Name  |
+-------+
| Bob   |
| David |
+-------+
2 rows in set (0.00 sec)
