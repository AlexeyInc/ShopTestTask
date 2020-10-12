 ----------indexes---------------

CREATE NONCLUSTERED INDEX IX_Buy_ProductId_ClientId 
 ON [TestData].dbo.Buy ( ProductId, ClientId )
 GO
  