USE [JobSeekerAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualifications]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[QualificationName] [nvarchar](50) NOT NULL,
	[University] [nvarchar](50) NOT NULL,
	[YearOfCompletion] [datetime2](7) NOT NULL,
	[GradeOrScore] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Qualifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserExperiences]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExperiences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[StartYear] [datetime2](7) NOT NULL,
	[EndYear] [datetime2](7) NOT NULL,
	[ComapanyUrl] [nvarchar](100) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[JobDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserExperiences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[TotalExperience] [int] NOT NULL,
	[ExpectedSalary] [decimal](18, 2) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVacancyRequests]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVacancyRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VacancyId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AppliedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserVacancyRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllexperienceOfUser]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllexperienceOfUser] @userId int
AS
SELECT * from UserExperiences where UserExperiences.UserId=@userId
GO
/****** Object:  StoredProcedure [dbo].[SelectAllQualificationOfUser]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllQualificationOfUser] @userId int
AS
SELECT * from Qualifications where Qualifications.UserId=@userId
GO
/****** Object:  StoredProcedure [dbo].[SelectAllUsersforparticularVacancy]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllUsersforparticularVacancy] @vacId int
AS
select * from Users left join UserVacancyRequests on Users.Id=UserVacancyRequests.UserId where UserVacancyRequests.VacancyId=@vacId
GO
/****** Object:  StoredProcedure [dbo].[SelectAllVacancyId]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[SelectAllVacancyId] @userid int
AS
SELECT VacancyId FROM UserVacancyRequests WHERE UserId = @userid
GO
/****** Object:  StoredProcedure [dbo].[SelectJobseekerapplied]    Script Date: 28-03-2022 08:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectJobseekerapplied] @vacId int
AS


select Users.Id,Users.FirstName,Users.LastName,Users.Email,Users.Phone,Users.Address,Users.TotalExperience,Users.ExpectedSalary,Users.DateOfBirth from Users,UserVacancyRequests where Users.Id=UserVacancyRequests.UserId and UserVacancyRequests.VacancyId=@vacId
GO
