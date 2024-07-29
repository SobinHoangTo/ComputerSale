USE [SWP391_SE1812_Group5_Project]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 
GO
INSERT [dbo].[customer] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [reg_date]) VALUES (1, N'user1', N'202cb962ac59075b964b07152d234b70', N'user1@example.com', N'123456789', N'123 ABC, City, Country', N'John', N'Cena', N'profile.jpg', CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[customer] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [reg_date]) VALUES (2, N'user2', N'202cb962ac59075b964b07152d234b70', N'user2@example.com', N'987654321', N'456 XYZ, Town, Country', N'Jack', N'Ma', N'profile.jpg', CAST(N'2024-02-20' AS Date))
GO
INSERT [dbo].[customer] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [reg_date]) VALUES (3, N'user3', N'202cb962ac59075b964b07152d234b70', N'user3@example.com', N'555666777', N'789 ABC, Village, Country', N'Bill', N'Gate', N'profile.jpg', CAST(N'2024-03-25' AS Date))
GO
INSERT [dbo].[customer] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [reg_date]) VALUES (4, N'user4', N'202cb962ac59075b964b07152d234b70', N'user4@example.com', N'333222111', N'987 XYZ, Suburb, Country', N'Tony', N'Stark', N'profile.jpg', CAST(N'2024-04-30' AS Date))
GO
INSERT [dbo].[customer] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [reg_date]) VALUES (5, N'user5', N'202cb962ac59075b964b07152d234b70', N'user5@example.com', N'444777888', N'654 ABC, Hamlet, Country', N'Ronaldo', N'Messi', N'profile.jpg', CAST(N'2024-05-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 
GO
INSERT [dbo].[employee] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [role_id], [reg_date], [status]) VALUES (1, N'vinh', N'202cb962ac59075b964b07152d234b70', N'staff1@example.com', N'123456789', N'123 ABC, City, Country', N'Vu', N'Vinh', N'profile.jpg', 1, CAST(N'2024-01-15' AS Date), 1)
GO
INSERT [dbo].[employee] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [role_id], [reg_date], [status]) VALUES (2, N'hieu', N'202cb962ac59075b964b07152d234b70', N'staff2@example.com', N'987654321', N'456 XYZ, Town, Country', N'Hieu', N'San', N'profile.jpg', 2, CAST(N'2024-02-20' AS Date), 1)
GO
INSERT [dbo].[employee] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [role_id], [reg_date], [status]) VALUES (3, N'hoang', N'202cb962ac59075b964b07152d234b70', N'staff3@example.com', N'555666777', N'789 ABC, Village, Country', N'Hoang', N'To', N'profile.jpg', 3, CAST(N'2024-03-25' AS Date), 1)
GO
INSERT [dbo].[employee] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [role_id], [reg_date], [status]) VALUES (4, N'minh', N'202cb962ac59075b964b07152d234b70', N'staff4@example.com', N'333222111', N'987 XYZ, Suburb, Country', N'Minh', N'Mai', N'profile.jpg', 2, CAST(N'2024-04-30' AS Date), 1)
GO
INSERT [dbo].[employee] ([id], [username], [password], [email], [phone], [address], [firstname], [lastname], [img], [role_id], [reg_date], [status]) VALUES (5, N'linh', N'202cb962ac59075b964b07152d234b70', N'staff5@example.com', N'444777888', N'654 ABC, Hamlet, Country', N'Linh', N'...', N'profile.jpg', 3, CAST(N'2024-05-05' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (1, 1, N'Giao hàng nhanh nhé.', N'Hà Nội', N'093456789', CAST(N'2023-05-10' AS Date), CAST(N'2024-05-11' AS Date), 2, NULL, CAST(N'2024-05-11' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (2, 2, N'Cẩn thận đừng làm h�?ng.', N'H�?Chí Minh', N'098765421', CAST(N'2023-12-01' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (3, 3, NULL, N'?à Nẵng', N'032976542', CAST(N'2023-12-01' AS Date), NULL, 3, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (4, 4, NULL, N'Hà Nội', N'091234567', CAST(N'2024-01-10' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (5, 5, NULL, N'Hải Phòng', N'098123456', CAST(N'2024-02-15' AS Date), CAST(N'2024-02-16' AS Date), 2, NULL, CAST(N'2024-02-16' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (6, 2, NULL, N'Hà Nội', N'091234578', CAST(N'2024-03-20' AS Date), CAST(N'2024-03-21' AS Date), 4, NULL, CAST(N'2024-03-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (7, 3, NULL, N'H�?Chí Minh', N'090123456', CAST(N'2024-04-25' AS Date), CAST(N'2024-04-26' AS Date), 5, NULL, CAST(N'2024-04-26' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (8, 4, NULL, N'Hà Nội', N'093234567', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-02' AS Date), 6, NULL, CAST(N'2024-05-02' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (9, 5, NULL, N'?à Nẵng', N'032123456', CAST(N'2024-05-05' AS Date), CAST(N'2024-05-06' AS Date), 7, NULL, CAST(N'2024-05-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (10, 1, NULL, N'Hải Phòng', N'098234567', CAST(N'2024-05-10' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (11, 1, NULL, N'Hà Nội', N'091345678', CAST(N'2024-05-15' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (12, 2, NULL, N'H�?Chí Minh', N'090234567', CAST(N'2024-05-20' AS Date), CAST(N'2024-05-21' AS Date), 2, NULL, CAST(N'2024-05-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (13, 3, NULL, N'Hà Nội', N'093345678', CAST(N'2024-05-25' AS Date), CAST(N'2024-05-26' AS Date), 4, NULL, CAST(N'2024-05-26' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (14, 4, NULL, N'?à Nẵng', N'032234567', CAST(N'2024-06-01' AS Date), CAST(N'2024-06-02' AS Date), 5, NULL, CAST(N'2024-06-02' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (15, 5, NULL, N'Hải Phòng', N'098345678', CAST(N'2024-06-05' AS Date), CAST(N'2024-06-06' AS Date), 6, NULL, CAST(N'2024-06-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (16, 2, NULL, N'Hà Nội', N'091456789', CAST(N'2024-06-10' AS Date), CAST(N'2024-06-11' AS Date), 7, NULL, CAST(N'2024-06-11' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (17, 1, NULL, N'H�?Chí Minh', N'090345678', CAST(N'2024-06-15' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (18, 5, NULL, N'Hà Nội', N'093456780', CAST(N'2024-06-20' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (19, 3, NULL, N'?à Nẵng', N'032345678', CAST(N'2024-06-25' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (20, 3, NULL, N'Hải Phòng', N'098456789', CAST(N'2024-07-01' AS Date), CAST(N'2024-07-02' AS Date), 2, NULL, CAST(N'2024-07-02' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (21, 1, NULL, N'Hà Nội', N'091567890', CAST(N'2024-07-05' AS Date), CAST(N'2024-07-06' AS Date), 4, NULL, CAST(N'2024-07-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (22, 2, NULL, N'H�?Chí Minh', N'090456789', CAST(N'2024-07-10' AS Date), CAST(N'2024-07-11' AS Date), 5, NULL, CAST(N'2024-07-11' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (23, 3, NULL, N'Hà Nội', N'093567890', CAST(N'2024-07-15' AS Date), CAST(N'2024-07-16' AS Date), 6, NULL, CAST(N'2024-07-16' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (24, 4, NULL, N'?à Nẵng', N'032456789', CAST(N'2024-07-20' AS Date), CAST(N'2024-07-21' AS Date), 7, NULL, CAST(N'2024-07-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (25, 5, NULL, N'Hải Phòng', N'098567890', CAST(N'2024-07-25' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (26, 2, NULL, N'Hà Nội', N'091678901', CAST(N'2024-08-01' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (27, 3, NULL, N'H�?Chí Minh', N'090567890', CAST(N'2024-08-05' AS Date), CAST(N'2024-08-06' AS Date), 2, NULL, CAST(N'2024-08-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (28, 2, NULL, N'Hà Nội', N'093678901', CAST(N'2024-08-10' AS Date), CAST(N'2024-08-11' AS Date), 4, NULL, CAST(N'2024-08-11' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (29, 2, NULL, N'?à Nẵng', N'032567890', CAST(N'2024-08-15' AS Date), CAST(N'2024-08-16' AS Date), 5, NULL, CAST(N'2024-08-16' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (30, 3, NULL, N'Hải Phòng', N'098678901', CAST(N'2024-08-20' AS Date), CAST(N'2024-08-21' AS Date), 6, NULL, CAST(N'2024-08-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (31, 1, NULL, N'Hà Nội', N'091789012', CAST(N'2024-08-25' AS Date), CAST(N'2024-08-26' AS Date), 7, NULL, CAST(N'2024-08-26' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (32, 2, NULL, N'H�?Chí Minh', N'090678901', CAST(N'2024-09-01' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (33, 3, NULL, N'Hà Nội', N'093789012', CAST(N'2024-09-05' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (34, 3, NULL, N'?à Nẵng', N'032678901', CAST(N'2024-09-10' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (35, 5, NULL, N'Hải Phòng', N'098789012', CAST(N'2024-09-15' AS Date), CAST(N'2024-09-16' AS Date), 2, NULL, CAST(N'2024-09-16' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (36, 3, NULL, N'Hà Nội', N'091890123', CAST(N'2024-09-20' AS Date), CAST(N'2024-09-21' AS Date), 4, NULL, CAST(N'2024-09-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (37, 4, NULL, N'H�?Chí Minh', N'090789012', CAST(N'2024-09-25' AS Date), CAST(N'2024-09-26' AS Date), 5, NULL, CAST(N'2024-09-26' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (38, 3, NULL, N'Hà Nội', N'093890123', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-02' AS Date), 6, NULL, CAST(N'2024-10-02' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (39, 5, NULL, N'?à Nẵng', N'032789012', CAST(N'2024-10-05' AS Date), CAST(N'2024-10-06' AS Date), 7, NULL, CAST(N'2024-10-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (40, 5, NULL, N'Hải Phòng', N'098890123', CAST(N'2024-10-10' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (41, 4, NULL, N'Hà Nội', N'091901234', CAST(N'2024-10-15' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (42, 2, NULL, N'H�?Chí Minh', N'090890123', CAST(N'2024-10-20' AS Date), CAST(N'2024-10-21' AS Date), 2, NULL, CAST(N'2024-10-21' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (43, 4, NULL, N'Hà Nội', N'093901234', CAST(N'2024-10-25' AS Date), CAST(N'2024-10-26' AS Date), 4, NULL, CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (44, 4, NULL, N'?à Nẵng', N'032890123', CAST(N'2024-11-01' AS Date), CAST(N'2024-11-02' AS Date), 5, NULL, CAST(N'2024-11-02' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (45, 5, NULL, N'Hải Phòng', N'098901234', CAST(N'2024-11-05' AS Date), CAST(N'2024-11-06' AS Date), 6, NULL, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (46, 4, NULL, N'Hà Nội', N'091012345', CAST(N'2024-11-10' AS Date), CAST(N'2024-11-11' AS Date), 7, NULL, CAST(N'2024-11-11' AS Date))
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (47, 2, NULL, N'H�?Chí Minh', N'090901234', CAST(N'2024-11-15' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (48, 1, NULL, N'Hà Nội', N'093012345', CAST(N'2024-11-20' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (49, 3, NULL, N'?à Nẵng', N'032901234', CAST(N'2024-11-25' AS Date), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[order] ([id], [customer_id], [note], [address], [phone], [order_date], [paid_date], [order_status], [verified_by], [verified_on]) VALUES (50, 5, NULL, N'Hải Phòng', N'098012345', CAST(N'2024-12-01' AS Date), CAST(N'2024-12-02' AS Date), 2, NULL, CAST(N'2024-12-02' AS Date))
GO
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (1, N'Gaming Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (2, N'Office Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (3, N'Business Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (4, N'Study Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (5, N'Multimedia Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (6, N'Graphics Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[category] ([id], [name], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (7, N'High-end Laptop', 2, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (1, N'Asus', N'Asus_Logo.png', N'https://www.asus.com', 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (2, N'Dell', N'Dell_Logo.png', N'https://www.dell.com', 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (3, N'HP', N'HP_Logo.png', N'https://www.hp.com', 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (4, N'MSI', N'MSI_Logo.png', N'https://www.msi.com', 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (5, N'Apple', N'Apple_Logo.png', N'https://www.apple.com', 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (6, N'Acer', N'Acer_Logo.png', N'https://www.acer.com', 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[brand] ([id], [name], [logo], [link], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (7, N'Lenovo', N'Lenovo_Logo.png', N'https://www.lenovo.com/vn/vi', 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (1, N'Laptop Asus ROG Strix', N'Intel Core i7-10750H', N'Nvidia RTX 2060', N'16GB DDR4', N'1TB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 35250000, N'High-performance gaming laptop.', 1, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (2, N'Laptop Asus ZenBook 14', N'AMD Ryzen 7 5700U', N'Integrated Radeon Graphics', N'16GB DDR4', N'512GB SSD', N'14-inch FHD', N'Windows 10', 28200000, N'Ultra-slim and lightweight laptop for professionals.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (3, N'Laptop Asus TUF Gaming A15', N'AMD Ryzen 5 4600H', N'Nvidia GTX 1650 Ti', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 25850000, N'Durable and powerful gaming laptop.', 1, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (4, N'Laptop Asus VivoBook S15', N'Intel Core i5-1135G7', N'Intel Iris Xe', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 21150000, N'Stylish and lightweight laptop.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (5, N'Laptop Asus ProArt StudioBook', N'Intel Core i9-11900H', N'Nvidia RTX 3070', N'32GB DDR4', N'1TB SSD', N'17-inch 4K UHD', N'Windows 10', 58750000, N'Professional laptop for creators.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (6, N'Laptop Asus Chromebook Flip', N'Intel Core m3-8100Y', N'Integrated Graphics', N'4GB LPDDR3', N'64GB eMMC', N'12.5-inch FHD Touch', N'Chrome OS', 14100000, N'Versatile and portable Chromebook.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (7, N'Laptop Asus ROG Zephyrus G14', N'AMD Ryzen 9 4900HS', N'Nvidia RTX 2060 Max-Q', N'16GB DDR4', N'1TB SSD', N'14-inch FHD 120Hz', N'Windows 10', 42300000, N'Compact yet powerful gaming laptop.', 1, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (8, N'Laptop Asus VivoBook Flip 14', N'Intel Core i3-1115G4', N'Intel UHD Graphics', N'4GB DDR4', N'256GB SSD', N'14-inch FHD Touch', N'Windows 10', 16450000, N'Convertible laptop with a touch screen.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (9, N'Laptop Asus ExpertBook B9', N'Intel Core i7-10510U', N'Intel UHD Graphics', N'16GB LPDDR3', N'1TB SSD', N'14-inch FHD', N'Windows 10 Pro', 39950000, N'Lightweight business laptop.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (10, N'Laptop Asus VivoBook 15', N'AMD Ryzen 3 3250U', N'AMD Radeon Vega 3', N'8GB DDR4', N'256GB SSD', N'15.6-inch FHD', N'Windows 10', 15275000, N'Affordable and reliable laptop.', 1, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (11, N'Laptop Dell XPS 13', N'Intel Core i7-1165G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'13.3-inch FHD', N'Windows 10', 1400, N'Ultra-portable and premium laptop.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (12, N'Laptop Dell XPS 13', N'Intel Core i7-1165G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'13.3-inch FHD', N'Windows 10', 32900000, N'Ultra-portable and premium laptop.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (13, N'Laptop Dell Inspiron 15', N'Intel Core i5-1135G7', N'Nvidia MX330', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 18800000, N'Versatile laptop for everyday use.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (14, N'Laptop Dell G5 15', N'Intel Core i7-10750H', N'Nvidia GTX 1660 Ti', N'16GB DDR4', N'1TB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 30550000, N'Gaming laptop with high performance.', 2, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (15, N'Laptop Dell Latitude 7420', N'Intel Core i7-1185G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'14-inch FHD', N'Windows 10 Pro', 37600000, N'Business laptop with advanced features.', 2, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (16, N'Laptop Dell Alienware m15', N'Intel Core i9-10980HK', N'Nvidia RTX 2080 Super', N'32GB DDR4', N'1TB SSD', N'15.6-inch FHD 300Hz', N'Windows 10', 70500000, N'High-end gaming laptop.', 2, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (17, N'Laptop Dell Vostro 14', N'Intel Core i3-1115G4', N'Intel UHD Graphics', N'4GB DDR4', N'256GB SSD', N'14-inch HD', N'Windows 10', 14100000, N'Affordable laptop for small businesses.', 2, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (18, N'Laptop Dell Precision 5550', N'Intel Xeon W-10855M', N'Nvidia Quadro T2000', N'32GB DDR4', N'1TB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 58750000, N'Mobile workstation for professionals.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (19, N'Laptop Dell Chromebook 3100', N'Intel Celeron N4020', N'Intel UHD Graphics 600', N'4GB LPDDR4', N'32GB eMMC', N'11.6-inch HD', N'Chrome OS', 7050000, N'Durable Chromebook for education.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (20, N'Laptop Dell G3 15', N'AMD Ryzen 5 4600H', N'Nvidia GTX 1650', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 23500000, N'Affordable gaming laptop.', 2, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (21, N'Laptop Dell XPS 17', N'Intel Core i9-11900H', N'Nvidia RTX 3060', N'32GB DDR4', N'1TB SSD', N'17-inch 4K UHD', N'Windows 10', 63450000, N'Powerful laptop with large screen.', 2, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (22, N'Laptop HP Spectre x360', N'Intel Core i7-1165G7', N'Intel Iris Xe', N'16GB DDR4', N'512GB SSD', N'13.3-inch FHD Touch', N'Windows 10', 35250000, N'Convertible laptop with high performance.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (23, N'Laptop HP Pavilion 15', N'AMD Ryzen 5 4500U', N'AMD Radeon Graphics', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 16450000, N'Versatile laptop for everyday use.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (24, N'Laptop HP Envy 13', N'Intel Core i5-1135G7', N'Intel Iris Xe', N'8GB DDR4', N'256GB SSD', N'13.3-inch FHD', N'Windows 10', 21150000, N'Sleek and portable laptop.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (25, N'Laptop HP Omen 15', N'AMD Ryzen 7 4800H', N'Nvidia GTX 1660 Ti', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 30550000, N'Powerful gaming laptop.', 3, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (26, N'Laptop HP Elite Dragonfly', N'Intel Core i7-1165G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'13.3-inch FHD Touch', N'Windows 10 Pro', 42300000, N'Premium business laptop.', 3, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (27, N'Laptop HP Chromebook 14', N'Intel Celeron N4000', N'Intel UHD Graphics 600', N'4GB DDR4', N'32GB eMMC', N'14-inch HD', N'Chrome OS', 7050000, N'Affordable Chromebook for everyday use.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (28, N'Laptop HP ProBook 450', N'Intel Core i5-1135G7', N'Intel Iris Xe', N'8GB DDR4', N'256GB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 23500000, N'Reliable laptop for business.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (29, N'Laptop HP ZBook Firefly 14', N'Intel Core i7-1165G7', N'Nvidia Quadro T500', N'16GB DDR4', N'512GB SSD', N'14-inch FHD', N'Windows 10 Pro', 39950000, N'Mobile workstation for professionals.', 3, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (30, N'Laptop HP Envy x360', N'AMD Ryzen 7 5700U', N'AMD Radeon Graphics', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD Touch', N'Windows 10', 25850000, N'Convertible laptop with powerful performance.', 3, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (31, N'Laptop HP Pavilion Gaming 16', N'Intel Core i5-10300H', N'Nvidia GTX 1650 Ti', N'8GB DDR4', N'512GB SSD', N'16.1-inch FHD', N'Windows 10', 23500000, N'Gaming laptop with large screen.', 3, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (32, N'Laptop MSI GF63', N'Intel Core i7-10750H', N'Nvidia GTX 1650', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 120Hz', N'Windows 10', 25400000, N'Affordable gaming laptop.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (33, N'Laptop MSI Prestige 14', N'Intel Core i7-1185G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'1TB SSD', N'14-inch FHD', N'Windows 10', 32300000, N'Stylish and powerful laptop for creators.', 4, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (34, N'Laptop MSI Modern 15', N'AMD Ryzen 5 4500U', N'AMD Radeon Graphics', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 16100000, N'Versatile laptop for everyday use.', 4, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (35, N'Laptop MSI GE75 Raider', N'Intel Core i9-10980HK', N'Nvidia RTX 2080 Super', N'32GB DDR4', N'1TB SSD', N'17.3-inch FHD 300Hz', N'Windows 10', 69000000, N'High-end gaming laptop with large screen.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (36, N'Laptop MSI WS66', N'Intel Xeon W-10855M', N'Nvidia Quadro RTX 4000', N'32GB DDR4', N'1TB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 57500000, N'Mobile workstation for professionals.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (37, N'Laptop MSI Stealth 15M', N'Intel Core i7-11375H', N'Nvidia RTX 3060', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 39100000, N'Slim and powerful gaming laptop.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (38, N'Laptop MSI Bravo 15', N'AMD Ryzen 7 4800H', N'AMD Radeon RX 5500M', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 27600000, N'Affordable gaming laptop with AMD components.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (39, N'Laptop MSI Creator 17', N'Intel Core i7-10875H', N'Nvidia RTX 2070 Super', N'32GB DDR4', N'1TB SSD', N'17.3-inch 4K UHD', N'Windows 10', 62100000, N'Professional laptop for content creators.', 4, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (40, N'Laptop MSI Summit E14', N'Intel Core i7-1185G7', N'Nvidia GTX 1650 Ti', N'16GB LPDDR4x', N'1TB SSD', N'14-inch FHD', N'Windows 10 Pro', 41400000, N'Business laptop with powerful performance.', 4, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (41, N'Laptop MSI GL65 Leopard', N'Intel Core i7-10750H', N'Nvidia RTX 2070', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 34500000, N'Gaming laptop with robust performance.', 4, 5, N'laptops-2048px-5607.png', 1, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (42, N'MacBook Pro 13', N'Apple M1', N'Integrated 8-core GPU', N'16GB Unified', N'512GB SSD', N'13.3-inch Retina', N'macOS', 42300000, N'Powerful and portable laptop.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (43, N'MacBook Air', N'Apple M1', N'Integrated 8-core GPU', N'8GB Unified', N'256GB SSD', N'13.3-inch Retina', N'macOS', 23500000, N'Lightweight and efficient laptop.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (44, N'MacBook Pro 16', N'Intel Core i9', N'AMD Radeon Pro 5500M', N'32GB DDR4', N'1TB SSD', N'16-inch Retina', N'macOS', 65900000, N'High-end laptop for professionals.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (45, N'iMac 24', N'Apple M1', N'Integrated 8-core GPU', N'16GB Unified', N'1TB SSD', N'24-inch 4.5K Retina', N'macOS', 47000000, N'All-in-one desktop with stunning display.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (46, N'Mac Mini', N'Apple M1', N'Integrated 8-core GPU', N'16GB Unified', N'512GB SSD', N'N/A', N'macOS', 23500000, N'Compact desktop with powerful performance.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (47, N'MacBook Pro 14', N'Apple M1 Pro', N'Integrated 16-core GPU', N'32GB Unified', N'1TB SSD', N'14.2-inch Retina', N'macOS', 58750000, N'Powerful laptop for demanding tasks.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (48, N'iMac 27', N'Intel Core i7', N'AMD Radeon Pro 5700XT', N'32GB DDR4', N'1TB SSD', N'27-inch 5K Retina', N'macOS', 70500000, N'High-performance all-in-one desktop.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (49, N'MacBook Pro 15', N'Intel Core i7', N'AMD Radeon Pro 560X', N'16GB DDR4', N'512GB SSD', N'15.4-inch Retina', N'macOS', 56400000, N'Professional laptop with large screen.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (50, N'Mac Pro', N'Intel Xeon W', N'AMD Radeon Pro Vega II', N'64GB DDR4', N'1TB SSD', N'N/A', N'macOS', 141000000, N'High-end desktop for professionals.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (51, N'MacBook Pro 13 (Intel)', N'Intel Core i5', N'Intel Iris Plus', N'16GB DDR4', N'512GB SSD', N'13.3-inch Retina', N'macOS', 39950000, N'Portable and powerful laptop.', 5, 5, N'laptops-2048px-5607.png', 2, 4, CAST(N'2024-05-16' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (52, N'Laptop Acer Aspire 5', N'Intel Core i5-1135G7', N'Nvidia MX350', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 16450000, N'Affordable laptop for everyday use.', 6, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (53, N'Laptop Acer Nitro 5', N'Intel Core i7-10750H', N'Nvidia GTX 1660 Ti', N'16GB DDR4', N'1TB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 28200000, N'Powerful gaming laptop.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (54, N'Laptop Acer Swift 3', N'AMD Ryzen 7 4700U', N'AMD Radeon Graphics', N'8GB DDR4', N'512GB SSD', N'14-inch FHD', N'Windows 10', 15275000, N'Slim and lightweight laptop.', 6, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (55, N'Laptop Acer Predator Helios 300', N'Intel Core i7-10750H', N'Nvidia RTX 2070', N'16GB DDR4', N'1TB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 32900000, N'High-end gaming laptop.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (56, N'Laptop Acer Chromebook Spin 713', N'Intel Core i5-10210U', N'Intel UHD Graphics', N'8GB DDR4', N'128GB eMMC', N'13.5-inch 2K Touch', N'Chrome OS', 16450000, N'Versatile and convertible Chromebook.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (57, N'Laptop Acer Aspire 7', N'AMD Ryzen 5 3550H', N'Nvidia GTX 1650', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD', N'Windows 10', 18800000, N'Reliable laptop for gaming and work.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (58, N'Laptop Acer Spin 5', N'Intel Core i7-1065G7', N'Intel Iris Plus', N'16GB DDR4', N'512GB SSD', N'13.5-inch 2K Touch', N'Windows 10', 23500000, N'Convertible laptop with high resolution.', 6, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (59, N'Laptop Acer Enduro N3', N'Intel Core i5-10210U', N'Nvidia MX230', N'8GB DDR4', N'512GB SSD', N'14-inch FHD', N'Windows 10 Pro', 25850000, N'Durable laptop for harsh environments.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (60, N'Laptop Acer TravelMate P2', N'Intel Core i5-1035G1', N'Intel UHD Graphics', N'8GB DDR4', N'256GB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 14100000, N'Affordable business laptop.', 6, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (61, N'Laptop Acer ConceptD 3', N'Intel Core i7-9750H', N'Nvidia GTX 1650', N'16GB DDR4', N'1TB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 35250000, N'Laptop for creative professionals.', 6, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (62, N'Laptop Lenovo ThinkPad X1 Carbon', N'Intel Core i7-1165G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'14-inch FHD', N'Windows 10 Pro', 37600000, N'Premium business laptop.', 7, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (63, N'Laptop Lenovo Yoga 7i', N'Intel Core i5-1135G7', N'Intel Iris Xe', N'8GB DDR4', N'256GB SSD', N'14-inch FHD Touch', N'Windows 10', 21150000, N'Convertible laptop with great performance.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (64, N'Laptop Lenovo Legion 5', N'AMD Ryzen 7 4800H', N'Nvidia GTX 1660 Ti', N'16GB DDR4', N'512GB SSD', N'15.6-inch FHD 144Hz', N'Windows 10', 28200000, N'Powerful gaming laptop.', 7, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (65, N'Laptop Lenovo IdeaPad 3', N'AMD Ryzen 5 3500U', N'AMD Radeon Vega 8', N'8GB DDR4', N'256GB SSD', N'15.6-inch FHD', N'Windows 10', 11750000, N'Affordable laptop for everyday tasks.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (66, N'Laptop Lenovo ThinkBook 14s', N'Intel Core i5-10210U', N'Intel UHD Graphics', N'8GB DDR4', N'512GB SSD', N'14-inch FHD', N'Windows 10 Pro', 23500000, N'Business laptop with solid performance.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (67, N'Laptop Lenovo Flex 5', N'AMD Ryzen 5 4500U', N'AMD Radeon Graphics', N'8GB DDR4', N'256GB SSD', N'14-inch FHD Touch', N'Windows 10', 16450000, N'Convertible laptop with AMD performance.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (68, N'Laptop Lenovo ThinkPad P53', N'Intel Xeon E-2276M', N'Nvidia Quadro T2000', N'32GB DDR4', N'1TB SSD', N'15.6-inch FHD', N'Windows 10 Pro', 58750000, N'Mobile workstation for professionals.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (69, N'Laptop Lenovo Chromebook Duet', N'MediaTek Helio P60T', N'ARM G72 MP3', N'4GB LPDDR4x', N'64GB eMMC', N'10.1-inch FHD Touch', N'Chrome OS', 7050000, N'Affordable 2-in-1 Chromebook.', 7, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (70, N'Laptop Lenovo ThinkPad X1 Yoga', N'Intel Core i7-1185G7', N'Intel Iris Xe', N'16GB LPDDR4x', N'512GB SSD', N'14-inch FHD Touch', N'Windows 10 Pro', 42300000, N'Convertible business laptop.', 7, 5, N'laptops-2048px-5607.png', 2, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
INSERT [dbo].[product] ([id], [name], [CPU], [GPU], [RAM], [ROM], [monitor], [OS], [price], [description], [brand_id], [quantity], [representImage], [category_id], [created_by], [created_on], [modified_by], [modified_on], [status]) VALUES (71, N'Laptop Lenovo Legion 7i', N'Intel Core i9-10980HK', N'Nvidia RTX 2080 Super', N'32GB DDR4', N'1TB SSD', N'15.6-inch FHD 240Hz', N'Windows 10', 65800000, N'High-end gaming laptop.', 7, 5, N'laptops-2048px-5607.png', 1, 3, CAST(N'2024-05-20' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[discount] ON 
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (1, 1, 5, 98, CAST(N'2024-05-30' AS Date), CAST(N'2024-06-30' AS Date), 4, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (2, 2, 3, 95, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-15' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (3, 3, 1, 100, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-31' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (4, 4, 2, 10, CAST(N'2024-05-30' AS Date), CAST(N'2024-06-15' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (5, 5, 1, 99, CAST(N'2024-05-30' AS Date), CAST(N'2024-08-10' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (6, 6, 4, 75, CAST(N'2024-05-30' AS Date), CAST(N'2024-08-20' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (7, 7, 3, 85, CAST(N'2024-05-30' AS Date), CAST(N'2024-08-25' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (8, 8, 2, 90, CAST(N'2024-05-30' AS Date), CAST(N'2024-09-05' AS Date), 4, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (9, 9, 5, 60, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-30' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (10, 10, 6, 70, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-20' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (11, 11, 1, 55, CAST(N'2024-05-30' AS Date), CAST(N'2024-06-25' AS Date), 4, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (12, 12, 5, 65, CAST(N'2024-05-30' AS Date), CAST(N'2024-09-15' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (13, 13, 5, 80, CAST(N'2024-05-30' AS Date), CAST(N'2024-10-05' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (14, 14, 2, 50, CAST(N'2024-05-30' AS Date), CAST(N'2024-08-10' AS Date), 4, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (15, 15, 3, 95, CAST(N'2024-05-30' AS Date), CAST(N'2024-09-25' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (16, 16, 4, 88, CAST(N'2024-05-30' AS Date), CAST(N'2024-08-30' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (17, 17, 5, 77, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-15' AS Date), 4, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (18, 18, 2, 93, CAST(N'2024-05-30' AS Date), CAST(N'2024-07-05' AS Date), 2, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (19, 19, 3, 85, CAST(N'2024-05-30' AS Date), CAST(N'2024-09-20' AS Date), 3, 1)
GO
INSERT [dbo].[discount] ([id], [product_id], [quantity], [value], [start_date], [exp_date], [created_by], [status]) VALUES (20, 20, 1, 99, CAST(N'2024-05-30' AS Date), CAST(N'2024-10-15' AS Date), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[discount] OFF
GO
SET IDENTITY_INSERT [dbo].[serial_number] ON 
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (1, N'1_SN_01', 1, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (2, N'1_SN_02', 1, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (3, N'1_SN_03', 1, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (4, N'1_SN_04', 1, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (5, N'1_SN_05', 1, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (6, N'2_SN_01', 2, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (7, N'2_SN_02', 2, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (8, N'2_SN_03', 2, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (9, N'2_SN_04', 2, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (10, N'2_SN_05', 2, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (11, N'3_SN_01', 3, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (12, N'3_SN_02', 3, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (13, N'3_SN_03', 3, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (14, N'3_SN_04', 3, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (15, N'3_SN_05', 3, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (16, N'4_SN_01', 4, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (17, N'4_SN_02', 4, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (18, N'4_SN_03', 4, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (19, N'4_SN_04', 4, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (20, N'4_SN_05', 4, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (21, N'5_SN_01', 5, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (22, N'5_SN_02', 5, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (23, N'5_SN_03', 5, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (24, N'5_SN_04', 5, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (25, N'5_SN_05', 5, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (26, N'6_SN_01', 6, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (27, N'6_SN_02', 6, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (28, N'6_SN_03', 6, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (29, N'6_SN_04', 6, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (30, N'6_SN_05', 6, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (31, N'7_SN_01', 7, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (32, N'7_SN_02', 7, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (33, N'7_SN_03', 7, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (34, N'7_SN_04', 7, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (35, N'7_SN_05', 7, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (36, N'8_SN_01', 8, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (37, N'8_SN_02', 8, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (38, N'8_SN_03', 8, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (39, N'8_SN_04', 8, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (40, N'8_SN_05', 8, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (41, N'9_SN_01', 9, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (42, N'9_SN_02', 9, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (43, N'9_SN_03', 9, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (44, N'9_SN_04', 9, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (45, N'9_SN_05', 9, 2)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (46, N'10_SN_01', 10, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (47, N'10_SN_02', 10, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (48, N'10_SN_03', 10, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (49, N'10_SN_04', 10, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (50, N'10_SN_05', 10, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (51, N'11_SN_01', 11, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (52, N'11_SN_02', 11, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (53, N'11_SN_03', 11, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (54, N'11_SN_04', 11, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (55, N'11_SN_05', 11, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (56, N'12_SN_01', 12, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (57, N'12_SN_02', 12, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (58, N'12_SN_03', 12, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (59, N'12_SN_04', 12, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (60, N'12_SN_05', 12, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (61, N'13_SN_01', 13, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (62, N'13_SN_02', 13, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (63, N'13_SN_03', 13, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (64, N'13_SN_04', 13, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (65, N'13_SN_05', 13, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (66, N'14_SN_01', 14, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (67, N'14_SN_02', 14, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (68, N'14_SN_03', 14, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (69, N'14_SN_04', 14, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (70, N'14_SN_05', 14, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (71, N'15_SN_01', 15, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (72, N'15_SN_02', 15, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (73, N'15_SN_03', 15, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (74, N'15_SN_04', 15, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (75, N'15_SN_05', 15, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (76, N'16_SN_01', 16, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (77, N'16_SN_02', 16, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (78, N'16_SN_03', 16, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (79, N'16_SN_04', 16, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (80, N'16_SN_05', 16, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (81, N'17_SN_01', 17, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (82, N'17_SN_02', 17, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (83, N'17_SN_03', 17, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (84, N'17_SN_04', 17, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (85, N'17_SN_05', 17, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (86, N'18_SN_01', 18, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (87, N'18_SN_02', 18, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (88, N'18_SN_03', 18, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (89, N'18_SN_04', 18, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (90, N'18_SN_05', 18, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (91, N'19_SN_01', 19, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (92, N'19_SN_02', 19, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (93, N'19_SN_03', 19, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (94, N'19_SN_04', 19, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (95, N'19_SN_05', 19, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (96, N'20_SN_01', 20, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (97, N'20_SN_02', 20, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (98, N'20_SN_03', 20, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (99, N'20_SN_04', 20, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (100, N'20_SN_05', 20, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (101, N'21_SN_01', 21, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (102, N'21_SN_02', 21, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (103, N'21_SN_03', 21, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (104, N'21_SN_04', 21, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (105, N'21_SN_05', 21, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (106, N'22_SN_01', 22, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (107, N'22_SN_02', 22, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (108, N'22_SN_03', 22, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (109, N'22_SN_04', 22, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (110, N'22_SN_05', 22, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (111, N'23_SN_01', 23, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (112, N'23_SN_02', 23, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (113, N'23_SN_03', 23, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (114, N'23_SN_04', 23, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (115, N'23_SN_05', 23, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (116, N'24_SN_01', 24, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (117, N'24_SN_02', 24, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (118, N'24_SN_03', 24, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (119, N'24_SN_04', 24, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (120, N'24_SN_05', 24, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (121, N'25_SN_01', 25, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (122, N'25_SN_02', 25, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (123, N'25_SN_03', 25, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (124, N'25_SN_04', 25, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (125, N'25_SN_05', 25, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (126, N'26_SN_01', 26, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (127, N'26_SN_02', 26, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (128, N'26_SN_03', 26, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (129, N'26_SN_04', 26, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (130, N'26_SN_05', 26, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (131, N'27_SN_01', 27, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (132, N'27_SN_02', 27, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (133, N'27_SN_03', 27, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (134, N'27_SN_04', 27, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (135, N'27_SN_05', 27, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (136, N'28_SN_01', 28, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (137, N'28_SN_02', 28, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (138, N'28_SN_03', 28, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (139, N'28_SN_04', 28, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (140, N'28_SN_05', 28, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (141, N'29_SN_01', 29, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (142, N'29_SN_02', 29, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (143, N'29_SN_03', 29, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (144, N'29_SN_04', 29, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (145, N'29_SN_05', 29, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (146, N'30_SN_01', 30, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (147, N'30_SN_02', 30, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (148, N'30_SN_03', 30, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (149, N'30_SN_04', 30, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (150, N'30_SN_05', 30, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (151, N'31_SN_01', 31, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (152, N'31_SN_02', 31, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (153, N'31_SN_03', 31, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (154, N'31_SN_04', 31, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (155, N'31_SN_05', 31, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (156, N'32_SN_01', 32, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (157, N'32_SN_02', 32, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (158, N'32_SN_03', 32, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (159, N'32_SN_04', 32, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (160, N'32_SN_05', 32, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (161, N'33_SN_01', 33, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (162, N'33_SN_02', 33, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (163, N'33_SN_03', 33, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (164, N'33_SN_04', 33, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (165, N'33_SN_05', 33, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (166, N'34_SN_01', 34, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (167, N'34_SN_02', 34, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (168, N'34_SN_03', 34, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (169, N'34_SN_04', 34, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (170, N'34_SN_05', 34, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (171, N'35_SN_01', 35, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (172, N'35_SN_02', 35, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (173, N'35_SN_03', 35, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (174, N'35_SN_04', 35, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (175, N'35_SN_05', 35, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (176, N'36_SN_01', 36, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (177, N'36_SN_02', 36, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (178, N'36_SN_03', 36, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (179, N'36_SN_04', 36, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (180, N'36_SN_05', 36, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (181, N'37_SN_01', 37, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (182, N'37_SN_02', 37, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (183, N'37_SN_03', 37, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (184, N'37_SN_04', 37, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (185, N'37_SN_05', 37, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (186, N'38_SN_01', 38, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (187, N'38_SN_02', 38, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (188, N'38_SN_03', 38, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (189, N'38_SN_04', 38, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (190, N'38_SN_05', 38, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (191, N'39_SN_01', 39, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (192, N'39_SN_02', 39, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (193, N'39_SN_03', 39, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (194, N'39_SN_04', 39, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (195, N'39_SN_05', 39, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (196, N'40_SN_01', 40, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (197, N'40_SN_02', 40, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (198, N'40_SN_03', 40, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (199, N'40_SN_04', 40, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (200, N'40_SN_05', 40, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (201, N'41_SN_01', 41, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (202, N'41_SN_02', 41, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (203, N'41_SN_03', 41, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (204, N'41_SN_04', 41, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (205, N'41_SN_05', 41, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (206, N'42_SN_01', 42, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (207, N'42_SN_02', 42, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (208, N'42_SN_03', 42, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (209, N'42_SN_04', 42, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (210, N'42_SN_05', 42, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (211, N'43_SN_01', 43, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (212, N'43_SN_02', 43, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (213, N'43_SN_03', 43, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (214, N'43_SN_04', 43, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (215, N'43_SN_05', 43, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (216, N'44_SN_01', 44, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (217, N'44_SN_02', 44, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (218, N'44_SN_03', 44, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (219, N'44_SN_04', 44, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (220, N'44_SN_05', 44, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (221, N'45_SN_01', 45, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (222, N'45_SN_02', 45, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (223, N'45_SN_03', 45, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (224, N'45_SN_04', 45, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (225, N'45_SN_05', 45, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (226, N'46_SN_01', 46, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (227, N'46_SN_02', 46, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (228, N'46_SN_03', 46, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (229, N'46_SN_04', 46, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (230, N'46_SN_05', 46, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (231, N'47_SN_01', 47, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (232, N'47_SN_02', 47, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (233, N'47_SN_03', 47, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (234, N'47_SN_04', 47, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (235, N'47_SN_05', 47, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (236, N'48_SN_01', 48, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (237, N'48_SN_02', 48, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (238, N'48_SN_03', 48, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (239, N'48_SN_04', 48, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (240, N'48_SN_05', 48, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (241, N'49_SN_01', 49, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (242, N'49_SN_02', 49, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (243, N'49_SN_03', 49, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (244, N'49_SN_04', 49, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (245, N'49_SN_05', 49, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (246, N'50_SN_01', 50, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (247, N'50_SN_02', 50, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (248, N'50_SN_03', 50, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (249, N'50_SN_04', 50, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (250, N'50_SN_05', 50, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (251, N'51_SN_01', 51, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (252, N'51_SN_02', 51, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (253, N'51_SN_03', 51, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (254, N'51_SN_04', 51, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (255, N'51_SN_05', 51, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (256, N'52_SN_01', 52, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (257, N'52_SN_02', 52, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (258, N'52_SN_03', 52, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (259, N'52_SN_04', 52, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (260, N'52_SN_05', 52, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (261, N'53_SN_01', 53, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (262, N'53_SN_02', 53, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (263, N'53_SN_03', 53, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (264, N'53_SN_04', 53, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (265, N'53_SN_05', 53, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (266, N'54_SN_01', 54, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (267, N'54_SN_02', 54, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (268, N'54_SN_03', 54, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (269, N'54_SN_04', 54, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (270, N'54_SN_05', 54, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (271, N'55_SN_01', 55, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (272, N'55_SN_02', 55, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (273, N'55_SN_03', 55, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (274, N'55_SN_04', 55, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (275, N'55_SN_05', 55, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (276, N'56_SN_01', 56, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (277, N'56_SN_02', 56, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (278, N'56_SN_03', 56, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (279, N'56_SN_04', 56, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (280, N'56_SN_05', 56, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (281, N'57_SN_01', 57, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (282, N'57_SN_02', 57, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (283, N'57_SN_03', 57, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (284, N'57_SN_04', 57, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (285, N'57_SN_05', 57, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (286, N'58_SN_01', 58, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (287, N'58_SN_02', 58, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (288, N'58_SN_03', 58, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (289, N'58_SN_04', 58, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (290, N'58_SN_05', 58, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (291, N'59_SN_01', 59, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (292, N'59_SN_02', 59, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (293, N'59_SN_03', 59, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (294, N'59_SN_04', 59, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (295, N'59_SN_05', 59, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (296, N'60_SN_01', 60, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (297, N'60_SN_02', 60, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (298, N'60_SN_03', 60, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (299, N'60_SN_04', 60, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (300, N'60_SN_05', 60, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (301, N'61_SN_01', 61, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (302, N'61_SN_02', 61, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (303, N'61_SN_03', 61, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (304, N'61_SN_04', 61, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (305, N'61_SN_05', 61, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (306, N'62_SN_01', 62, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (307, N'62_SN_02', 62, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (308, N'62_SN_03', 62, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (309, N'62_SN_04', 62, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (310, N'62_SN_05', 62, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (311, N'63_SN_01', 63, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (312, N'63_SN_02', 63, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (313, N'63_SN_03', 63, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (314, N'63_SN_04', 63, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (315, N'63_SN_05', 63, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (316, N'64_SN_01', 64, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (317, N'64_SN_02', 64, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (318, N'64_SN_03', 64, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (319, N'64_SN_04', 64, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (320, N'64_SN_05', 64, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (321, N'65_SN_01', 65, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (322, N'65_SN_02', 65, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (323, N'65_SN_03', 65, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (324, N'65_SN_04', 65, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (325, N'65_SN_05', 65, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (326, N'66_SN_01', 66, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (327, N'66_SN_02', 66, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (328, N'66_SN_03', 66, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (329, N'66_SN_04', 66, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (330, N'66_SN_05', 66, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (331, N'67_SN_01', 67, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (332, N'67_SN_02', 67, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (333, N'67_SN_03', 67, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (334, N'67_SN_04', 67, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (335, N'67_SN_05', 67, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (336, N'68_SN_01', 68, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (337, N'68_SN_02', 68, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (338, N'68_SN_03', 68, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (339, N'68_SN_04', 68, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (340, N'68_SN_05', 68, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (341, N'69_SN_01', 69, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (342, N'69_SN_02', 69, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (343, N'69_SN_03', 69, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (344, N'69_SN_04', 69, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (345, N'69_SN_05', 69, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (346, N'70_SN_01', 70, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (347, N'70_SN_02', 70, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (348, N'70_SN_03', 70, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (349, N'70_SN_04', 70, 1)
GO
INSERT [dbo].[serial_number] ([id], [sn], [product_id], [sn_status]) VALUES (350, N'70_SN_05', 70, 1)
GO
SET IDENTITY_INSERT [dbo].[serial_number] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (1, 1, 15, 1, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (2, 2, 3, 2, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (3, 3, 40, 3, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (4, 4, 5, 4, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (5, 5, 5, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (6, 6, 6, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (7, 7, 6, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (8, 8, 7, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (9, 9, 8, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (10, 10, 9, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (11, 11, 10, 3, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (12, 12, 12, 2, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (13, 13, 13, 3, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (14, 14, 50, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (15, 15, 13, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (16, 16, 23, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (17, 17, 21, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (18, 18, 14, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (19, 19, 31, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (20, 20, 42, 1, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (21, 21, 12, 2, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (22, 22, 22, 3, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (23, 23, 33, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (24, 24, 17, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (25, 25, 18, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (26, 26, 19, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (27, 27, 16, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (28, 28, 30, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (29, 29, 20, 1, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (30, 30, 24, 2, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (31, 31, 25, 3, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (32, 32, 26, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (33, 33, 28, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (34, 34, 29, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (35, 35, 31, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (36, 36, 32, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (37, 37, 33, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (38, 38, 34, 2, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (39, 39, 35, 3, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (40, 40, 36, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (41, 41, 37, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (42, 42, 38, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (43, 43, 39, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (44, 45, 41, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (45, 46, 42, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (46, 47, 43, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (47, 48, 43, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (48, 49, 44, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (49, 50, 45, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (50, 51, 46, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (51, 52, 48, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (52, 53, 47, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (53, 54, 48, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (54, 55, 49, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (55, 56, 10, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (56, 57, 28, 1, 1000)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (57, 58, 27, 2, 1200)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (58, 59, 2, 3, 1300)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (59, 60, 9, 4, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (60, 61, 8, 5, 1400)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (61, 62, 7, 6, 900)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (62, 63, 4, 7, 1500)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (63, 64, 11, 8, 1100)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (64, 65, 1, 9, 1800)
GO
INSERT [dbo].[order_detail] ([id], [serial_number_id], [order_id], [product_id], [price]) VALUES (65, 65, 2, 2, 1200)
GO
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[warranty_record] ON 
GO
INSERT [dbo].[warranty_record] ([id], [order_detail_id], [warranty_date], [reason], [img], [warranty_status], [response], [verified_by], [verified_on]) VALUES (1, 4, CAST(N'2024-04-04' AS Date), N'Manufacturing defect', N'xxx', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[warranty_record] ([id], [order_detail_id], [warranty_date], [reason], [img], [warranty_status], [response], [verified_by], [verified_on]) VALUES (2, 1, CAST(N'2024-01-01' AS Date), N'Defective part', N'xxx', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[warranty_record] ([id], [order_detail_id], [warranty_date], [reason], [img], [warranty_status], [response], [verified_by], [verified_on]) VALUES (3, 2, CAST(N'2024-02-02' AS Date), N'Malfunctioning device', N'xxx', 2, N'Shop Xin Chao', NULL, NULL)
GO
INSERT [dbo].[warranty_record] ([id], [order_detail_id], [warranty_date], [reason], [img], [warranty_status], [response], [verified_by], [verified_on]) VALUES (4, 3, CAST(N'2024-03-03' AS Date), N'Damaged during shipping', N'xxx', 3, N'Shop Sorry', NULL, NULL)
GO
INSERT [dbo].[warranty_record] ([id], [order_detail_id], [warranty_date], [reason], [img], [warranty_status], [response], [verified_by], [verified_on]) VALUES (5, 5, CAST(N'2024-05-05' AS Date), N'Wrong item delivered', N'xxx', 2, N'Dong Y', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[warranty_record] OFF
GO
SET IDENTITY_INSERT [dbo].[news_category] ON 
GO
INSERT [dbo].[news_category] ([id], [name], [status]) VALUES (1, N'About us', 1)
GO
INSERT [dbo].[news_category] ([id], [name], [status]) VALUES (2, N'Store infor', 1)
GO
INSERT [dbo].[news_category] ([id], [name], [status]) VALUES (3, N'New Product', 1)
GO
INSERT [dbo].[news_category] ([id], [name], [status]) VALUES (4, N'SalesOff', 1)
GO
SET IDENTITY_INSERT [dbo].[news_category] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (1, N'Store information', N'Contains email, phone and address', CAST(N'2024-07-27' AS Date), N'Store Address: FPT University<br>Phone: 09130535331<br>Email: linhtkhe180134@fpt.edu.vn', 5, 2, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (2, N'Tech Trend Alert: Laptops with OLED Displays', N'Discover the latest tech trend: laptops with OLED displays. Experience stunning visuals and vibrant colors.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://cdn.tgdd.vn/Files/2021/11/17/1398475/cach-chinh-den-ban-phim-laptop-asus_1280x720-800-resize.jpg" width="953" height="536"></p>
<p>Stay ahead of the curve with the latest <strong>tech trend</strong>: laptops with <strong>OLED displays</strong>. Linh''s Lap is proud to offer a range of laptops featuring this cutting-edge technology, providing you with <strong>stunning visuals</strong> and <strong>vibrant colors</strong>.</p>
<p><strong>Benefits of OLED Displays:</strong></p>
<ul>
<li><strong>Brilliant Colors</strong>: Enjoy a wider color gamut and deeper blacks for a more immersive viewing experience.</li>
<li><strong>Higher Contrast</strong>: OLED displays offer higher contrast ratios, making every detail stand out.</li>
<li><strong>Energy Efficiency</strong>: OLED technology consumes less power, extending your laptop&rsquo;s battery life.</li>
<li><strong>Eye Comfort</strong>: Reduced blue light emission helps minimize eye strain during prolonged use.</li>
</ul>
<p>Whether you&rsquo;re a creative professional who needs accurate color representation, a gamer looking for the best visuals, or a movie enthusiast who wants a cinematic experience, a laptop with an OLED display is the perfect choice. <strong>Explore our selection</strong> of OLED laptops and see the difference for yourself!</p>', 1, 2, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (18, N'Terms and Conditions', N'By using Linh and Associates Store, you agree to our terms. These cover site use, orders, payments, shipping, returns, refunds, and liability. Our terms ensure a fair and safe shopping experience.', CAST(N'2024-07-27' AS Date), N'<h3>Introduction</h3>
<p>Welcome to Linh and Associates Store. By accessing or using our website and services, you agree to comply with and be bound by the following terms and conditions. Please review these terms carefully. If you do not agree to these terms, you should not use our website or services.</p>
<h3>Use of the Site</h3>
<ul>
<li>You must be at least 18 years old to use our site.</li>
<li>You agree to use the site for lawful purposes only.</li>
<li>You must not use the site in any way that may cause damage to the site or impair the availability or accessibility of the site.</li>
</ul>
<h3>Products and Services</h3>
<ul>
<li>All products and services are subject to availability.</li>
<li>We reserve the right to limit quantities of any products or services that we offer.</li>
<li>Prices for our products are subject to change without notice.</li>
</ul>
<h3>Orders and Payments</h3>
<ul>
<li>By placing an order, you agree to provide current, complete, and accurate purchase and account information.</li>
<li>We accept various forms of payment, including credit/debit cards and online payment systems.</li>
<li>All orders are subject to acceptance and availability.</li>
</ul>
<h3>Shipping and Delivery</h3>
<ul>
<li>We offer shipping to various locations. Shipping charges and estimated delivery times are provided at checkout.</li>
<li>Delivery times are estimates and are not guaranteed. We are not responsible for delays caused by shipping carriers or customs.</li>
</ul>
<h3>Returns and Refunds</h3>
<ul>
<li>We offer a return policy for defective or damaged products. Please contact us within 30 days of receipt to initiate a return.</li>
<li>Refunds will be issued to the original payment method.</li>
</ul>
<h3>Limitation of Liability</h3>
<ul>
<li>Linh and Associates Store is not liable for any direct, indirect, incidental, or consequential damages arising from the use of our site or products.</li>
<li>Our total liability to you for any claim arising from the use of our site or products is limited to the amount paid by you for the products.</li>
</ul>
<h3>Governing Law</h3>
<ul>
<li>These terms are governed by and construed in accordance with the laws of [Your State/Country].</li>
</ul>
<h3>Changes to Terms</h3>
<ul>
<li>We reserve the right to modify these terms at any time. Any changes will be effective immediately upon posting on our site.</li>
</ul>', 1, 1, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (3, N'Summer Sale Extravaganza: Up to 50% Off on Select Laptops!', N'Our biggest summer sale is here! Enjoy up to 50% off on select laptops. Hurry, limited stock available!', CAST(N'2024-07-10' AS Date), N'<p><strong><img src="https://vcdn1-english.vnecdn.net/2023/05/01/1-1682956782-1682956800-4576-1682956818.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=VddtdtCqFnvZmwQDh6X09A" alt="" width="680" height="408"></strong></p>
<p><strong>Summer is here</strong>, and so is our biggest sale of the year! At Linh''s Lap, we''re excited to announce our <strong>Summer Sale Extravaganza</strong>, where you can save up to <strong>50% on select laptops</strong>. Whether you''re looking for a powerful gaming laptop, a reliable work laptop, or a sleek and portable device for everyday use, we have something for everyone.</p>
<p><strong>Highlights of the Sale:</strong></p>
<ul>
<li><strong>Up to 50% off</strong> on top brands like Dell, HP, Lenovo, and more.</li>
<li><strong>Exclusive deals</strong> on high-performance gaming laptops.</li>
<li><strong>Free shipping</strong> on all orders during the sale period.</li>
<li><strong>Extended warranty</strong> options available at a discounted rate.</li>
</ul>
<p>This sale is available for a <strong>limited time only</strong>, and stock is running out fast. Don&rsquo;t miss out on these incredible savings. <strong>Shop now</strong> and upgrade your laptop at unbeatable prices!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (4, N' Introducing the Ultra-Slim ZenBook 14', N'Meet the new ZenBook 14, the ultra-slim laptop with powerful performance and sleek design. Perfect for on-the-go professionals.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://ttcenter.com.vn/uploads/product/112xaxho-854-asus-zenbook-14x-oled-q410va-core-i5-13500h-8gb-512gb-14-5-2k-oled-touch-120hz-new.jpg" width="743" height="743"></p>
<p>Linh''s Lap is thrilled to announce the arrival of the <strong>ZenBook 14</strong>, an ultra-slim laptop that combines <strong>powerful performance</strong> with a <strong>sleek design</strong>. This new addition to our lineup is perfect for professionals who are always on the go and need a reliable, stylish laptop.</p>
<p><strong>Key Features:</strong></p>
<ul>
<li><strong>Ultra-Slim Design</strong>: At just 0.6 inches thick, the ZenBook 14 is incredibly portable and easy to carry.</li>
<li><strong>Powerful Performance</strong>: Equipped with the latest Intel Core i7 processor and 16GB of RAM, it handles multitasking with ease.</li>
<li><strong>Long Battery Life</strong>: Enjoy up to 12 hours of battery life, ensuring you stay productive all day.</li>
<li><strong>Stunning Display</strong>: The 14-inch Full HD display with narrow bezels provides a vivid and immersive viewing experience.</li>
</ul>
<p>The ZenBook 14 also comes with a <strong>backlit keyboard</strong>, <strong>fast-charging capabilities</strong>, and <strong>advanced security features</strong> like a fingerprint reader. It&rsquo;s designed to help you work smarter and look good doing it. <strong>Order now</strong> and experience the perfect blend of power and portability!</p>', 1, 3, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (5, N'Unveiling the MacBook Pro M2: Power Meets Precision', N'Discover the new MacBook Pro M2, where power meets precision. Engineered for professionals and creatives.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://techcrunch.com/wp-content/uploads/2022/06/CMC_1384.jpg" width="1010" height="673"></p>
<p>Introducing the&nbsp;<strong>MacBook Pro M2</strong>, the latest powerhouse from Apple that&rsquo;s designed for <strong>professionals and creatives</strong> who demand the best. Available now at Linh''s Lap, the MacBook Pro M2 brings together <strong>power</strong> and <strong>precision</strong> in one sleek package.</p>
<p><strong>Standout Features:</strong></p>
<ul>
<li><strong>M2 Chip</strong>: The next-generation M2 chip offers incredible speed and efficiency, handling even the most demanding tasks with ease.</li>
<li><strong>Liquid Retina XDR Display</strong>: Experience unparalleled clarity and color accuracy with the 14-inch Liquid Retina XDR display.</li>
<li><strong>Extended Battery Life</strong>: With up to 20 hours of battery life, the MacBook Pro M2 keeps you productive for longer.</li>
<li><strong>Enhanced Keyboard and Trackpad</strong>: The Magic Keyboard and Force Touch trackpad provide a comfortable and responsive user experience.</li>
</ul>
<p>Whether you&rsquo;re editing videos, creating music, or developing software, the MacBook Pro M2 delivers the <strong>performance and reliability</strong> you need. It&rsquo;s also packed with advanced features like <strong>ProMotion technology</strong>, <strong>Thunderbolt 4 ports</strong>, and <strong>studio-quality mics</strong>. <strong>Explore the MacBook Pro M2</strong> and take your productivity to the next level</p>', 1, 3, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (6, N'Meet Our Team: The People Behind Linh''s Lap', N'Get to know the dedicated team behind Linh''s Lap. Learn about our expertise, passion, and commitment to customer satisfaction.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/376347582_644177077850943_8721741749055240980_n.jpg?_nc_cat=108&amp;ccb=1-7&amp;_nc_sid=0024fc&amp;_nc_eui2=AeFwvOq8qy2Tka8huYqru0twO26DxP8zJJo7boPE_zMkmuj49qR19ZqoP-YiUhQ5rFuCbwCUfJtCaxQE9-YtltMc&amp;_nc_ohc=NvlthmsC7OUQ7kNvgGybJdY&amp;_nc_ad=z-m&amp;_nc_cid=0&amp;_nc_ht=scontent.xx&amp;oh=03_Q7cD1QGh7MD-O8hTAy8gtnIyHtgwl1A5CNcNslVghSO6BjjnOQ&amp;oe=66B5FF7C" alt="" width="457" height="989"></p>
<p>At Linh''s Lap, we believe that our success is driven by the passion and dedication of our team. We&rsquo;d like to introduce you to the&nbsp;<strong>people behind Linh''s Lap</strong> who work tirelessly to provide you with the best products and services.</p>
<p><strong>Our Team:</strong></p>
<ul>
<li><strong>Linh Nguyen, Founder and CEO</strong>: With a vision to revolutionize the laptop market, Linh started this company with a passion for technology and customer service.</li>
<li><strong>Jane Smith, Chief Technology Officer</strong>: Jane leads our tech team, ensuring that we offer the latest and greatest in laptop technology.</li>
<li><strong>John Doe, Head of Customer Service</strong>: John and his team are dedicated to providing exceptional support and ensuring every customer is satisfied with their purchase.</li>
<li><strong>Emma Johnson, Marketing Director</strong>: Emma&rsquo;s creative strategies and marketing campaigns have helped Linh''s Lap grow and reach a wider audience.</li>
</ul>
<p>Each member of our team brings unique skills and expertise, contributing to our collective goal of delivering <strong>excellence</strong> in everything we do. We&rsquo;re committed to helping you find the perfect laptop and providing ongoing support. <strong>Thank you</strong> for being a part of our journey!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (7, N'Back-to-School Discounts: Get Ready for the New School Year!', N'Prepare for the new school year with our back-to-school discounts. Save on laptops perfect for students.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://bizweb.dktcdn.net/100/329/122/files/laptop-back-to-school-bannerblog-800x400px-923a9132-522f-4628-b660-986b1a6c4ad8.jpg?v=1689406618677" alt="" width="800" height="400"></p>
<p>The new school year is just around the corner, and Linh''s Lap has you covered with our&nbsp;<strong>Back-to-School Discounts</strong>. We know how important it is to have a reliable laptop for your studies, so we&rsquo;re offering <strong>special discounts</strong> on laptops that are perfect for students of all ages.</p>
<p><strong>What You&rsquo;ll Find:</strong></p>
<ul>
<li><strong>Student-friendly laptops</strong> starting at just $299.</li>
<li><strong>Special bundles</strong> that include accessories like backpacks, mice, and software.</li>
<li><strong>Discounted prices</strong> on lightweight and portable models, perfect for carrying between classes.</li>
<li><strong>Free tech support</strong> for all student purchases to help you get set up and ready to go.</li>
</ul>
<p>Take advantage of these discounts and ensure you&rsquo;re ready for success in the upcoming school year. <strong>Shop now</strong> to get the best deals on laptops designed for students!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (8, N'Flash Sale Alert: 24-Hour Deals on Top Laptops!', N'Don’t miss our 24-hour flash sale on top laptops. Exclusive deals available for a limited time only!', CAST(N'2024-07-10' AS Date), N'<p><img src="https://file.hstatic.net/200000782117/file/flash_sale_16-6.2_2x_1fe8ab1ef0de4985a7ab6f574e767667.png" alt="" width="1038" height="389"></p>
<p>Attention shoppers! Linh''s Lap is thrilled to announce a&nbsp;<strong>24-Hour Flash Sale</strong> featuring unbeatable deals on top laptops. For just one day, you can snag <strong>exclusive discounts</strong> on some of our best-selling models.</p>
<p><strong>Flash Sale Highlights:</strong></p>
<ul>
<li><strong>Limited-time discounts</strong> on high-end gaming laptops, perfect for gamers who want the best performance.</li>
<li><strong>Big savings</strong> on ultra-portable laptops for professionals on the go.</li>
<li><strong>Special offers</strong> on laptops with the latest Intel and AMD processors.</li>
<li><strong>Extra discounts</strong> on accessories when you purchase a laptop during the flash sale.</li>
</ul>
<p>This is a <strong>one-time opportunity</strong> to save big on the laptops you&rsquo;ve been eyeing. Set your alarms and get ready to shop because these deals will be gone in a flash. <strong>Shop now</strong> and don&rsquo;t miss out on these incredible savings!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (9, N'Hot Deal: Free Accessories with Every Laptop Purchase!', N'For a limited time, get free accessories with every laptop purchase. Elevate your experience with these exclusive add-ons.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://i.ytimg.com/vi/1dMTyOKSWG4/maxresdefault.jpg" width="981" height="552"></p>
<p>Linh''s Lap is turning up the heat with our <strong>Hot Deal</strong> of the month! For a limited time, we&rsquo;re offering <strong>free accessories</strong> with every laptop purchase. This is your chance to elevate your laptop experience with exclusive add-ons at no extra cost.</p>
<p><strong>What You&rsquo;ll Get:</strong></p>
<ul>
<li><strong>Free Wireless Mouse</strong>: Enhance your productivity with a high-quality wireless mouse.</li>
<li><strong>Free Laptop Sleeve</strong>: Protect your laptop with a stylish and durable sleeve.</li>
<li><strong>Free USB Hub</strong>: Expand your connectivity options with a multi-port USB hub.</li>
<li><strong>Free Headphones</strong>: Enjoy crystal-clear audio with premium headphones.</li>
</ul>
<p>These accessories are designed to complement your new laptop and provide you with everything you need for work, study, or play. This <strong>hot deal</strong> won&rsquo;t last long, so <strong>shop now</strong> and take advantage of this incredible offer!</p>', 1, 2, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (10, N'The All-New Surface Laptop 5: Versatility Redefined', N'Introducing the Surface Laptop 5, the all-new versatile device that adapts to your needs. Available now at Linh''s Lap.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://surfacecity.vn/wp-content/uploads/sf-laptop-5-1.jpg" width="1002" height="601"></p>
<p>Meet the&nbsp;<strong>Surface Laptop 5</strong>, the latest addition to Microsoft&rsquo;s Surface lineup, now available at Linh''s Lap. The Surface Laptop 5 redefines versatility with its innovative design and powerful features, making it the perfect device for <strong>work, study, and play</strong>.</p>
<p><strong>Top Features:</strong></p>
<ul>
<li><strong>Adaptive Design</strong>: The Surface Laptop 5 features a 360-degree hinge, allowing you to switch between laptop, tablet, tent, and studio modes.</li>
<li><strong>Performance Powerhouse</strong>: Powered by the latest Intel Core i7 processor and up to 32GB of RAM, it handles multitasking and intensive applications with ease.</li>
<li><strong>PixelSense Touchscreen</strong>: The 13.5-inch PixelSense touchscreen provides a responsive and immersive experience, perfect for drawing, writing, and browsing.</li>
<li><strong>All-Day Battery Life</strong>: With up to 17 hours of battery life, the Surface Laptop 5 keeps you productive from morning to night.</li>
</ul>
<p>The Surface Laptop 5 also includes <strong>Windows Hello</strong> for secure sign-in, <strong>Dolby Atmos speakers</strong> for superior sound, and <strong>USB-C and Thunderbolt 4</strong> ports for versatile connectivity. It&rsquo;s the ultimate device for those who need a laptop that adapts to their lifestyle. <strong>Check it out now</strong> and see how the Surface Laptop 5 can elevate your daily routine!</p>', 1, 3, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (11, N'Celebrating Our 10th Anniversary: A Decade of Excellence', N'Linh''s Lap celebrates its 10th anniversary. Join us as we reflect on a decade of excellence and innovation in laptop sales.', CAST(N'2024-07-10' AS Date), N'<p><strong><img src="https://img.freepik.com/free-vector/gradient-10th-anniversary-birthday-card_52683-81652.jpg" width="923" height="615"></strong></p>
<p><strong>Linh''s Lap</strong> is proud to celebrate its <strong>10th anniversary</strong> this year! Over the past decade, we have grown from a small startup into a leading retailer in the laptop market, thanks to our commitment to <strong>excellence and innovation</strong>.</p>
<p><strong>Our Journey:</strong></p>
<ul>
<li><strong>Humble Beginnings</strong>: Founded in 2014, Linh''s Lap started with a mission to provide high-quality laptops at affordable prices.</li>
<li><strong>Customer-Centric Approach</strong>: Our focus has always been on meeting our customers'' needs and exceeding their expectations.</li>
<li><strong>Innovative Solutions</strong>: We&rsquo;ve introduced cutting-edge technologies and a wide range of products to cater to diverse customer preferences.</li>
<li><strong>Community Engagement</strong>: We&rsquo;ve actively participated in community initiatives and supported educational programs.</li>
</ul>
<p>As we celebrate this milestone, we want to thank our loyal customers for their support and trust over the years. We&rsquo;re excited about the future and committed to continuing our tradition of providing <strong>top-notch laptops and exceptional service</strong>. Stay tuned for special anniversary deals and events throughout the year!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (12, N'Our Commitment to Sustainability: Green Initiatives at Linh''s Lap', N'Learn about Linh''s Lap''s commitment to sustainability. Discover our green initiatives and how we''re making a positive impact.', CAST(N'2024-07-10' AS Date), N'<p><img src="https://img.freepik.com/premium-photo/promoting-ewaste-management-laptop-with-prominent-green-recycle-symbol-concept-ewaste-management-green-technology-recycling-initiatives-sustainable-practices_918839-37921.jpg" width="988" height="494"></p>
<p>At Linh''s Lap, we believe in the importance of&nbsp;<strong>sustainability</strong> and are committed to reducing our environmental impact. Our <strong>green initiatives</strong> reflect our dedication to creating a better future for our planet.</p>
<p><strong>Sustainability Efforts:</strong></p>
<ul>
<li><strong>Eco-Friendly Products</strong>: We offer a range of laptops made from recycled materials and designed for energy efficiency.</li>
<li><strong>Responsible Packaging</strong>: Our packaging materials are recyclable and biodegradable, minimizing waste.</li>
<li><strong>E-Waste Recycling</strong>: We provide e-waste recycling services to help customers dispose of old electronics responsibly.</li>
<li><strong>Energy Conservation</strong>: Our facilities are equipped with energy-efficient lighting and climate control systems.</li>
</ul>
<p>We also support environmental organizations and participate in community clean-up events. By choosing Linh''s Lap, you&rsquo;re not only getting a high-quality laptop but also supporting a company that cares about the environment. Join us in our journey towards a <strong>greener and more sustainable future</strong>!</p>', 1, 4, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (13, N'About us ', N'Short Description about Us', CAST(N'2024-07-27' AS Date), N'<h2>About Us</h2>
<p>Welcome to <strong>Linh and Associates Store</strong>!</p>
<p>At Linh and Associates Store, we pride ourselves on being a trusted source for all your computer and technology needs. Founded with a passion for innovation and a commitment to quality, our store has become a premier destination for customers looking for the latest in technology, excellent customer service, and unbeatable prices.</p>
<h3>Our Mission</h3>
<p>Our mission is simple: to provide our customers with the best technology products and services available. We strive to make technology accessible and easy to understand, ensuring that every customer leaves our store with the perfect solution for their needs.</p>
<h3>Our Products</h3>
<p>We offer a wide range of products from the industry''s leading brands, including:</p>
<ul>
<li><strong>Laptops and Desktops</strong>: From powerful gaming rigs to versatile workstations, we have a computer for every need and budget.</li>
<li><strong>Components and Accessories</strong>: Upgrade your system with top-quality components, or find the perfect accessories to enhance your computing experience.</li>
<li><strong>Software Solutions</strong>: Discover the latest software to boost productivity, enhance security, and unleash your creativity.</li>
<li><strong>Gadgets and Peripherals</strong>: Explore our selection of gadgets, from cutting-edge VR headsets to the latest in smart home technology.</li>
</ul>
<h3>Our Services</h3>
<p>At Linh and Associates Store, we go beyond just selling products. We offer a range of services to ensure you get the most out of your technology:</p>
<ul>
<li><strong>Technical Support</strong>: Our expert technicians are always ready to assist with troubleshooting, repairs, and upgrades.</li>
<li><strong>Custom Builds</strong>: Let us help you build your dream PC with our custom build service. Choose your components, and we''ll handle the rest.</li>
<li><strong>Consultation Services</strong>: Need help choosing the right products for your needs? Our knowledgeable staff is here to provide personalized recommendations and advice.</li>
</ul>
<h3>Why Choose Us?</h3>
<ul>
<li><strong>Expert Staff</strong>: Our team is passionate about technology and dedicated to helping you find the perfect solutions.</li>
<li><strong>Competitive Prices</strong>: We offer competitive pricing on all our products, ensuring you get the best value for your money.</li>
<li><strong>Customer Satisfaction</strong>: Your satisfaction is our top priority. We stand behind our products and services, and we''re committed to ensuring you''re happy with your purchase.</li>
</ul>
<h3>Contact Us</h3>
<p>We invite you to visit our store and experience the Linh and Associates difference. Whether you''re a tech enthusiast, a business professional, or someone looking to upgrade their home office, we''re here to help.</p>
<p><strong>Linh and Associates Store</strong></p>
<p>FPT University<br>Phone:&nbsp; 0369.788.699<br>Email: vinhdtqhe180173@gmail.com</p>
<p>Thank you for choosing Linh and Associates Store. We look forward to serving you!</p>', 1, 1, 1)
GO
INSERT [dbo].[news] ([id], [title], [short_description], [create_date], [news_detail], [author], [news_category_id], [status]) VALUES (31, N'Privacy Policy', N'We respect your privacy. We use your data to process orders, improve services, and communicate with you. Your information is never shared without consent, except as required by law.', CAST(N'2024-07-27' AS Date), N'At Linh and Associates Store, we respect your privacy and are committed to protecting your personal information. Our privacy policy outlines how we collect, use, and secure your data. We use your information to process orders, improve our services, and communicate with you. Your information is never shared without your consent, except as required by law.', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[product_image] ON 
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (1, 1, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (2, 2, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (3, 3, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (4, 4, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (5, 5, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (6, 6, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (7, 7, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (8, 8, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (9, 9, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (10, 10, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (11, 11, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (12, 12, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (13, 13, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (14, 14, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (15, 15, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (16, 16, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (17, 17, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (18, 18, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (19, 19, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (20, 20, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (21, 21, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (22, 22, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (23, 23, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (24, 24, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (25, 25, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (26, 26, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (27, 27, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (28, 28, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (29, 29, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (30, 30, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (31, 31, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (32, 32, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (33, 33, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (34, 34, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (35, 35, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (36, 36, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (37, 37, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (38, 38, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (39, 39, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (40, 40, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (41, 41, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (42, 42, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (43, 43, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (44, 44, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (45, 45, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (46, 46, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (47, 47, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (48, 48, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (49, 49, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (50, 50, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (51, 51, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (52, 52, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (53, 53, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (54, 54, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (55, 55, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (56, 56, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (57, 57, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (58, 58, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (59, 59, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (60, 60, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (61, 61, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (62, 62, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (63, 63, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (64, 64, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (65, 65, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (66, 66, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (67, 67, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (68, 68, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (69, 69, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (70, 70, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (71, 71, N'latop_sample.png')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (72, 1, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (73, 2, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (74, 3, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (75, 4, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (76, 5, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (77, 6, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (78, 7, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (79, 8, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (80, 9, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (81, 10, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (82, 11, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (83, 12, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (84, 13, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (85, 14, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (86, 15, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (87, 16, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (88, 17, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (89, 18, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (90, 19, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (91, 20, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (92, 21, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (93, 22, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (94, 23, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (95, 24, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (96, 25, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (97, 26, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (98, 27, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (99, 28, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (100, 29, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (101, 30, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (102, 31, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (103, 32, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (104, 33, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (105, 34, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (106, 35, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (107, 36, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (108, 37, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (109, 38, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (110, 39, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (111, 40, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (112, 41, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (113, 42, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (114, 43, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (115, 44, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (116, 45, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (117, 46, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (118, 47, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (119, 48, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (120, 49, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (121, 50, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (122, 51, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (123, 52, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (124, 53, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (125, 54, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (126, 55, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (127, 56, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (128, 57, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (129, 58, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (130, 59, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (131, 60, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (132, 61, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (133, 62, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (134, 63, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (135, 64, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (136, 65, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (137, 66, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (138, 67, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (139, 68, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (140, 69, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (141, 70, N'laptop_sample_2.jpg')
GO
INSERT [dbo].[product_image] ([id], [product_id], [img]) VALUES (142, 71, N'laptop_sample_2.jpg')
GO
SET IDENTITY_INSERT [dbo].[product_image] OFF
GO
SET IDENTITY_INSERT [dbo].[rate] ON 
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (1, 1, 2, N'?óng gói kiểu gì móp c�?máy, rất không hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (2, 2, 3, N'Sản phẩm ok.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (3, 3, 5, N'Sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (4, 4, 4, N'?óng gói cẩn thận, sản phẩm chất lượng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (5, 5, 5, N'Giao hàng nhanh, sản phẩm tuyệt v�?i.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (6, 2, 3, N'Sản phẩm tạm được, giá hơi cao.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (7, 3, 4, N'Hàng đúng mô t�? s�?dụng tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (8, 1, 5, N'Rất hài lòng, sản phẩm chất lượng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (9, 3, 2, N'Giao hàng chậm, đóng gói không cẩn thận.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (10, 5, 4, N'Sản phẩm tốt, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (11, 1, 3, N'Chất lượng ổn, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (12, 2, 5, N'?óng gói đẹp, sản phẩm tuyệt v�?i.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (13, 3, 4, N'Sản phẩm đúng mô t�? dùng ổn.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (14, 4, 2, N'Hàng b�?móp méo, không hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (15, 5, 5, N'Tuyệt v�?i, sản phẩm như mong đợi.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (16, 4, 4, N'Chất lượng ổn, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (17, 4, 3, N'Sản phẩm tạm ổn, giá hơi cao.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (18, 2, 5, N'Giao hàng nhanh, sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (19, 1, 4, N'Sản phẩm đúng như quảng cáo.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (20, 2, 2, N'Không hài lòng với chất lượng sản phẩm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (21, 1, 5, N'Rất tốt, s�?mua thêm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (22, 2, 4, N'Chất lượng khá, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (23, 3, 3, N'Sản phẩm trung bình, giao hàng chậm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (24, 4, 5, N'Hoàn toàn hài lòng, sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (25, 5, 4, N'Giao hàng nhanh, chất lượng tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (26, 5, 2, N'Sản phẩm b�?lỗi, không hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (27, 5, 5, N'Tuyệt v�?i, sản phẩm chất lượng cao.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (28, 1, 3, N'Sản phẩm ổn, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (29, 4, 4, N'?óng gói k�? sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (30, 3, 5, N'Sản phẩm rất tốt, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (31, 31, 3, N'Chất lượng bình thường, giá cao.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (32, 32, 4, N'Sản phẩm tốt, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (33, 33, 2, N'Không hài lòng, hàng b�?móp.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (34, 34, 5, N'Rất hài lòng, sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (35, 35, 4, N'Sản phẩm tốt, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (36, 36, 3, N'Chất lượng ổn, giao hàng chậm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (37, 37, 5, N'Tuyệt vời, sẽ mua thêm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (38, 38, 4, N'Sản phẩm chất lượng, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (39, 39, 2, N'Hàng bể hư hỏng, không hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (40, 40, 5, N'Sản phẩm rất tốt, s�?mua thêm.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (41, 41, 4, N'Đóng gói chất lượng tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (42, 42, 3, N'Sản phẩm ổn, giá cao.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (43, 43, 5, N'Rất tốt, giao hàng nhanh.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (44, 44, 4, N'Sản phẩm chất lượng, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (45, 45, 2, N'Hàng bể lỗi, rất không hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (46, 46, 5, N'Tuyệt vời, sản phẩm đáng mua.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (47, 47, 3, N'Sản phẩm trung bình, giá hợp lý.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (48, 48, 4, N'Giao hàng nhanh, sản phẩm tốt.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (49, 49, 5, N'Sản phẩm tốt, rất hài lòng.', 1)
GO
INSERT [dbo].[rate] ([id], [order_detail_id], [star_rate], [feedback], [status]) VALUES (50, 50, 2, N'Chất lượng không tốt, không hài lòng.', 1)
GO
SET IDENTITY_INSERT [dbo].[rate] OFF
GO
