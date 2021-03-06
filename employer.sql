USE [EmployerAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28-03-2022 08:29:42 ******/
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
/****** Object:  Table [dbo].[Employer]    Script Date: 28-03-2022 08:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[OrganizationType] [nvarchar](50) NOT NULL,
	[CompanyEmail] [nvarchar](450) NOT NULL,
	[CompanyPhone] [nvarchar](max) NOT NULL,
	[NoOfEmployees] [int] NOT NULL,
	[StartYear] [datetime2](7) NOT NULL,
	[About] [nvarchar](200) NOT NULL,
	[CreatedBy] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacancyDetails]    Script Date: 28-03-2022 08:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacancyDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublishedBy] [nvarchar](50) NOT NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[NoOfVacancies] [int] NOT NULL,
	[MinimumQualification] [nvarchar](50) NOT NULL,
	[JobDescription] [nvarchar](200) NOT NULL,
	[LastDate] [datetime2](7) NOT NULL,
	[ExperienceRequired] [int] NOT NULL,
	[MinSalary] [decimal](18, 2) NOT NULL,
	[MaxSalary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_VacancyDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSubmittedVacancies]    Script Date: 28-03-2022 08:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllSubmittedVacancies] @Org nvarchar(100)
AS
SELECT * FROM VacancyDetails WHERE PublishedBy = @Org
GO
