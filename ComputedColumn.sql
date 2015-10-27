DECLARE @rowCount INT --OUTPUT;
DECLARE @searchLead BIT
DECLARE @searchContact BIT
DECLARE @searchSalesman BIT

SET @searchLead = 1;
SET @searchContact = 1;
SET @searchSalesman = 1;

SELECT @rowCount = COUNT(*) FROM cc.IncommingPhoneCallParties2 
	WHERE 1 = 1 
	AND CHARINDEX('90587', ISNULL(phoneNumber1, '') + ';' + ISNULL(phoneNumber2, '') + ';' + ISNULL(mobileNumber, '')) > 0
		AND ((@searchLead = 1 AND typeCode = 4)						
		OR (@searchContact = 1 AND typeCode = 2)
		OR (@searchSalesman = 1 AND typeCode = 1))

print(@rowCount);

DBCC dropcleanbuffers

----------------------------------------------------------------------------


DECLARE @searchLead BIT
DECLARE @searchContact BIT
DECLARE @searchSalesman BIT


SET @searchLead =1
SET @searchContact = 1;
SET @searchSalesman = 1;

SELECT [activityPartyId]
      ,[phoneNumber1]
      ,[phoneNumber2]
      ,[mobileNumber]
      ,[firstName]
      ,[lastName]
      ,[name]
      ,[personalId]
      ,[clientNumber]
      ,[accountNumber]
      ,[contractNumber]
      ,[salesmanNumber]
      ,[leadId]
      ,[typeCode]
INTO #temp
FROM cc.IncommingPhoneCallParties2 WHERE 1 = 1 
AND CHARINDEX('555-0123', ISNULL(phoneNumber1, '') + ';' + ISNULL(phoneNumber2, '') + ';' + ISNULL(mobileNumber, '')) > 0
		AND ((@searchLead = 1 AND typeCode = 4)						
		OR (@searchContact = 1 AND typeCode = 2)
		OR (@searchSalesman = 1 AND typeCode = 1))

DECLARE @rowCount INT
SELECT @rowCount = count(1) from #temp;
PRINT(@rowCount);

DECLARE @rowStart INT
DECLARE @rowEnd INT
SET @rowStart = 0;
SET @rowEnd = 10

SELECT
			result.*
		FROM
		(
			SELECT
				*,
				ROW_NUMBER() OVER (ORDER BY name DESC) AS rowNumber
			FROM
				#temp
) AS result
		WHERE
			rowNumber BETWEEN @rowStart AND @rowEnd
			ORDER BY rowNumber;


-- DROP TABLE #temp
-- DBCC dropcleanbuffers