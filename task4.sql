
mysql> CREATE TABLE Contests (
    ->     contest_id INT,
    ->     hacker_id INT,
    ->     name VARCHAR(100)  -- Assuming the name of the hacker
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Colleges (
    ->     college_id INT,
    ->     contest_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Challenges (
    ->     challenge_id INT,
    ->     contest_id INT,
    ->     college_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE View_Stats (
    ->     challenge_id INT,
    ->     total_views INT,
    ->     total_unique_views INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Submission_Stats (
    ->     challenge_id INT,
    ->     total_submissions INT,
    ->     total_accepted_submissions INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT
    ->     c.contest_id,
    ->     c.hacker_id,
    ->     c.name,
    ->     SUM(ss.total_submissions) AS total_submissions,
    ->     SUM(ss.total_accepted_submissions) AS total_accepted_submissions,
    ->     SUM(vs.total_views) AS total_views,
    ->     SUM(vs.total_unique_views) AS total_unique_views
    -> FROM
    ->     Contests c
    -> JOIN
    ->     Colleges cl ON c.contest_id = cl.contest_id
    -> JOIN
    ->     Challenges ch ON c.contest_id = ch.contest_id
    -> LEFT JOIN
    ->     View_Stats vs ON ch.challenge_id = vs.challenge_id
    -> LEFT JOIN
    ->     Submission_Stats ss ON ch.challenge_id = ss.challenge_id
    -> GROUP BY
    ->     c.contest_id, c.hacker_id, c.name
    -> HAVING
    ->     SUM(ss.total_submissions) IS NOT NULL
    ->     AND SUM(ss.total_accepted_submissions) IS NOT NULL
    ->     AND SUM(vs.total_views) IS NOT NULL
    ->     AND SUM(vs.total_unique_views) IS NOT NULL
    -> ORDER BY
    ->     c.contest_id;
Empty set (0.01 sec)

mysql> SELECT
    ->     c.contest_id,
    ->     c.hacker_id,
    ->     c.name,
    ->     COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    ->     COALESCE(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    ->     COALESCE(SUM(vs.total_views), 0) AS total_views,
    ->     COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
    -> FROM
    ->     Contests c
    -> JOIN
    ->     Colleges cl ON c.contest_id = cl.contest_id
    -> LEFT JOIN
    ->     Challenges ch ON c.contest_id = ch.contest_id
    -> LEFT JOIN
    ->     View_Stats vs ON ch.challenge_id = vs.challenge_id
    -> LEFT JOIN
    ->     Submission_Stats ss ON ch.challenge_id = ss.challenge_id
    -> GROUP BY
    ->     c.contest_id, c.hacker_id, c.name
    -> HAVING
    ->     COALESCE(SUM(ss.total_submissions), 0) > 0
    ->     AND COALESCE(SUM(ss.total_accepted_submissions), 0) > 0
    ->     AND COALESCE(SUM(vs.total_views), 0) > 0
    ->     AND COALESCE(SUM(vs.total_unique_views), 0) > 0
    -> ORDER BY
    ->     c.contest_id;
