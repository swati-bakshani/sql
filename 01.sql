CREATE TABLE Transaction_Tbl(
 CustID int ,
 TranID int ,
 TranAmt float ,
 TranDate date
);


INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date));
INSERT into Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date));


WITH CTE AS
(
SELECT custID, tranID, TranAmt FROM transaction_tbl
),
CTE_maxtran AS
(
SELECT custID, max(tranamt) as Max_tranamt
FROM transaction_tbl
GROUP BY custID
)
SELECT A.TranID,A.custID,Max_tranamt,(tranamt/Max_tranamt) AS Ratio
FROM CTE A
INNER JOIN CTE_maxtran B
ON A.CustID=B.CustID