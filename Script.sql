USE [MedTest]
GO
/****** Object:  User [Admin]    Script Date: 11.12.2023 21:54:13 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Doctor]    Script Date: 11.12.2023 21:54:13 ******/
CREATE USER [Doctor] FOR LOGIN [Doctor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EmpOfReg]    Script Date: 11.12.2023 21:54:13 ******/
CREATE USER [EmpOfReg] FOR LOGIN [EmpOfReg] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Doctors]    Script Date: 11.12.2023 21:54:13 ******/
CREATE SCHEMA [Doctors]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Specification] [nvarchar](50) NOT NULL,
	[Otdel] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeOfRegistration]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeOfRegistration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
 CONSTRAINT [PK_EmployeeOfReg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[DateRecive] [datetime] NOT NULL,
	[History] [nvarchar](50) NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[Birthday] [datetime] NOT NULL,
 CONSTRAINT [PK_Information] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacients]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacients](
	[ID] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
 CONSTRAINT [PK_Pacients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.12.2023 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (1, N'Абаев А.В.', N'Стоматолог', N'Стоматология', CAST(N'1971-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (2, N'Исламов Б.Г.', N'Хирург', N'Хирургия', CAST(N'1972-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (4, N'Русанов П.В.', N'Лор', N'Лор отдел', CAST(N'1973-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (5, N'Никитин Л.Г.', N'Офтальмолог', N'Офтальмологическое', CAST(N'1974-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (6, N'Леонидов С.К.', N'Невролог', N'Неврологическое', CAST(N'1975-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (7, N'Ерёмин Д.Д.', N'Потологоанатом', N'Морг', CAST(N'1976-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (8, N'Сашко Л.Н.', N'Глав Врач', N'Управление', CAST(N'1965-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (9, N'Николаева Л.Г.', N'Старшая Мед сестра', N'Обслуживающий', CAST(N'1963-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Doctors] ([ID], [FIO], [Specification], [Otdel], [Birthday]) VALUES (10, N'Петрова Н.А.', N'Нейрохирург', N'Нейрохирургия', CAST(N'1971-10-28T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeOfRegistration] ON 

INSERT [dbo].[EmployeeOfRegistration] ([ID], [FIO], [Birthday]) VALUES (1, N'Петрова А.А.', CAST(N'2000-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[EmployeeOfRegistration] ([ID], [FIO], [Birthday]) VALUES (3, N'Сидорова Н.Л.', CAST(N'1998-12-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeeOfRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[Information] ON 

INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (1, N'Абаев А.В.', 1, CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'Опухоль', N'В процессе', CAST(N'2000-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (5, N'Дмитров Н.А.', 1, CAST(N'2023-12-11T00:00:00.000' AS DateTime), N'ОРВ', N'В процесе ', CAST(N'1999-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (6, N'Лебедев Л.А.', 1, CAST(N'2023-12-10T00:00:00.000' AS DateTime), N'ОРЗ', N'В процесе ', CAST(N'1998-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (11, N'Ложкин А.А.', 1, CAST(N'2023-12-09T00:00:00.000' AS DateTime), N'Перелом локтя', N'В процесе ', CAST(N'1997-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (14, N'Абдулин М.М.', 1, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Перелом руки', N'В процесе ', CAST(N'1995-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (15, N'Рахметова С.С.', 2, CAST(N'2023-12-05T00:00:00.000' AS DateTime), N'Справка о здоровье', N'Выписан   ', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Information] ([ID], [FIO], [Gender], [DateRecive], [History], [Status], [Birthday]) VALUES (19, N'Канаева В.Л.', 1, CAST(N'2023-12-22T00:00:00.000' AS DateTime), N'Насморк', N'Выписан   ', CAST(N'1985-11-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Information] OFF
GO
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (1, N'Абаев А.В.', CAST(N'1999-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (2, N'Сидоров Д.П.', CAST(N'1999-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (3, N'Алёхин Д.Б.', CAST(N'1998-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (4, N'Анисимов А.А.', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (5, N'Дмитров Н.А.', CAST(N'2001-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (6, N'Лебедев Л.А.', CAST(N'2001-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (11, N'Ложкин А.А.', CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (14, N'Абдулин М.М.', CAST(N'1995-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (15, N'Рахметова С.С.', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Pacients] ([ID], [FIO], [Birthday]) VALUES (17, N'Канаева В.Л.', CAST(N'1999-04-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Role] ([ID], [Title]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Title]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [RoleID]) VALUES (1, N'e3afed0047b08059d0fada10f400c1e5', N'698d51a19d8a121ce581499d7b701668', 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [RoleID]) VALUES (2, N'8f9bfe9d1345237cb3b2b205864da075', N'bcbe3365e6ac95ea2c0343a2395834dd', 2)
INSERT [dbo].[User] ([ID], [Login], [Password], [RoleID]) VALUES (3, N'0a914ca359365c263653767e97d07ca2', N'81dc9bdb52d04dc20036dbd8313ed055', 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [RoleID]) VALUES (4, N'2d9807ee3a8772feb978c19494fa3b66', N'bcbe3365e6ac95ea2c0343a2395834dd', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
