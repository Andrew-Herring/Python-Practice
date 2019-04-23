-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, CustomerId, Country FROM Customer 
WHERE Country != "USA"

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT FirstName, LastName FROM Customer
WHERE Country == "Brazil"

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT FirstName, LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = "Brazil"

-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM Employee WHERE title = "Sales Support Agent"
SELECT * FROM Employee WHERE title like 'Sales%'

-- unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice

-- sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT InvoiceId, e.FirstName, e.LastName 
FROM Invoice i JOIN Customer c
ON c.CustomerId = i.CustomerId JOIN Employee e ON c.SupportRepId = e.EmployeeId

-- invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT InvoiceId, Total as "Invoice Total", c.FirstName as "Customer First Name", c.LastName as "Customer Last Name", BillingCountry, e.FirstName as "Seller First Name", e.LastName as "Seller Last Name"
FROM Invoice i
JOIN Customer c
ON c.CustomerId = i.CustomerId
JOIN Empolyee e
ON c.SupportRepId = e.EmployeeId

-- total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT "2009" as "Year", COUNT(*) as "Num of Invoices"
FROM Invoice
WHERE Invoice.InvoiceDate >= DATETIME('2009-01-01 00:00:00') AND Invoice.InvoiceDate < DATETIME('2010-01-01 00:00:00')

SELECT "2011" as "Year", COUNT(*) as "Num of Invoices"
FROM Invoice
WHERE Invoice.InvoiceDate >= DATETIME('2011-01-01 00:00:00') AND Invoice.InvoiceDate < DATETIME('2012-01-01 00:00:00')

-- total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT "2009" as "Year", SUM(Invoice.total) as "Total Sales"
FROM Invoice
WHERE Invoice.InvoiceDate >= DATETIME('2009-01-01 00:00:00') AND Invoice.InvoiceDate < DATETIME('2010-01-01 00:00:00')

SELECT "2011" as "Year", SUM(Invoice.total) as "Total Sales"
FROM Invoice
WHERE Invoice.InvoiceDate >= DATETIME('2011-01-01 00:00:00') AND Invoice.InvoiceDate < DATETIME('2012-01-01 00:00:00')

-- invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(*) as "Lines for ID 37"
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = 37

-- line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceLine.InvoiceId as "Invoice ID", COUNT(*) as "Line Items"
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId

-- line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLine.InvoiceId, Track.Name
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId

-- line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT InvoiceLine.InvoiceLineId, Track.TrackId, Track.Name as "Track Name", Track.AlbumId, Album.Title as "Album Title", Artist.Name as "Artist Name"
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
JOIN Album
ON Track.AlbumId = Album.AlbumId
JOIN Artist
ON Album.ArtistId = Artist.ArtistId
ORDER BY InvoiceLine.InvoiceLineId

-- country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT i.BillingCountry as "Billing Country", COUNT(*) as "Number of Invoices"
FROM Invoice as i
GROUP BY i.BillingCountry

-- playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
SELECT PlaylistTrack.PlaylistId as "Playlist ID", COUNT(*) as "Number of Tracks", Playlist.Name
FROM PlaylistTrack
JOIN Playlist
ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY PlaylistTrack.PlaylistId

-- tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT Track.Name, Album.Title as "Album Title", Genre.Name as "Genre Name", MediaType.Name as "Media Type"
FROM Track
JOIN Album
ON Track.AlbumId = Album.AlbumId
JOIN Genre
ON Track.GenreId = Genre.GenreId
JOIN MediaType
ON Track.MediaTypeId = MediaType.MediaTypeId

-- invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT InvoiceLine.InvoiceId as "Invoice ID", COUNT(InvoiceLine.InvoiceLineId) as "# of Line Items"
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId

-- sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.
SELECT Employee.FirstName, Employee.LastName, Employee.EmployeeId, ROUND(SUM(Invoice.Total),2) as "Sum"
FROM Employee
JOIN Customer
ON Employee.EmployeeId = Customer.SupportRepId
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Employee.EmployeeId

-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?
SELECT Employee.FirstName, Employee.LastName, Employee.EmployeeId, ROUND(SUM(Invoice.Total),2) as "Sum"
FROM Employee
JOIN Customer
ON Employee.EmployeeId = Customer.SupportRepId
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
WHERE Invoice.InvoiceDate BETWEEN DATETIME('2009-01-01 00:00:00') AND DATETIME('2009-12-31 11:59:59')
GROUP BY Employee.EmployeeId ORDER BY "Sum" DESC


-- Hint: Use the MAX function on a subquery.



-- top_agent.sql: Which sales agent made the most in sales over all?
SELECT "First Name", "Last Name", MAX("Sum") as "Total Sales"
FROM (
	SELECT Employee.FirstName as "First Name", Employee.LastName as "Last Name", Employee.EmployeeId, ROUND(SUM(Invoice.Total),2) as "Sum"
	FROM Employee
	JOIN Customer
	ON Employee.EmployeeId = Customer.SupportRepId
	JOIN Invoice
	ON Invoice.CustomerId = Customer.CustomerId
	GROUP BY Employee.EmployeeId )

-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.



-- sales_per_country.sql: Provide a query that shows the total sales per country.



-- top_country.sql: Which country's customers spent the most?



-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.



-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.



-- top_3_artists.sql: Provide a query that shows the top 3 best selling artists.



-- top_media_type.sql: Provide a query that shows the most purchased Media Type.