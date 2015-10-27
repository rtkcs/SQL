-- Spatial Data Types

/*
	Point
	Polygon
	LineString
	GeomCollection
	MultiPoint
	MultiLineString
	MultiPolygon
	
http://blogs.msdn.com/b/edkatibah/	
*/

CREATE TABLE Museum (
	MuseumID int IDENTITY PRIMARY KEY,
	MuseumName nvarchar(50),
	MuseumAddress nvarchar(200),
	Location geography
);
GO

INSERT INTO Museum (MuseumName, MuseumAddress, Location) VALUES
('COSI Columbus', '333 West Broad Street, Columbus, OH 43215',
geography::Parse('POINT(-83.0086 39.95954)'));
GO


INSERT INTO Museum (MuseumName, MuseumAddress, Location) VALUES
('Columbus Art Museum', '480 East Broad Street, Columbus, OH 43215',
geography::Parse('POINT(-82.98775 39.963775)'));
GO

select * from Museum;
select MuseumName, MuseumAddress, Location.ToString() as 'WKT Location' from Museum;
GO