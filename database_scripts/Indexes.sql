 ----------indexes---------------

CREATE NONCLUSTERED INDEX IX_Buy_ProductId_ClientId 
 ON [TestData].dbo.Buy ( ProductId, ClientId )
 GO
  

--INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (12, N'Мой Товар 1', 1200.0000)
--INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (13, N'Твой Товар 2', 1200.0000)
--GO

--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (47, 9, 5, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!

--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (48, 39, 12, CAST(N'2012-08-03T01:19:51.000' AS DateTime), 4) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (49, 39, 12, CAST(N'2015-01-03T01:19:51.000' AS DateTime), 20) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (50, 39, 12, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 42) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (51, 39, 12, CAST(N'2016-08-03T01:19:51.000' AS DateTime), 40) --  ME!

--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (52, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (53, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (54, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
--INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (55, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
--GO

--INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (39, N'Лол Лол Лоллович', 4)
--INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (40, N'Овсянников Алексей Сергеевич', 7)
--GO