If(db_id(N'TestData') IS NULL)
	CREATE DATABASE [TestData]
GO
USE [TestData]
GO

CREATE TABLE dbo.[Role]
(Id int NOT NULL Identity (1,1) Primary key,
RoleName nvarchar(255))
GO

CREATE TABLE dbo.[User]
(Id int NOT NULL Identity (1,1) Primary key,
UserName nvarchar(255))
GO

CREATE TABLE dbo.UserRole
(Id int NOT NULL Identity (1,1) Primary key,
UserId int NOT NULL,
RoleId int NOT NULL,
Foreign key (UserId) References dbo.[User](Id),
Foreign key (RoleId) References dbo.[Role](Id))
GO

INSERT INTO dbo.[Role] (RoleName) VALUES ('Analyst'), ('Manager'), ('Head')
GO

INSERT INTO dbo.[User] (UserName) VALUES ('Test1'), ('Test2')
GO

INSERT INTO dbo.UserRole (UserId, RoleId) VALUES (1, 1), (1, 2), (2, 3)
GO