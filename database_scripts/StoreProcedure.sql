
IF OBJECT_ID('dbo.GetProducts', 'P') IS NOT NULL  
	DROP PROCEDURE dbo.GetProducts;  
GO  

CREATE PROCEDURE dbo.GetProducts
@TypeSubquery INT 
AS
	DECLARE  @SubqueryResult TABLE (productName nvarchar(max))

SET NOCOUNT ON;  

	IF @TypeSubquery = 1 -- Popular
		INSERT INTO @SubqueryResult 
						SELECT DISTINCT p.[Name]				 
						FROM [TestData].dbo.Buy b 
						JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
						JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
						WHERE c.[Rank] > 5
						GROUP BY p.[Name], c.Fio
						HAVING COUNT(p.[Name]) > 3
	ELSE IF @TypeSubquery = 2 -- Actual
		INSERT INTO @SubqueryResult
						SELECT DISTINCT p.[Name]
						FROM [TestData].dbo.Buy b 
						JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
						JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
						Group by p.[Name], c.Fio
						HAVING COUNT(p.[Name]) > 2
	ELSE IF @TypeSubquery = 3 -- Top5
		INSERT INTO @SubqueryResult
						SELECT TOP 5 p.[Name]
						FROM [TestData].dbo.Buy b 
						JOIN [TestData].dbo.Product p ON b.ProductId = p.Id
						JOIN [TestData].dbo.Client c ON b.ClientId = c.Id
						GROUP BY p.[Id], p.[Name], p.[Cost]
						ORDER BY SUM(p.[Cost] * b.[Count]) DESC
	
	IF EXISTS (SELECT * FROM @SubqueryResult)
		SELECT  p.[Id]								AS 'Id' 
				, p.[Name]							AS 'Name'
				, p.[Cost]							AS 'Cost' 
				, (SELECT COUNT(*) 
				   FROM [TestData].dbo.Buy b 
				   WHERE b.[ProductId] = p.[Id])	AS 'Amount'
		FROM [TestData].dbo.Product p
		WHERE p.[Name] IN (SELECT p.productName FROM @SubqueryResult p)

RETURN  
GO  

EXEC GetProducts @TypeSubquery = 1
GO