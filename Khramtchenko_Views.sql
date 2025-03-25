USE World;

DROP TABLE IF EXISTS Country_Copy;
DROP VIEW IF EXISTS CopyCountryDataIntoNewTable;
DROP VIEW IF EXISTS AddedCityToDatabaseAndUpdatedCityName;
DROP VIEW IF EXISTS CountryDetails;

-- 1.	Using the world database demonstrates how to copy country data from one table to another. Feel free to name the table country_copy.
CREATE TABLE Country_Copy
SELECT * FROM Country;
SELECT * FROM Country_Copy;

-- 2.	Add a city to the database, and update the city name?
INSERT INTO City(Name, CountryCode, District, Population) VALUES ('Maynord', 'USA', 'Middlesex', 10550);
UPDATE City
SET Name = 'Maynard'
WHERE Name = 'Maynord';

-- Create view to show the new city in the database indepent of other cities
CREATE VIEW AddedCityToDatabaseAndUpdatedCityName AS
SELECT ID, Name, CountryCode, District, Population
FROM City
WHERE Name = 'Maynard';

SELECT * FROM AddedCityToDatabaseAndUpdatedCityName;

-- 3.	What is the total population of each continent in the World database?
SELECT Continent, SUM(Country.Population) AS Total_Population_Of_Each_Continent
FROM Country
GROUP BY Continent;

-- 4.	How many countries have a government that is any form of monarchy?
SELECT COUNT(*) Government_Monarchy FROM Country
WHERE GovernmentForm LIKE '%Monarchy';

-- 5. How many are some form of monarchy, but not a Constitutional Monarchy (like Thailand)?
SELECT COUNT(*) Government_Monarchy FROM Country
WHERE GovernmentForm LIKE 'Monarchy%'
AND GovernmentForm NOT LIKE '%Constitutional';

-- 6.	In which country do people live the longest?
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
Limit 1;

-- 7.	How long do they live?
-- In Andorra, people tend to live 83.5 years

-- 8.	What is a view?
-- A view is a virtual table which is based on pulling information from a real SQL table. It does not directly edit or create data, but simply pulls the required data for the user to see.

-- 9.	What is an advantage of a view?
-- Using a view allows users to read the data but not make any edits or changes to the data, as well as view and search for information without actually physically interacting with the table or manipoulating any part of it.

-- 10.	Create a view for country name, languages, and percentage.
CREATE VIEW CountryDetails AS
SELECT C.Name, CL.Language, CL.Percentage
FROM Country C JOIN CountryLanguage CL
ON C.Code = CL.CountryCode
ORDER BY Percentage DESC;

SELECT * FROM CountryDetails;