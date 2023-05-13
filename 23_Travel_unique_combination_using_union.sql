Create Table Travel_Table(
Start_Location Varchar(30),
End_Location Varchar(30),
Distance int);

Insert into Travel_Table Values('Delhi','Pune',1400);
Insert into Travel_Table Values('Pune','Delhi',1400);
Insert into Travel_Table Values('Bangalore','Chennai',350);
Insert into Travel_Table Values('Mumbai','Ahmedabad',500);
Insert into Travel_Table Values('Chennai','Bangalore',350);
Insert into Travel_Table Values('Patna','Ranchi',300);

--Start_Location,End_Location,Distance
--Bangalore,Chennai,350
--Chennai,Bangalore,350
--Mumbai,Ahmedabad,500
--Patna,Ranchi,300
--Delhi,Pune,1400
--Pune,Delhi,1400

SELECT * FROM travel_table WHERE start_location < end_location
UNION
SELECT * FROM travel_table A WHERE NOT EXISTS
(SELECT * FROM travel_table B WHERE A.start_location=B.end_location);
