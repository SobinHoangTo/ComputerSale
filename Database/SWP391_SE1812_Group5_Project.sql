USE SWP391_SE1812_Group5_Project
GO

USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP391_SE1812_Group5_Project')
BEGIN
	ALTER DATABASE SWP391_SE1812_Group5_Project SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE SWP391_SE1812_Group5_Project SET ONLINE;
	DROP DATABASE SWP391_SE1812_Group5_Project;
END

GO
CREATE DATABASE SWP391_SE1812_Group5_Project
GO


USE SWP391_SE1812_Group5_Project
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2
create table customer(
	id int identity(1,1) NOT NULL primary key,
	username varchar(50),
	password varchar(50),
	email varchar(100) NOT NULL,
	phone varchar(20) NOT NULL,
	address nvarchar(100) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	img varchar(100) default 'profile.jpg' NOT NULL,
	reg_date date NOT NULL
)
create table employee(
	id int identity(1,1) NOT NULL primary key,
	username varchar(50),
	password varchar(50),
	email varchar(100) NOT NULL,
	phone varchar(20) NOT NULL,
	address nvarchar(100) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	img varchar(100) default 'profile.jpg' NOT NULL,
	role_id int NOT NULL,
	reg_date date NOT NULL,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table category(
	id int identity(1,1) NOT NULL primary key,
	name nvarchar(255) NOT NULL,
	created_by int NOT NULL references employee(id),
	created_on date NOT NULL,
	modified_by int references employee(id),
	modified_on date,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table brand(
	id int identity(1,1) NOT NULL primary key,
	name nvarchar(255) NOT NULL,
	logo varchar(100) NOT NULL,
	link varchar(100) NOT NULL,
	created_by int NOT NULL references employee(id),
	created_on date NOT NULL,
	modified_by int references employee(id),
	modified_on date,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table product(
	id int identity(1,1) NOT NULL primary key,
	name nvarchar(255) NOT NULL,
	CPU varchar(100) NOT NULL,
	GPU varchar(100) NOT NULL,
	RAM varchar(100) NOT NULL,
	ROM varchar(100) NOT NULL,
	monitor varchar(100) NOT NULL,
	OS varchar(100) NOT NULL,
	price int NOT NULL,
	[description] ntext NOT NULL,
	brand_id int NOT NULL references brand(id),
	quantity int NOT NULL,
	representImage varchar(100) NOT NULL,
	category_id int NOT NULL references category(id),
	created_by int NOT NULL references employee(id),
	created_on date NOT NULL,
	modified_by int references employee(id),
	modified_on date,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table product_image(
	id int identity(1,1) NOT NULL primary key,
	product_id int NOT NULL references product(id),
	img varchar(100) NOT NULL
)
create table discount(
	id int identity(1,1) NOT NULL primary key,
	product_id int NOT NULL references product(id),
	quantity int NOT NULL,
	value tinyint NOT NULL,
	start_date date NOT NULL,
	exp_date date NOT NULL,
	created_by int NOT NULL references employee(id),
	[status] tinyint DEFAULT 1 NOT NULL
)
create table serial_number(
	id int identity(1,1) NOT NULL primary key,
	sn varchar(100) NOT NULL,
	product_id int NOT NULL references product(id),
	sn_status tinyint NOT NULL
)
create table [order](
	id int identity(1,1) NOT NULL primary key,
	customer_id int NOT NULL references customer(id),
	note nvarchar(255),
	[address] nvarchar(255) NOT NULL,
	phone varchar(20),
	order_date date NOT NULL,
	paid_date date,
	order_status tinyint NOT NULL,
	verified_by int references employee(id),
	verified_on date
)
create table order_detail(
	id int identity(1,1) NOT NULL primary key,
	serial_number_id INT NOT NULL REFERENCES serial_number(id),	
	order_id int NOT NULL references [order](id),
	product_id int NOT NULL references [product](id),
	price int NOT NULL
)
create table rate(
	id int identity(1,1) NOT NULL primary key,
	order_detail_id int references order_detail(id),
	star_rate tinyint NOT NULL,
	feedback nvarchar(255) NOT NULL,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table warranty_record(
	id int identity(1,1) NOT NULL primary key,
	order_detail_id int NOT NULL references order_detail(id),
	warranty_date date NOT NULL,
	reason nvarchar(255) NOT NULL,
	img varchar(255),
	warranty_status tinyint NOT NULL,
	response nvarchar(255),
	verified_by int references employee(id),
	verified_on date
)
create table news_category(
	id int identity(1,1) NOT NULL primary key,
	[name] varchar(100) NOT NULL,
	[status] tinyint DEFAULT 1 NOT NULL
)
create table news(
	id int identity(1,1) NOT NULL,
	title nvarchar(100) NOT NULL,
	short_description nvarchar(255) NOT NULL,
	create_date date NOT NULL,
	news_detail NVARCHAR(MAX) NOT NULL,
	author int NOT NULL references employee(id),
	news_category_id int NOT NULL references news_category(id),
	[status] tinyint DEFAULT 1 NOT NULL
);

GO
SET IDENTITY_INSERT [dbo].[news] OFF