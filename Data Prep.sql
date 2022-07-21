--EXAMPLE QUERY: TO ADD NEW COLUMNS INTO HOUSEPRICES_USA TABLE AND ADD DATA INTO NEW COLUMN
ALTER TABLE [dbo].[HOUSEPRICES_USA]
ADD HOUSETYPE VARCHAR(30)

--EXAMPLE QUERY: DELETE ALL COLUMNS TO INSERT NEW DATA
DELETE FROM [dbo].[HOUSEPRICES_USA] 
WHERE HOUSEID >= 112

--EXAMPLE QUERY: DELETE TABLE FROM DATABASE
DROP TABLE [dbo].[HOUSEPRICES_USA]

-- EXAMPLE QUERY: DELETING MULTIPLE ROWS SHOWING THE COUNT RESULTS 
SELECT [HOUSEID], 
    [STATE], 
    [CITY], 
	[BEDROOMS],
	[BATHROOMS],
	[YEAR],
	[ZIPCODE],
	[HOUSETYPE],

COUNT(*) AS CNT
FROM [dbo].[HOUSEPRICES_USA]
GROUP BY [HOUSEID], 
    [STATE], 
    [CITY], 
	[BEDROOMS],
	[BATHROOMS],
	[YEAR],
	[ZIPCODE],
	[HOUSETYPE]
HAVING COUNT(*) > 1

--UPDATE PRICE FOR FLORIDA IN HOUSEPRICES.USA
UPDATE [dbo].[HOUSEPRICES_USA]
SET PRICE = '2300000'
WHERE HOUSEID = '128';

--CREATE TEMPORARY TABLE TO SEE INFORMATION OF TEXAS FROM AN EXISTING TABLE TO 'HOUSEPRICES_USA' IN SCHEMA 'DBO' IN DATABASE 'REALESTATEPRICES2'
CREATE TABLE #TEXASHOUSE_PRICES

SELECT * INTO #TEXASHOUSE_PRICES
FROM [dbo].[HOUSEPRICES_USA]
WHERE STATE = 'TEXAS'

--STATEMENT TO SEE TEMP TABLE CREATED
SELECT * FROM #TEXASHOUSE_PRICES

--DROP TEMP TABLE #TEXASHOUSE_PRICES
--DROP TABLE IF IT EXIST
DROP TABLE IF EXISTS #TEXASHOUSE_PRICES
