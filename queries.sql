-- Query all of the entries in the Genre table  
SELECT * from Genre
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist 
VALUES (null, 'Langhorne Slim', 2006)
-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
VALUES (null, 'The Way We Move', 2012, 10, "Ramseur Records",  31, 8)
-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
VALUES (null, "Past Lives", 4.22, 2012, 8, 31, 23)
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title as "album title", s.Title as "song title"
FROM Album a
LEFT JOIN Song s ON s.Albumid = a.Albumid;

SELECT s.title as "song title", al.title as "album title", ar.artistname as "artist name"
From Song s
LEFT JOIN album al on al.albumid = s.albumid
LEFT JOIN artist ar on s.artistid = ar.artistid
WHERE ar.ArtistName = "ZZTop"
AND al.title like "eliminator";

SELECT al.title as "album title", ar.artistname as "artist name"
FROM artist ar
LEFT JOIN album al on al.artistid = ar.artistid;

SELECT al.title as "album title", ar.artistname as "artist name"
FROM album al
LEFT JOIN Artist ar on al.artistid = ar.artistid;
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.title, count() as "total songs"
FROM album a
JOIN song s on s.albumid = a.albumid 
GROUP BY s.albumid;
-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT title, Max(albumlength) as "duration"
FROM Album
-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

-- Modify the previous query to also display the title of the album.