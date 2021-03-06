USE [OnlineStore]
GO


INSERT INTO [dbo].[UserAdmittance] ([Login] ,[PasswordHash] ,[Status] ,[Role]) VALUES  ('admin', 'XIaKoSoAd002Wlm2spIBi6lc0Mn4YT9s2GrOY3lbSKsp22Hips', 'Active', 'Admin')
INSERT INTO [dbo].[UserAdmittance] ([Login] ,[PasswordHash] ,[Status] ,[Role]) VALUES  ('editor', 't4eeAmARdMzSyGid7zubtzQ6zgoTQJxZrZqMniGMtM74dcIHs7', 'Active', 'Editor')
INSERT INTO [dbo].[UserAdmittance] ([Login] ,[PasswordHash] ,[Status] ,[Role]) VALUES  ('user', 'I0uDJ7JYsg4DQweTZ8rWrf6h4ogO2tndDXteIBw243ZNTgRYwj', 'Active', 'User')
INSERT INTO [dbo].[UserAdmittance] ([Login] ,[PasswordHash] ,[Status] ,[Role]) VALUES  ('user2', 'jSuXXyX3s77gtIenospOr0IQ7ltK7aYTe4I1yQsprIo5thMJLU', 'Active', 'User')



INSERT INTO [dbo].[UserSystem] ([FirstName] ,[LastName] ,[Email] ,[Phone] ,[UserAdmittanceId]) VALUES ('FirstNameAdmin' ,'LastNameAdmin', 'admin@onlinestore.com', '375291112233', 1)
INSERT INTO [dbo].[UserSystem] ([FirstName] ,[LastName] ,[Email] ,[Phone] ,[UserAdmittanceId]) VALUES ('FirstName2' ,'LastName2', 'editor@onlinestore.com', '+375 29 333-22-11', 2)
INSERT INTO [dbo].[UserSystem] ([FirstName] ,[LastName] ,[Email] ,[Phone] ,[UserAdmittanceId]) VALUES ('FirstName3' ,'LastName3', 'user@onlinestore.com', '+375 29 222-33-11', 3)
INSERT INTO [dbo].[UserSystem] ([FirstName] ,[LastName] ,[Email] ,[Phone] ,[UserAdmittanceId]) VALUES ('FirstName4' ,'LastName4', 'test@onlinestore.com', '375291112233', 4)



INSERT INTO [dbo].[UserAuthorizationToken] ([StartSession] ,[FinishSession] ,[UserToken] ,[Status] ,[User_UserId]) VALUES ('2019-07-06 16:29:33.207', '2019-07-06 16:30:04.047', '76G3a6A9u8s0u2K7d3r7z3W2z075m3z3Z4z1N815i1Q7C5C9z1', 'BlockNewAuthorization', 1)
           
		   

INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('Phone' , 'Phone')
INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('MobilPhone' , 'Mobil phone')
INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('Tablet' , 'Tablet')
INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('Android' , 'Android device')
INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('iOS' , 'iOS device')
INSERT INTO [dbo].[ProductCategory] ([CategoryName] ,[Description])   VALUES ('test6' , 'test6 description')




INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Honor 8X 4GB/64GB JSN-L21 (мерцающий синий)' ,
	 'https://content2.onliner.by/catalog/device/main/4f706c64f213675ef72dda2b4163f0f9.jpeg' ,
	 'Android, экран 6.5" IPS (1080x2340), HiSilicon Kirin 710, ОЗУ 4 ГБ, флэш-память 64 ГБ, карты памяти, камера 20 Мп, аккумулятор 3750 мАч, 2 SIM, цвет фиолетовый')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Samsung Galaxy A50 4GB/64GB (белый)' ,
	 'https://content2.onliner.by/catalog/device/main/c93a1df6be27222912d27530201d7d7a.jpeg' ,
	 'Android, экран 6.4" AMOLED (1080x2340), Exynos 9610, ОЗУ 4 ГБ, флэш-память 64 ГБ, карты памяти, камера 25 Мп, аккумулятор 4000 мАч, 2 SIM, цвет белый')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Xiaomi Mi 9T 6GB/64GB (красный)' ,
	 'https://content2.onliner.by/catalog/device/main/ea83cc8a1e61b69ea4985220db0acbe7.jpeg' ,
	 'Android, экран 6.39" AMOLED (1080x2340), Qualcomm Snapdragon 730, ОЗУ 6 ГБ, флэш-память 64 ГБ, камера 48 Мп, аккумулятор 4000 мАч, 2 SIM, цвет красный')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Apple iPhone XR 64GB (черный)' ,
	 'https://content2.onliner.by/catalog/device/main/4a8e8e3302192d2d2030040c4e2c4eca.jpeg' ,
	 'Apple iOS, экран 6.1" IPS (828x1792), Apple A12 Bionic, ОЗУ 3 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2942 мАч, 1 SIM, цвет черный')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Apple iPhone X 64GB (серебристый)' ,
	 'https://content2.onliner.by/catalog/device/main/158b9706de2037fbc4bd61ab950709b3.jpeg' ,
	 'Apple iOS, экран 5.8" AMOLED (1125x2436), Apple A11 Bionic, ОЗУ 3 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2716 мАч, 1 SIM, цвет серебристый')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Apple iPad 2018 32GB MR7F2 (серый космос)' ,
	 'https://content2.onliner.by/catalog/device/main/f6e7cdacb1b489c1384d35dfd336206a.png' ,
	 '9.7" IPS (2048x1536), iOS, Apple A10, ОЗУ 2 ГБ, флэш-память 32 ГБ, цвет серый')
INSERT INTO [dbo].[ProductInformation] ([ProductName] ,[ImageLocalSource] ,[Description])
     VALUES ('Samsung Galaxy Tab A10.1 2GB/32GB (черный)' ,
	 'https://content2.onliner.by/catalog/device/main/89eb06cb40aad453b1b63a3c6cb86a03.jpeg' ,
	 '10.1" IPS (1920x1200), Android, Exynos 7904, ОЗУ 2 ГБ, флэш-память 32 ГБ, LTE, цвет черный')



INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,2)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (2,2)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (4,2)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (4,3)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (2,3)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,3)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,4)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (2,4)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (5,4)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (5,5)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (2,5)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,5)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (3,6)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (5,6)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (4,7)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (3,7)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,1)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (2,1)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (4,1)
INSERT INTO [dbo].[ProductInformation_ProductCategory] ([ProductCategory_ProductCategoryId] ,[ProductInformation_ProductInformationId])  VALUES (1,2)



INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (520, 'Available', 1)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (554, 'Available', 2)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (1000, 'Available', 3)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (1710, 'NeedToOrder', 4)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (1980, 'NotAvailable', 5)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (740, 'Available', 6)
INSERT INTO [dbo].[Product] ([Price] ,[Status] ,[ProductInformation_ProductInformationId]) VALUES  (523, 'NotAvailable', 7)



INSERT INTO [dbo].[UserOrder] ([DateOrder] ,[Address] ,[Status] ,[User_UserId]) VALUES ('17-09-2019' ,N'Могилев, Димитрова 33-33' ,'Fulfilled' ,1)
INSERT INTO [dbo].[UserOrder] ([DateOrder] ,[Address] ,[Status] ,[User_UserId]) VALUES ('17-09-2019' ,N'Самовывоз' ,'Processed' ,3)
INSERT INTO [dbo].[UserOrder] ([DateOrder] ,[Address] ,[Status] ,[User_UserId]) VALUES ('17-09-2019' ,N'Могилев, Непокоренных' ,'Processed' ,2)
INSERT INTO [dbo].[UserOrder] ([DateOrder] ,[Address] ,[Status] ,[User_UserId]) VALUES ('17-09-2019' ,N'Самовывоз' ,'NewOrder' ,3)
INSERT INTO [dbo].[UserOrder] ([DateOrder] ,[Address] ,[Status] ,[User_UserId]) VALUES ('17-09-2019' ,N'Могилев, Мовчанского 75-22' ,'NewOrder' ,3)



INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (1 ,1)
INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (1 ,5)
INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (3 ,3)
INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (4 ,5)
INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (5 ,1)
INSERT INTO [dbo].[UserOrder_Product] ([UserOrder_UserOrderId] ,[Product_ProductId]) VALUES (5 ,2)



















GO
