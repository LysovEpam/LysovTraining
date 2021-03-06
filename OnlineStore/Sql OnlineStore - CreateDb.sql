USE [master]
GO
/****** Object:  Database [OnlineStore]    Script Date: 26.07.2019 3:45:04 ******/
CREATE DATABASE [OnlineStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineStore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineStore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineStore] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineStore]
GO
/****** Object:  StoredProcedure [dbo].[Product_CountDependencies]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_CountDependencies]
   @idEntity INT
AS

SELECT COUNT(*) FROM UserOrder_Product WHERE UserOrder_Product.Product_ProductId = @idEntity
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Delete]
   @IdEntity INT
AS
DELETE FROM Product WHERE Product.ProductId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'
GO
/****** Object:  StoredProcedure [dbo].[Product_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Insert]
    @Price DECIMAL,
    @Status NVARCHAR(50),
    @ProductInformationId INT
AS

INSERT INTO Product(Price, Status, ProductInformation_ProductInformationId) 
VALUES(@Price, @Status, @ProductInformationId)

SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Product_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_SelectAll]
   
AS

SELECT Product.ProductId, Product.Price, Product.Status, Product.ProductInformation_ProductInformationId
FROM Product

GO
/****** Object:  StoredProcedure [dbo].[Product_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_SelectById]
    @IdEntity INT
AS

SELECT Product.ProductId, Product.Price, Product.Status, Product.ProductInformation_ProductInformationId
FROM Product
WHERE Product.ProductId = @IdEntity


GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Update]
	@IdEntity INT,
    @Price DECIMAL,
    @Status NVARCHAR(50),
    @ProductInformationId INT
AS

UPDATE Product SET
Product.Price = @Price,
Product.Status = @Status,
Product.ProductInformation_ProductInformationId = @ProductInformationId
WHERE Product.ProductId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'

GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_CountDependencies]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_CountDependencies]
    @idEntity INT
AS

SELECT COUNT(*) FROM ProductInformation_ProductCategory WHERE ProductInformation_ProductCategory.ProductCategory_ProductCategoryId = @idEntity
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_Delete]
   @IdEntity INT
AS
DELETE FROM ProductCategory WHERE ProductCategory.ProductCategoryId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'

GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_Insert]
    @CategoryName NVARCHAR(50),
    @Description NVARCHAR(500)
AS
INSERT INTO ProductCategory(CategoryName, Description) 
VALUES(@CategoryName, @Description)

SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_SelectAll]
	
AS
SELECT ProductCategory.ProductCategoryId, 
	ProductCategory.CategoryName, 
	ProductCategory.Description
FROM ProductCategory

GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_SelectById]
	@IdEntity INT
AS
SELECT ProductCategory.ProductCategoryId, 
	ProductCategory.CategoryName, 
	ProductCategory.Description
FROM ProductCategory 
WHERE ProductCategory.ProductCategoryId = @IdEntity

GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCategory_Update]
	@IdEntity INT,
    @CategoryName NVARCHAR(50),
    @Description NVARCHAR(500)
AS
UPDATE ProductCategory SET 
	ProductCategory.CategoryName = @CategoryName,
	ProductCategory.Description = @Description

WHERE ProductCategory.ProductCategoryId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'

GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_CountDependencies]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_CountDependencies]
    @idEntity INT
AS

SELECT COUNT(*) FROM Product WHERE Product.ProductId = @idEntity
GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_CountElement]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_CountElement]
    @idEntity INT
AS

SELECT COUNT(*) FROM Product WHERE Product.ProductId = @idEntity
GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_Delete]
    @IdEntity INT
AS
DELETE FROM ProductInformation WHERE ProductInformation.ProductInformationId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'

GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_Insert]
    @ProductName NVARCHAR(50),
    @ImageLocalSource NVARCHAR(500),
	@Description NVARCHAR(500)
AS
INSERT INTO ProductInformation(ProductInformation.ProductName, 
ProductInformation.ImageLocalSource, ProductInformation.Description) 
VALUES(@ProductName, @ImageLocalSource, @Description)

SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_SelectAll]

AS
SELECT ProductInformation.ProductInformationId,  
ProductInformation.ProductName,
ProductInformation.ImageLocalSource,
ProductInformation.Description,
ProductInformation_ProductCategory.ProductCategory_ProductCategoryId


FROM  ProductInformation
	INNER JOIN ProductInformation_ProductCategory 
	ON ProductInformation_ProductCategory.ProductInformation_ProductInformationId = ProductInformation.ProductInformationId
 
  
	ORDER BY ProductInformation_ProductCategory.ProductInformation_ProductInformationId
GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_SelectById]
    @IdEntity INT
AS

SELECT ProductInformation.ProductInformationId,  
ProductInformation.ProductName,
ProductInformation.ImageLocalSource,
ProductInformation.Description,
ProductInformation_ProductCategory.ProductCategory_ProductCategoryId


FROM ProductInformation_ProductCategory
  JOIN ProductInformation 
  ON ProductInformation_ProductCategory.ProductInformation_ProductInformationId = 
  ProductInformation.ProductInformationId
  WHERE ProductInformation.ProductInformationId = @IdEntity

  
  ORDER BY ProductInformation_ProductCategory.ProductInformation_ProductInformationId
GO
/****** Object:  StoredProcedure [dbo].[ProductInformation_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformation_Update]
	@IdEntity INT,
	@ProductName NVARCHAR(50),
	@ImageLocalSource NVARCHAR(500),
	@Description NVARCHAR(500)
AS

UPDATE  ProductInformation SET 
ProductInformation.ProductName = @ProductName,
ProductInformation.ImageLocalSource = @ImageLocalSource,
ProductInformation.Description = @Description


WHERE ProductInformation.ProductInformationId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'


GO
/****** Object:  StoredProcedure [dbo].[ProductInformationProductCategory_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformationProductCategory_Delete]
    @IdProductInformation INT,
	@IdCategory INT
AS

DELETE FROM ProductInformation_ProductCategory 
WHERE ProductInformation_ProductCategory.ProductInformation_ProductInformationId = @IdProductInformation AND
ProductInformation_ProductCategory.ProductCategory_ProductCategoryId = @IdCategory;

SELECT @@ROWCOUNT AS 'rows delete'

GO
/****** Object:  StoredProcedure [dbo].[ProductInformationProductCategory_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInformationProductCategory_Insert]
    @ProductCategoryId INT,
    @ProductInformationId INT
AS
INSERT INTO ProductInformation_ProductCategory(
ProductInformation_ProductCategory.ProductCategory_ProductCategoryId,
ProductInformation_ProductCategory.ProductInformation_ProductInformationId)
VALUES(@ProductCategoryId, @ProductInformationId)



GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_Delete]
    @IdEntity INT

AS
DELETE FROM UserAdmittance WHERE UserAdmittance.UserAdmittanceId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'

GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_Insert]
    @Login NVARCHAR(50),
    @PasswordHash NVARCHAR(50),
    @Status NVARCHAR(50),
    @Role NVARCHAR(50)
AS
INSERT INTO UserAdmittance(UserAdmittance.Login, UserAdmittance.PasswordHash, UserAdmittance.Status, UserAdmittance.Role)
VALUES(@Login, @PasswordHash, @Status, @Role)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_SelectAll]
	
AS
SELECT UserAdmittance.UserAdmittanceId, UserAdmittance.Login, UserAdmittance.PasswordHash, UserAdmittance.Status, UserAdmittance.Role 
FROM UserAdmittance 


GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_SelectById]
	@IdEntity INT
   
AS
SELECT UserAdmittance.UserAdmittanceId, UserAdmittance.Login, UserAdmittance.PasswordHash, UserAdmittance.Status, UserAdmittance.Role 
FROM UserAdmittance 
WHERE UserAdmittance.UserAdmittanceId = @IdEntity


GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_SelectByLogin]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_SelectByLogin]
    @Login NVARCHAR(50)
    
AS
SELECT UserAdmittance.UserAdmittanceId, UserAdmittance.Login, UserAdmittance.PasswordHash, UserAdmittance.Status, UserAdmittance.Role 
FROM UserAdmittance 
WHERE UserAdmittance.Login = @Login
GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_SelectByLoginPassword]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_SelectByLoginPassword]
    @Login NVARCHAR(50),
    @PasswordHash NVARCHAR(50)

AS
SELECT UserAdmittance.UserAdmittanceId, UserAdmittance.Login, UserAdmittance.PasswordHash, UserAdmittance.Status, UserAdmittance.Role 
FROM UserAdmittance 
WHERE UserAdmittance.Login = @Login AND UserAdmittance.PasswordHash = @PasswordHash
GO
/****** Object:  StoredProcedure [dbo].[UserAdmittance_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAdmittance_Update]
	@IdEntity INT,
    @Login NVARCHAR(50),
    @PasswordHash NVARCHAR(50),
    @Status NVARCHAR(50),
    @Role NVARCHAR(50)
AS
UPDATE UserAdmittance SET 
UserAdmittance.Login = @Login, UserAdmittance.PasswordHash = @PasswordHash, UserAdmittance.Status = @Status, UserAdmittance.Role = @Role
WHERE UserAdmittance.UserAdmittanceId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'

GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_CancelSessionKey]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_CancelSessionKey]
	@IdEntity INT,
	@OldStatus NVARCHAR(50),
	@FinishSession DATETIME,
	@NewStatus NVARCHAR(50)

AS
UPDATE UserAuthorizationToken SET 
UserAuthorizationToken.FinishSession = @FinishSession,
UserAuthorizationToken.Status = @NewStatus

WHERE UserAuthorizationToken.User_UserId = @IdEntity AND UserAuthorizationToken.Status = @OldStatus
GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_Delete]
  @IdEntity INT
AS
DELETE FROM UserAuthorizationToken WHERE UserAuthorizationToken.UserAuthorizationId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'
GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_Insert]
    @StartSession DATETIME,
    @FinishSession DATETIME,
    @UserToken NVARCHAR(50),
	@Status NVARCHAR(50),
    @UserId INT
AS

INSERT INTO UserAuthorizationToken(
	UserAuthorizationToken.StartSession, UserAuthorizationToken.FinishSession,
	UserAuthorizationToken.UserToken, UserAuthorizationToken.Status, 
	UserAuthorizationToken.User_UserId) 
VALUES(@StartSession, @FinishSession, @UserToken, @Status, @UserId)

SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_SelectAll]

AS

SELECT 
UserAuthorizationToken.UserAuthorizationId,  
UserAuthorizationToken.StartSession, UserAuthorizationToken.FinishSession, 
UserAuthorizationToken.UserToken, UserAuthorizationToken.Status, UserAuthorizationToken.User_UserId
FROM UserAuthorizationToken




GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_SelectById]
@IdEntity INT
   
AS

SELECT 
UserAuthorizationToken.UserAuthorizationId,  
UserAuthorizationToken.StartSession, UserAuthorizationToken.FinishSession, 
UserAuthorizationToken.UserToken, UserAuthorizationToken.Status, UserAuthorizationToken.User_UserId
FROM UserAuthorizationToken
WHERE UserAuthorizationToken.UserAuthorizationId = @IdEntity



GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_SelectByToken]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_SelectByToken]
    @UserToken NVARCHAR(50)
AS

SELECT UserAuthorizationToken.UserAuthorizationId, 
UserAuthorizationToken.StartSession, UserAuthorizationToken.FinishSession,
UserAuthorizationToken.UserToken, UserAuthorizationToken.Status,
UserAuthorizationToken.User_UserId FROM UserAuthorizationToken WHERE UserAuthorizationToken.UserToken = @UserToken
GO
/****** Object:  StoredProcedure [dbo].[UserAuthorizationToken_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserAuthorizationToken_Update]
    @IdEntity INT,
	@StartSession DATETIME,
	@FinishSession DATETIME,
	@UserToken NVARCHAR(50),
	@Status NVARCHAR(50),
	@UserId INT

AS
UPDATE UserAuthorizationToken SET 
UserAuthorizationToken.StartSession = @StartSession,
UserAuthorizationToken.FinishSession = @FinishSession,
UserAuthorizationToken.UserToken = @UserToken,
UserAuthorizationToken.Status = @Status,
UserAuthorizationToken.User_UserId = @UserId
WHERE UserAuthorizationToken.UserAuthorizationId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'
GO
/****** Object:  StoredProcedure [dbo].[UserOrder_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrder_Delete]
	 @IdEntity INT
AS
DELETE FROM UserOrder WHERE UserOrder.UserOrderId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'



GO
/****** Object:  StoredProcedure [dbo].[UserOrder_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrder_Insert]
    @DateOrder DATETIME,
    @Address NVARCHAR(500),
	@Status NVARCHAR(500),
    @UserId INT
AS

INSERT INTO UserOrder(UserOrder.DateOrder, UserOrder.Address, UserOrder.Status, UserOrder.User_UserId)
VALUES(@DateOrder, @Address, @Status, @UserId)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[UserOrder_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrder_SelectAll]
	
AS

SELECT UserOrder.UserOrderId,  
UserOrder.DateOrder,
UserOrder.Address,
UserOrder.Status,
UserOrder.User_UserId,
UserOrder_Product.Product_ProductId


FROM UserOrder_Product
  JOIN UserOrder 
  ON UserOrder_Product.UserOrder_UserOrderId = 
  UserOrder.UserOrderId
  
  ORDER BY UserOrder_Product.UserOrder_UserOrderId



GO
/****** Object:  StoredProcedure [dbo].[UserOrder_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrder_SelectById]
	 @IdEntity INT
AS

SELECT UserOrder.UserOrderId,  
UserOrder.DateOrder,
UserOrder.Address,
UserOrder.Status,
UserOrder.User_UserId,
UserOrder_Product.Product_ProductId


FROM UserOrder_Product
  JOIN UserOrder 
  ON UserOrder_Product.UserOrder_UserOrderId = 
  UserOrder.UserOrderId
  WHERE UserOrder.UserOrderId = @IdEntity

  
  ORDER BY UserOrder_Product.UserOrder_UserOrderId



GO
/****** Object:  StoredProcedure [dbo].[UserOrder_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrder_Update]
	@IdEntity INT,
    @DateOrder DATETIME,
    @Address NVARCHAR(500),
	@Status NVARCHAR(50),
    @UserId INT
AS

UPDATE  UserOrder SET 
UserOrder.DateOrder = @DateOrder,
UserOrder.Address = @Address,
UserOrder.Status = @Status,
UserOrder.User_UserId = @UserId


WHERE UserOrder.UserOrderId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'


GO
/****** Object:  StoredProcedure [dbo].[UserOrderProduct_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrderProduct_Delete]
	@UserOrderId INT,
	@ProductId INT
AS

DELETE FROM UserOrder_Product 
WHERE UserOrder_Product.UserOrder_UserOrderId = @UserOrderId AND
UserOrder_Product.Product_ProductId = @ProductId;

SELECT @@ROWCOUNT AS 'rows delete'

GO
/****** Object:  StoredProcedure [dbo].[UserOrderProduct_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserOrderProduct_Insert]
	@UserOrderId INT,
	@ProductId INT
AS

INSERT INTO UserOrder_Product(UserOrder_Product.UserOrder_UserOrderId, UserOrder_Product.Product_ProductId) 
VALUES (@UserOrderId, @ProductId)

GO
/****** Object:  StoredProcedure [dbo].[UserSystem_Delete]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_Delete]
    @IdEntity INT
AS
DELETE FROM UserSystem WHERE UserSystem.UserId = @IdEntity;

SELECT @@ROWCOUNT AS 'rows delete'
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_Insert]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_Insert]
    @FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
    @Email NVARCHAR(50),
	@Phone NVARCHAR(50),
    @UserAdmittanceId INT
AS
INSERT INTO UserSystem(FirstName, LastName, Email, Phone, UserAdmittanceId) 
VALUES(@FirstName, @LastName, @Email, @Phone,@UserAdmittanceId)

SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_SelectAll]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_SelectAll]
   
AS
SELECT  
	UserSystem.UserId,
	 UserSystem.FirstName, UserSystem.LastName, 
	 UserSystem.Email, UserSystem.Phone, 
	 UserSystem.UserAdmittanceId
	FROM UserSystem
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_SelectById]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_SelectById]
    @IdEntity INT
AS

SELECT  
	UserSystem.UserId, 
	UserSystem.FirstName, UserSystem.LastName, 
	UserSystem.Email, UserSystem.Phone, 
	UserSystem.UserAdmittanceId
	FROM UserSystem
	WHERE UserSystem.UserId = @IdEntity
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_SelectByLogin]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_SelectByLogin]
     @Login NVARCHAR(50)
AS
SELECT  
	UserSystem.UserId, UserSystem.FirstName, UserSystem.LastName, UserSystem.Email, UserSystem.Phone, UserSystem.UserAdmittanceId
	FROM UserSystem
	JOIN UserAdmittance ON  UserSystem.UserAdmittanceId = UserAdmittance.UserAdmittanceId 
	WHERE UserAdmittance.Login = @Login 
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_SelectByLoginPassword]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_SelectByLoginPassword]
    @Login NVARCHAR(50),
    @PasswordHash NVARCHAR(50)
AS

SELECT  
	UserSystem.UserId, UserSystem.FirstName, UserSystem.LastName, UserSystem.Email, UserSystem.Phone, UserSystem.UserAdmittanceId
	FROM UserSystem
	JOIN UserAdmittance ON  UserSystem.UserAdmittanceId = UserAdmittance.UserAdmittanceId 
	WHERE UserAdmittance.Login = @Login AND UserAdmittance.PasswordHash = @PasswordHash
GO
/****** Object:  StoredProcedure [dbo].[UserSystem_Update]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSystem_Update]
	@IdEntity INT,
    @FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
    @Email NVARCHAR(50),
	@Phone NVARCHAR(50),
    @UserAdmittanceId INT
AS
UPDATE UserSystem SET 
UserSystem.FirstName = @FirstName,
UserSystem.LastName = @LastName,
UserSystem.Email = @Email,
UserSystem.Phone = @Phone,
UserSystem.UserAdmittanceId = @UserAdmittanceId
WHERE UserSystem.UserId = @IdEntity

SELECT @@ROWCOUNT AS 'rows update'
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ProductInformation_ProductInformationId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInformation]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInformation](
	[ProductInformationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ImageLocalSource] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ProductList] PRIMARY KEY CLUSTERED 
(
	[ProductInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInformation_ProductCategory]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInformation_ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategory_ProductCategoryId] [int] NOT NULL,
	[ProductInformation_ProductInformationId] [int] NOT NULL,
 CONSTRAINT [PK_Product_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAdmittance]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmittance](
	[UserAdmittanceId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserAccess] PRIMARY KEY CLUSTERED 
(
	[UserAdmittanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAuthorizationToken]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuthorizationToken](
	[UserAuthorizationId] [int] IDENTITY(1,1) NOT NULL,
	[StartSession] [datetime] NOT NULL,
	[FinishSession] [datetime] NOT NULL,
	[UserToken] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[User_UserId] [int] NOT NULL,
 CONSTRAINT [PK_AuthorizationUser] PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOrder]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrder](
	[UserOrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[User_UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserOrder] PRIMARY KEY CLUSTERED 
(
	[UserOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOrder_Product]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrder_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserOrder_UserOrderId] [int] NOT NULL,
	[Product_ProductId] [int] NOT NULL,
 CONSTRAINT [PK_UserOrder_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSystem]    Script Date: 26.07.2019 3:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSystem](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[UserAdmittanceId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductList] FOREIGN KEY([ProductInformation_ProductInformationId])
REFERENCES [dbo].[ProductInformation] ([ProductInformationId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductList]
GO
ALTER TABLE [dbo].[ProductInformation_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductList_ProductCategory_ProductCategory] FOREIGN KEY([ProductCategory_ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductInformation_ProductCategory] CHECK CONSTRAINT [FK_ProductList_ProductCategory_ProductCategory]
GO
ALTER TABLE [dbo].[ProductInformation_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductList_ProductCategory_ProductList] FOREIGN KEY([ProductInformation_ProductInformationId])
REFERENCES [dbo].[ProductInformation] ([ProductInformationId])
GO
ALTER TABLE [dbo].[ProductInformation_ProductCategory] CHECK CONSTRAINT [FK_ProductList_ProductCategory_ProductList]
GO
ALTER TABLE [dbo].[UserAuthorizationToken]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizationUser_User] FOREIGN KEY([User_UserId])
REFERENCES [dbo].[UserSystem] ([UserId])
GO
ALTER TABLE [dbo].[UserAuthorizationToken] CHECK CONSTRAINT [FK_AuthorizationUser_User]
GO
ALTER TABLE [dbo].[UserOrder]  WITH CHECK ADD  CONSTRAINT [FK_UserOrder_User] FOREIGN KEY([User_UserId])
REFERENCES [dbo].[UserSystem] ([UserId])
GO
ALTER TABLE [dbo].[UserOrder] CHECK CONSTRAINT [FK_UserOrder_User]
GO
ALTER TABLE [dbo].[UserOrder_Product]  WITH CHECK ADD  CONSTRAINT [FK_UserOrder_Product_Product] FOREIGN KEY([Product_ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[UserOrder_Product] CHECK CONSTRAINT [FK_UserOrder_Product_Product]
GO
ALTER TABLE [dbo].[UserOrder_Product]  WITH CHECK ADD  CONSTRAINT [FK_UserOrder_Product_UserOrder] FOREIGN KEY([UserOrder_UserOrderId])
REFERENCES [dbo].[UserOrder] ([UserOrderId])
GO
ALTER TABLE [dbo].[UserOrder_Product] CHECK CONSTRAINT [FK_UserOrder_Product_UserOrder]
GO
ALTER TABLE [dbo].[UserSystem]  WITH CHECK ADD  CONSTRAINT [FK_User_UserAccess] FOREIGN KEY([UserAdmittanceId])
REFERENCES [dbo].[UserAdmittance] ([UserAdmittanceId])
GO
ALTER TABLE [dbo].[UserSystem] CHECK CONSTRAINT [FK_User_UserAccess]
GO
USE [master]
GO
ALTER DATABASE [OnlineStore] SET  READ_WRITE 
GO
