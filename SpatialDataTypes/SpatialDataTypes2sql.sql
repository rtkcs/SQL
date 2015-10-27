------------------------------------------------------- 
CREATE TABLE Airports(
	AirportID int IDENTITY PRIMARY KEY,
	AirportName nvarchar(50),
	AirportCode nchar(3),
	Location geography
);
GO


INSERT INTO Airports(AirportName, AirportCode, Location) VALUES
('Los Angeles International Airport','LAX', 
geography::STGeomFromText('POINT(-118.4071611 33.9425222)',4326));

INSERT INTO Airports(AirportName, AirportCode, Location) VALUES
('London Heathrow Airport','LHR',
geography::Parse('POINT(-0.45277777 51.47138888)'))
GO

SELECT * FROM Airports;

-------------------------------------------------------
CREATE TABLE Sales(
	SalesPersonID int IDENTITY PRIMARY KEY,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	SalesRegionName nvarchar(50),
	SalesRegion geography
);
GO

INSERT INTO Sales (FirstName, LastName, SalesRegionName, SalesRegion)
VALUES 
('Kim','Abercrombie','Southeast US,Florida, Georgia, Alabama',
geography::STGeomFromText('POLYGON(( -88.34609167 30.286825,
-86.28281667 30.43045278,
-85.10322222 29.63877222,
-84.04541389 30.06674722,
-82.78871389 29.10671339,
-82.80399722 28.12101667,
-82.63304722 27.47348611,
-82.12766111 26.46439722,
-81.65219167 25.88982778,
-81.06721944 25.18627222,
-80.41878333 25.15618611,
-80.01395278 26.75898889,
-80.55964722 28.29220833,
-80.53146667 28.59193056,
-81.41381944 30.69794444,
-80.90161944 31.97196944,
-83.19839167 34.92200556,
-88.13663611 34.96236944,
-88.34609167 30.286825 ))',4326));

select * from Sales;