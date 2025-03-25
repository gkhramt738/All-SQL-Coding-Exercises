USE World;
DROP VIEW IF EXISTS ShowRequiredFields;

-- 1. In which country do people live the longest? Andorra
SELECT NAME, LifeExpectancy
FROM Country
ORDER BY LifeExpectancy
DESC LIMIT 1;

-- 2. How long do they live?
-- In Andorra people tend to live 83.5 years

-- 3. Which nation is the most crowded? 
-- 3a. Find the country with maximum population density (population per sq.km)
SELECT NAME, Population/SurfaceArea AS Density
FROM Country
ORDER BY Density
DESC LIMIT 1;

-- 3b. Show the name and the population density
-- Name: Macao
-- Population density: 26277.777778

-- 4. Thailand has decided to annex (invade) either Cambodia, Laus, Vietnam, or Malaysia. The invaded country will become part of the new Thailand. The government wants the combined country to be wealthier. The government wants the combined country to be wealthier than Thailand is now. “Wealth” means GNP/population.
SELECT Name, GNP/Population*1000000 AS Per_Capita_Richest
FROM Country C
WHERE C.Name IN ('Cambodia', 'Laos', 'Vietnam', 'Malaysia')
ORDER BY Per_Capita_Richest DESC;

-- 4a. What country should Thailand invade?
-- Thailand should invade Malaysia as it has the most wealth (highest GNP/population)

-- 5. Create a view that shows these fields:
-- 5a. City.name as name, Country.name as country, Region, Population of the city Official language id of the city 
CREATE VIEW ShowRequiredFields AS
SELECT Cy.name AS Name, C.Name AS Country, C.Region, Cy.Name AS CityName, Cy.Population, CL.Language, Cy.ID
FROM City Cy, Country C, CountryLanguage CL;

SELECT * FROM ShowRequiredFields;

-- 6. List the cities in Southeast Asia where English is the official language and population is over 100,000
SELECT Name, Population
FROM Country C JOIN CountryLanguage CL
ON CL.CountryCode = C.Code
WHERE
	C.Region = 'Southeast Asia'
    AND C.Population > 100000
	AND CL.Language = 'English';

-- 7. Ask MySQL to “descirbe” your view?
DESCRIBE ShowRequiredFields;

-- 8. Delete your view, and Drop Viewname?
DROP VIEW ShowRequiredFields;



