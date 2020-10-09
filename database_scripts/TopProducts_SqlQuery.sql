SELECT TOP 5
		p.[Id]					AS 'Id товара' 
	    , p.[Name]				AS 'Наименование товара'
	    , p.[Cost]				AS 'Цена'
		, COUNT(b.ClientId)		AS 'Количество покупок'
	FROM [TestData].dbo.Buy b 
	JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
	JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
	GROUP BY p.[Id], p.[Name], p.[Cost]
	ORDER BY SUM(p.[Cost] * b.[Count]) DESC

SELECT  p.[Id]								AS 'Id товара' 
	    , p.[Name]							AS 'Наименование товара'
	    , p.[Cost]							AS 'Цена'
		, (SELECT COUNT(*) 
		   FROM [TestData].dbo.Buy b 
		   WHERE b.[ProductId] = p.[Id])	AS 'Количество покупок'
FROM [TestData].dbo.Product p
WHERE p.[Name] IN (SELECT TOP 5 p.[Name]
					FROM [TestData].dbo.Buy b 
					JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
					JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
					GROUP BY p.[Id], p.[Name], p.[Cost]
					ORDER BY SUM(p.[Cost] * b.[Count]) DESC)
 










