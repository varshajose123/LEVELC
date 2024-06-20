mysql> CREATE DATABASE LEVELC;
Query OK, 1 row affected (0.03 sec)

mysql> USE LEVELC;
Database changed
mysql> CREATE TABLE Projects (
    ->     Task_ID INT,
    ->     Start_Date DATE,
    ->     End_Date DATE
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Projects (Task_ID, Start_Date, End_Date)
    -> VALUES
    ->     (1, '2015-10-01', '2015-10-02'),
    ->     (2, '2015-10-02', '2015-10-03'),
    ->     (3, '2015-10-03', '2015-10-04'),
    ->     (4, '2015-10-13', '2015-10-14'),
    ->     (5, '2015-10-14', '2015-10-15'),
    ->     (6, '2015-10-28', '2015-10-29'),
    ->     (7, '2015-10-30', '2015-10-31');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT
    ->     Project_Start_Date,
    ->     Project_End_Date
    -> FROM (
    ->     SELECT
    ->         ProjectID,
    ->         MIN(Start_Date) AS Project_Start_Date,
    ->         MAX(End_Date) AS Project_End_Date,
    ->         DATEDIFF(MAX(End_Date), MIN(Start_Date)) AS Completion_Days
    ->     FROM (
    ->         SELECT
    ->             Task_ID,
    ->             Start_Date,
    ->             End_Date,
    ->             (SELECT COUNT(*) FROM Projects p2 WHERE p2.Start_Date <= p1.End_Date) AS ProjectID
    ->         FROM Projects p1
    ->     ) AS ProjectBoundaries
    ->     GROUP BY ProjectID
    -> ) AS ProjectGroups
    -> ORDER BY
    ->     Completion_Days ASC,
    ->     Project_Start_Date ASC;
+--------------------+------------------+
| Project_Start_Date | Project_End_Date |
+--------------------+------------------+
| 2015-10-01         | 2015-10-02       |
| 2015-10-28         | 2015-10-29       |
| 2015-10-30         | 2015-10-31       |
| 2015-10-02         | 2015-10-04       |
| 2015-10-13         | 2015-10-15       |
+--------------------+------------------+
5 rows in set (0.01 sec)



