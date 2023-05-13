Create Table Team(
ID INT,
TeamName Varchar(50)
);

INSERT INTO Team VALUES(1,'India'),(2,'Australia'),(3,'England'),(4,'NewZealand');

--table

--ID     TeamName
--1      India
--2      Australia
--3      England
--4      NewZealand

-- SElf JOIN

WITH team_1 AS
(
Select id,teamname from team
),
team_2 AS
(
Select id,teamname from team
)
SELECT
CONCAT(team_1.teamname, " VS ", team_2.teamname) AS matches
from
team_1 INNER JOIN team_2
ON team_1.id < team_2.id
order by 1;
