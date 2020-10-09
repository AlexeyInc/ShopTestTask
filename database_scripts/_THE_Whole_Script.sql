--If(db_id(N'TestData') IS NULL)
--	CREATE DATABASE [TestData]
--GO

USE master
GO

ALTER DATABASE [TestData] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

IF EXISTS (SELECT * FROM SYS.Databases WHERE [name] = 'TestData')
	DROP DATABASE [TestData]
GO

CREATE DATABASE [TestData]
GO

USE [TestData]
GO
/****** Object:  Table [dbo].[Buy]    Script Date: 17.04.2018 11:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.04.2018 11:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fio] [nvarchar](max) NOT NULL,
	[Rank] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.04.2018 11:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Cost] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buy] ON 

INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (1, 8, 4, CAST(N'2010-02-22T12:26:04.000' AS DateTime), 2)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (2, 38, 2, CAST(N'2012-01-15T15:51:40.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (3, 3, 4, CAST(N'2010-02-15T08:07:13.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (4, 2, 10, CAST(N'2013-06-11T13:11:11.000' AS DateTime), 2)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (5, 6, 3, CAST(N'2015-09-15T14:39:36.000' AS DateTime), 12)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (6, 22, 4, CAST(N'2012-04-15T13:15:46.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (7, 6, 2, CAST(N'2011-01-13T11:39:20.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (8, 4, 3, CAST(N'2011-04-28T05:05:50.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (9, 4, 7, CAST(N'2011-10-29T17:01:10.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (10, 10, 4, CAST(N'2015-07-15T06:17:00.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (11, 9, 7, CAST(N'2015-11-18T02:39:12.000' AS DateTime), 2)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (12, 5, 2, CAST(N'2012-05-15T07:49:16.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (13, 9, 5, CAST(N'2016-12-08T21:10:13.000' AS DateTime), 7)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (14, 5, 4, CAST(N'2014-07-22T21:00:15.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (15, 10, 3, CAST(N'2013-01-27T05:53:14.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (16, 9, 5, CAST(N'2013-02-13T07:58:58.000' AS DateTime), 2)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (17, 16, 9, CAST(N'2016-09-16T03:37:16.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (18, 15, 10, CAST(N'2012-11-14T02:40:23.000' AS DateTime), 12)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (19, 36, 2, CAST(N'2010-05-25T19:31:12.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (20, 17, 8, CAST(N'2011-12-26T12:01:44.000' AS DateTime), 6)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (21, 35, 5, CAST(N'2011-09-27T19:03:08.000' AS DateTime), 120)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (22, 11, 10, CAST(N'2010-02-27T08:56:14.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (23, 25, 6, CAST(N'2015-02-11T11:49:48.000' AS DateTime), 2)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (24, 12, 7, CAST(N'2012-05-19T01:12:22.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (25, 38, 9, CAST(N'2011-11-26T10:58:57.000' AS DateTime), 8)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (26, 10, 8, CAST(N'2012-08-22T02:55:46.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (27, 30, 5, CAST(N'2014-12-01T00:54:51.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (28, 16, 11, CAST(N'2010-11-25T15:16:10.000' AS DateTime), 30)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (29, 9, 5, CAST(N'2014-08-03T01:19:51.000' AS DateTime), 10)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (30, 12, 7, CAST(N'2010-05-06T06:05:43.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (31, 30, 4, CAST(N'2017-10-05T13:27:21.000' AS DateTime), 20)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (32, 10, 9, CAST(N'2017-09-11T07:06:25.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (33, 13, 4, CAST(N'2010-07-02T16:48:40.000' AS DateTime), 5)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (34, 23, 5, CAST(N'2017-10-15T14:26:21.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (35, 11, 4, CAST(N'2013-04-08T06:51:09.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (36, 12, 7, CAST(N'2017-06-24T20:32:42.000' AS DateTime), 22)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (37, 27, 11, CAST(N'2015-11-12T20:52:16.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (38, 12, 10, CAST(N'2010-10-20T07:40:52.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (39, 26, 4, CAST(N'2016-10-01T07:31:45.000' AS DateTime), 5)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (40, 18, 4, CAST(N'2010-12-18T11:11:53.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (41, 38, 9, CAST(N'2014-05-13T12:45:34.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (42, 20, 4, CAST(N'2010-12-17T14:54:23.000' AS DateTime), 1)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (43, 14, 4, CAST(N'2016-01-06T15:20:00.000' AS DateTime), 3)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (44, 28, 10, CAST(N'2017-08-15T04:39:34.000' AS DateTime), 200)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (45, 38, 9, CAST(N'2010-09-14T08:05:21.000' AS DateTime), 5)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (46, 33, 4, CAST(N'2017-04-28T04:17:54.000' AS DateTime), 122)
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (47, 9, 5, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!

INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (48, 39, 5, CAST(N'2012-08-03T01:19:51.000' AS DateTime), 4) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (49, 39, 5, CAST(N'2015-01-03T01:19:51.000' AS DateTime), 20) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (50, 39, 5, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 42) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (51, 39, 5, CAST(N'2016-08-03T01:19:51.000' AS DateTime), 40) --  ME!

INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (52, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (53, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (54, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
INSERT [dbo].[Buy] ([Id], [ClientId], [ProductId], [Date], [Count]) VALUES (55, 40, 13, CAST(N'2015-08-03T01:19:51.000' AS DateTime), 420) --  ME!
SET IDENTITY_INSERT [dbo].[Buy] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (1, N'Иванов Иван Иванович', 2)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (2, N'Валеев Геннадий Наумович', 50)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (3, N'Рубцова Христина Трофимовна', 6)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (4, N'Князев Фома Вадимович', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (5, N'Злобин Виталий Валерьянович', 3)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (6, N'Яковкин Марк Титович', 12)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (8, N'Тычкина Римма Василиевна', 30)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (9, N'Кашарина Дина Леонидовна', 20)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (10, N'Столярова Дарья Семеновна', 11)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (11, N'Казакевича Агния Владленовна', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (12, N'Чичерина Наталья Михеевна', 34)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (13, N'Сунгатулин Семен Кириллович', 78)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (14, N'Корзоватых Петр Модестович', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (15, N'Танков Феофан Гордеевич', 4)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (16, N'Вавилова Евгения Алексеевна', 3)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (17, N'Широнин Николай Ипатович', 15)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (18, N'Тимиряев Зиновий Иннокентиевич', 54)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (19, N'Шелыгин Эрнст Ерофеевич', 12)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (20, N'Яскина Виктория Василиевна', 10)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (21, N'Алексеева Эмилия Андрияновна', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (22, N'Зуева Мария Ильевна', 22)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (23, N'Зинченко Авдей Адамович', 2)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (24, N'Поветникова Раиса Феликсовна', 34)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (25, N'Грибков Прохор Измаилович', 11)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (26, N'Чекудаев Мир Захарович', 20)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (27, N'Аронов Артем Феликсович', 11)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (28, N'Сукачёв Андриян Несторович', 5)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (29, N'Прибыльнов Вячеслав Леонидович', 2)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (30, N'Новикова Раиса Тимуровна', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (31, N'Зворыгин Авдей Герасимович', 2)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (32, N'Коваль Варвара Мефодиевна', 1)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (33, N'Сияносов Семён Казимирович', 9)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (34, N'Соловьёв Зиновий Иванович', 2)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (35, N'Халипов Никанор Никифорович', 7)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (36, N'Горемыкина Ангелина Александровна', 4)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (37, N'Буланов Юрий Миронович', 6)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (38, N'Бабышев Вадим Игоревич', 12)
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (39, N'Лол Лол Лоллович', 7) -- ME!
INSERT [dbo].[Client] ([Id], [Fio], [Rank]) VALUES (40, N'Овсянников Алексей Сергеевич', 7) -- ME!
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (2, N'Товар 1', 255.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (3, N'Товар 2', 10.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (4, N'Товар 3', 60.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (5, N'Товар 4', 500.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (6, N'Товар 5', 1000.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (7, N'Товар 6', 12.5000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (8, N'Товар 7', 33.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (9, N'Товар 8', 1.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (10, N'Товар 9', 5000.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (11, N'Товар 10', 1200.0000)
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (12, N'Мой Товар 1', 1200.0000)-- ME!
INSERT [dbo].[Product] ([Id], [Name], [Cost]) VALUES (13, N'Твой Товар 2', 1200.0000)-- ME!
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Buy] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD  CONSTRAINT [FK_Buy_ClientId_Client_Id] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Buy] CHECK CONSTRAINT [FK_Buy_ClientId_Client_Id]
GO
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD  CONSTRAINT [FK_Buy_ProductId_Product_Id] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Buy] CHECK CONSTRAINT [FK_Buy_ProductId_Product_Id]
GO


-------------------------------------------------ME--------------------------------

---indexes---

CREATE NONCLUSTERED INDEX IX_Buy_ProductId_ClientId 
 ON [TestData].dbo.Buy ( ProductId, ClientId )
 GO

----end---

CREATE TABLE dbo.[Role]
(Id int NOT NULL Identity (1,1) Primary key,
RoleName nvarchar(255))
GO

CREATE TABLE dbo.[User]
(Id int NOT NULL Identity (1,1) Primary key,
Username nvarchar(255),
[Password] nvarchar(255))
GO
 
CREATE TABLE dbo.UserRole
(UserId int NOT NULL,
RoleId int NOT NULL,
Primary key (UserId, RoleId),
Foreign key (UserId) References dbo.[User](Id),
Foreign key (RoleId) References dbo.[Role](Id))
GO

INSERT INTO dbo.[Role] (RoleName) VALUES ('Analyst'), ('Manager'), ('Head')
GO

INSERT INTO dbo.[User] (Username, [Password]) VALUES ('Test1', 'pass1'), ('Test2', 'pass2')
GO

INSERT INTO dbo.UserRole (UserId, RoleId) VALUES (1, 1), (1, 2), (2, 3)
GO

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

USE [master]
GO
ALTER DATABASE [TestData] SET  READ_WRITE 
GO