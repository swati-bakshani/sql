Create Table Sample_Table(
ID int);
Insert into Sample_Table Values (1),(4),(7),(9),(12),(14),(16),(17),(20);
SELECT * FROM Sample_Table

Insert into Sample_Table Values (1),(4),(7),(9),(12),(14),(16),(17),(20);

ID
1
4
7
9
12
14
16
17
20

--answer
WITH max_id AS
(
SELECT MAX(id) AS maximum FROM Sample_Table
),
row_wise_rank AS
(
SELECT MIN(id) AS id FROM Sample_Table
UNION
SELECT B.id+1 FROM row_wise_rank B INNER JOIN max_id A
ON B.id < A.maximum
)
--select * from row_wise_rank;
SELECT B.id FROM row_wise_rank AS B left JOIN sample_table AS C
ON B.id = C.id
where C.id is NULL