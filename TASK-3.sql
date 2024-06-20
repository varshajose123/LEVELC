
mysql> CREATE TABLE Pairs (
    ->     X INT,
    ->     Y INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Pairs (X, Y)
    -> VALUES
    ->     (1, 2),
    ->     (2, 1),
    ->     (3, 4),
    ->     (4, 3),
    ->     (5, 6),
    ->     (6, 5);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT *
    -> FROM Pairs p1
    -> JOIN Pairs p2 ON p1.X = p2.Y AND p1.Y = p2.X
    -> WHERE p1.X < p1.Y
    -> ORDER BY p1.X;
+------+------+------+------+
| X    | Y    | X    | Y    |
+------+------+------+------+
|    1 |    2 |    2 |    1 |
|    3 |    4 |    4 |    3 |
|    5 |    6 |    6 |    5 |
+------+------+------+------+
3 rows in set (0.00 sec)

mysql>

