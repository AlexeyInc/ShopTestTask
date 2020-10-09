SELECT  p.[Id]								AS 'Id товара' 
	    , p.[Name]							AS 'Наименование товара'
	    , p.[Cost]							AS 'Цена'
		, (SELECT COUNT(*) 
		   FROM [TestData].dbo.Buy b 
		   WHERE b.[ProductId] = p.[Id])	AS 'Количество покупок'
FROM [TestData].dbo.Product p
WHERE p.[Name] IN (SELECT DISTINCT p.[Name]
					FROM [TestData].dbo.Buy b 
					JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
					JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
					Group by p.[Name], c.Fio
					HAVING COUNT(p.[Name]) > 2)
 

--- all bought products by clients
SELECT p.[Id]					AS 'Id товара' 
	    , p.[Name]				AS 'Наименование товара'
	    , p.[Cost]				AS 'Цена'
		, c.Fio
		, c.[Rank]
		, b.[Count]
FROM [TestData].dbo.Buy b 
JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
JOIN [TestData].dbo.Client c ON b.ClientId = c.Id








