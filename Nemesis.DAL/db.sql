USE [master]
GO
/****** Object:  Database [Recomendapp]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE DATABASE [Recomendapp] ON  PRIMARY 
( NAME = N'Recomendapp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Recomendapp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Recomendapp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Recomendapp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Recomendapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Recomendapp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Recomendapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Recomendapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Recomendapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Recomendapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [Recomendapp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Recomendapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Recomendapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Recomendapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Recomendapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Recomendapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Recomendapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Recomendapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Recomendapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Recomendapp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Recomendapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Recomendapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Recomendapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Recomendapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Recomendapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Recomendapp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Recomendapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Recomendapp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Recomendapp] SET  MULTI_USER 
GO
ALTER DATABASE [Recomendapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Recomendapp] SET DB_CHAINING OFF 
GO
USE [Recomendapp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/3/2019 3:59:29 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[PlayerId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divisions](
	[DivisionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Promotions] [int] NOT NULL,
	[Relegations] [int] NOT NULL,
	[TournamentId] [int] NULL,
 CONSTRAINT [PK_Divisions] PRIMARY KEY CLUSTERED 
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instances]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instances](
	[InstanceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DivisionId] [int] NULL,
 CONSTRAINT [PK_Instances] PRIMARY KEY CLUSTERED 
(
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[MatchId] [int] IDENTITY(1,1) NOT NULL,
	[Review1ReviewId] [int] NULL,
	[Review2ReviewId] [int] NULL,
	[GenreId] [int] NULL,
	[DateTimeStart] [datetime2](7) NOT NULL,
	[DateTimeEnd] [datetime2](7) NOT NULL,
	[InstanceId] [int] NULL,
	[Fecha] [int] NOT NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Director] [nvarchar](max) NULL,
	[Duration] [nvarchar](max) NULL,
	[Genre] [nvarchar](max) NULL,
	[ImdbRating] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Plot] [nvarchar](max) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerInstance]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerInstance](
	[PlayerId] [int] NOT NULL,
	[InstanceId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerInstance] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC,
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[MovieId] [int] NULL,
	[ReviewerPlayerId] [int] NULL,
	[RecommendedByPlayerId] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 25/3/2019 3:59:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[TournamentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[TournamentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'2.0.1-rtm-125')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181011165742_InitialCreate', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181011184443_DBCreation', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181011184822_DBUpdate', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181011185548_DBUpdate2', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181011190211_DBUpdate3', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181105113936_5_11', N'2.1.4-rtm-31024')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PlayerId]) VALUES (N'd0031006-2b78-4e3e-93e4-c019fb976cf7', 0, N'bc600a65-1768-4eae-8e98-c2002ac64970', N'germanstark@hotmail.com', 0, 1, NULL, N'GERMANSTARK@HOTMAIL.COM', N'GERMANSTARK@HOTMAIL.COM', N'AQAAAAEAACcQAAAAENWudUC0ObWdTmtYVwY4eIoS5XUM1t++lyGy2WjUzPOCOxe/8iH/Kiu9YO7/61wcqg==', NULL, 0, N'f80d5976-f160-425c-9135-c026da49a33f', 0, N'germanstark@hotmail.com', 5)
SET IDENTITY_INSERT [dbo].[Divisions] ON 

INSERT [dbo].[Divisions] ([DivisionId], [Name], [Promotions], [Relegations], [TournamentId]) VALUES (1, N'A', 0, 3, 1)
INSERT [dbo].[Divisions] ([DivisionId], [Name], [Promotions], [Relegations], [TournamentId]) VALUES (2, N'B', 3, 0, 1)
SET IDENTITY_INSERT [dbo].[Divisions] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (1, N'Animacion')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (2, N'Suspenso/Terror')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (3, N'Accion/Ciencia Ficcion')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (4, N'Libre')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (5, N'Romantico/Musical')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (6, N'Extranjera')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (7, N'Drama/Documental')
INSERT [dbo].[Genres] ([GenreId], [Name]) VALUES (8, N'Comedia')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Instances] ON 

INSERT [dbo].[Instances] ([InstanceId], [Name], [DivisionId]) VALUES (1, N'2B', 1)
INSERT [dbo].[Instances] ([InstanceId], [Name], [DivisionId]) VALUES (2, N'3A', 1)
INSERT [dbo].[Instances] ([InstanceId], [Name], [DivisionId]) VALUES (3, N'3B', 1)
SET IDENTITY_INSERT [dbo].[Instances] OFF
SET IDENTITY_INSERT [dbo].[Matches] ON 

INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (60, 173, 174, 4, CAST(N'2018-11-05T09:53:56.5700000' AS DateTime2), CAST(N'2018-11-05T09:53:56.5700000' AS DateTime2), 1, 1)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (61, 175, 176, 2, CAST(N'2018-11-05T09:53:56.5700000' AS DateTime2), CAST(N'2018-11-05T09:53:56.5700000' AS DateTime2), 1, 1)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (62, 177, 178, 1, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 1)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (63, 179, 180, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 1)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (64, 181, 182, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 2)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (65, 183, 184, 1, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 2)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (66, 185, 186, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 2)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (67, 187, 188, 2, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 2)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (68, 189, 190, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 3)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (69, 191, 192, 1, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 3)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (70, 193, 194, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 3)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (71, 195, 196, 8, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 3)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (72, 197, 198, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 4)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (73, 199, 200, 5, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 4)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (74, 201, 202, 7, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 4)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (75, 203, 204, 2, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 4)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (76, 205, 206, 3, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 5)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (77, 207, 208, 5, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 5)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (78, 209, 210, 8, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 5)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (79, 211, 212, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 5)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (80, 213, 214, 8, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 6)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (81, 215, 216, 2, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 6)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (82, 217, 218, 1, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 6)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (83, 219, 220, 4, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 6)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (84, 221, 222, 5, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 7)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (85, 223, 224, 1, CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), CAST(N'2018-11-05T09:53:56.5733333' AS DateTime2), 1, 7)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (86, 225, 226, 3, CAST(N'2018-11-05T09:53:56.5766667' AS DateTime2), CAST(N'2018-11-05T09:53:56.5766667' AS DateTime2), 1, 7)
INSERT [dbo].[Matches] ([MatchId], [Review1ReviewId], [Review2ReviewId], [GenreId], [DateTimeStart], [DateTimeEnd], [InstanceId], [Fecha]) VALUES (87, 227, 228, 4, CAST(N'2018-11-05T09:53:56.5766667' AS DateTime2), CAST(N'2018-11-05T09:53:56.5766667' AS DateTime2), 1, 7)
SET IDENTITY_INSERT [dbo].[Matches] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (1, N'Perfect Blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (2, N'Coraline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (3, N'You´ve Got Mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (4, N'500 Days of Summer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (5, N'The Triplettes of Belleville', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (6, N'Room', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (7, N'Prisoners', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (8, N'The Machinist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (9, N'Serial (Bad) Weddings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (10, N'Ocean´s 8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (11, N'The Hunt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (12, N'Enemy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (13, N'About Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (14, N'Sense and Sensibility', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (15, N'El Secreto de sus Ojos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (16, N'In the Fade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (17, N'The Shock Doctrine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (18, N'The Butterfly Effect', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (19, N'The Butterfly Effect', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (20, N'Mr Nobody', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (21, N'Splice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (22, N'Beginners', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (23, N'Mientras Duermes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (24, N'The Gift', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (25, N'Eternal Sunshine of the Spotless Mind', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (26, N'Deadpool 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (27, N'El Cuerpo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (28, N'A Quiet Place', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (29, N'Tiempo de Valientes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (30, N'Coco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (31, N'Miss Sloane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (32, N'Mystic River', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (33, N'Dallas Buyers Club', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (34, N'Juste la Fin du Monde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (35, N'As Good as it Gets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (36, N'Source Code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (37, N'Get Out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (38, N'Elle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (39, N'The Rocky Horror Picture Show', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (40, N'Coherence', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (41, N'Memento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (42, N'Inglourious Basterds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (43, N'American Gangster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (44, N'The Last Samurai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (45, N'Attack the Block', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (46, N'Ghost in the Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (47, N'Isle of Dogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (48, N'Zootopia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (49, N'Requiem for a Dream', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (50, N'Big Fish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (51, N'El Orfanato', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (52, N'Insidious 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (53, N'Kubo and the Two Strings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (54, N'Your Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (55, N'Wind River', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (56, N'Snatch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (57, N'Southpaw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (58, N'Princess Mononoke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (59, N'Princess Mononoke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (60, N'The Iron Giant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (61, N'What the Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (62, N'Particle Fever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (63, N'Shutter Island', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (64, N'The Hand That Rocks the Cradle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (65, N'The Age of Adaline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (66, N'Match Point', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (67, N'The Iron Giant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (68, N'Brave', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (69, N'Funny Games (Remake)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (70, N'Terrifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (71, N'Keeping Up with the Jonenses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (72, N'The Lego Movie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (73, N'Saint Ralph', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (74, N'Fight Club', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (75, N'Silver Linings Playbook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (76, N'Les Miserables', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (77, N'The Killing of a Sacred Deer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (78, N'In the Mood for Love', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (79, N'The Silence of the Lambs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (80, N'The Machinist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (81, N'Olympus Has Fallen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (82, N'Ready Player One', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (83, N'Pride and Prejudice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (84, N'Blue Valentine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (85, N'Groundhog Day', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (86, N'The Worlds End', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (87, N'Seven Sisters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (88, N'Baby Driver', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (89, N'Idiocracy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (90, N'Thanks you for Smoking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (91, N'The Shining', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (92, N'Seven', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (93, N'Isle of Dogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (94, N'5 Centimeters per Second', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (95, N'Atomic Blonde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (96, N'Ghost in the Shell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (97, N'Punch-Drunk Love', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (98, N'Blue is the Warmest Color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (99, N'Howl´s Moving Castle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (100, N'A Silent Voice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (101, N'Nerve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (102, N'Beyond the Black Rainbow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (103, N'The Imitation Game', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (104, N'Reservoir Dogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (105, N'Gerald´s Game', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (106, N'The Others', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (107, N'American Sniper', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (108, N'Star Wars IV: A New Hope', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (109, N'Attack the Block', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (110, N'Der Name der Rosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (111, N'Kono Sekai no Katasumi ni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (112, N'Barefoot Gen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (113, N'Fantastic Mr Fox', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (114, N'Scott Pilgrim vs the World', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (115, N'The Reader', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (116, N'Tenacious D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (117, N'Me, Earl and the Dying Girl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (118, N'Primal Fear', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (119, N'The Croods', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (120, N'A Scanner Darkly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (121, N'Monty Python and the Holy Grail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (122, N'Me, Myself and Irene', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (123, N'Les Amours Imaginaries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (124, N'The Beauty Inside', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (125, N'Bridge of Spies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (126, N'Warrior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (127, N'I Origins', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (128, N'American Beauty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (129, N'Rust and Bone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (130, N'The Perk of Being a Wallflower', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (131, N'The Departed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (132, N'Mother!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (133, N'French Kiss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (134, N'Revolutionary Road', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (135, N'NightCrawler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (136, N'Pandorum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (137, N'Logan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (138, N'Train to Busan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (139, N'I, Tonya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (140, N'The Intouchables', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (141, N'The Prestige', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (142, N'One Flew over the Cuckoo`s Nest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (143, N'Memoirs of a Geisha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (144, N'Carol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (145, N'August: Osage Country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (146, N'Good Will Hunting', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (147, N'Singles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (148, N'The Legend of Bagger Vance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (149, N'Snatch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (150, N'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (151, N'Frailty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Movies] ([MovieId], [Title], [Poster], [Year], [Country], [Director], [Duration], [Genre], [ImdbRating], [Language], [Plot]) VALUES (152, N'Alien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Movies] OFF
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (3, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (4, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (5, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (6, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (7, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (8, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (9, 1)
INSERT [dbo].[PlayerInstance] ([PlayerId], [InstanceId]) VALUES (10, 1)
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (3, N'Ariela', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (4, N'Eugenia', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (5, N'Inti', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (6, N'Julieta', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (7, N'Leonel', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (8, N'Martin', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (9, N'Matias', NULL)
INSERT [dbo].[Players] ([PlayerId], [Name], [Email]) VALUES (10, N'Melina', NULL)
SET IDENTITY_INSERT [dbo].[Players] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (173, 7, N'-', 50, 3, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (174, 9, N'-', 49, 5, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (175, 5, N'-', 52, 4, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (176, 7, N'-', 51, 10, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (177, 8, N'-', 54, 9, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (178, 6, N'-', 53, 7, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (179, 6, N'-', 56, 6, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (180, 5, N'-', 55, 8, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (181, 7, N'-', 58, 7, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (182, 7, N'-', 57, 5, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (183, 6, N'-', 60, 4, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (184, 8, N'-', 58, 8, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (185, 8, N'-', 62, 9, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (186, 8, N'-', 61, 10, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (187, 9, N'-', 63, 3, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (188, 9, N'-', 64, 6, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (189, 6, N'-', 65, 3, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (190, 7, N'-', 66, 7, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (191, 6, N'-', 60, 5, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (192, 7, N'-', 68, 10, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (193, 7, N'-', 69, 8, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (194, 8, N'-', 70, 9, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (195, 2, N'-', 71, 4, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (196, 5, N'-', 72, 6, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (197, 8, N'-', 73, 3, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (198, 9, N'-', 74, 10, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (199, 6, N'-', 75, 5, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (200, 9, N'-', 76, 8, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (201, 9, N'-', 77, 4, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (202, 9, N'-', 78, 9, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (203, 8, N'-', 79, 7, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (204, 8, N'-', 8, 6, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (205, 7, N'-', 81, 7, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (206, 8, N'-', 82, 10, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (207, 7, N'-', 83, 3, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (208, 6, N'-', 84, 8, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (209, 8, N'-', 85, 5, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (210, 7, N'-', 86, 4, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (211, 7, N'-', 87, 9, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (212, 6, N'-', 88, 6, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (213, 8, N'-', 89, 7, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (214, 8, N'-', 90, 8, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (215, 8, N'-', 91, 3, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (216, 7, N'-', 92, 4, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (217, 9, N'-', 47, 5, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (218, 8, N'-', 94, 9, 5)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (219, 7, N'-', 95, 10, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (220, 8, N'-', 46, 6, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (221, 9, N'-', 97, 10, 8)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (222, 9, N'-', 98, 8, 10)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (223, 8, N'-', 99, 7, 4)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (224, 6, N'-', 100, 4, 7)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (225, 8, N'-', 101, 3, 9)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (226, 8, N'-', 102, 9, 3)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (227, 8, N'-', 103, 5, 6)
INSERT [dbo].[Reviews] ([ReviewId], [Score], [Text], [MovieId], [ReviewerPlayerId], [RecommendedByPlayerId]) VALUES (228, 5, N'-', 104, 6, 5)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([TournamentId], [Name]) VALUES (1, N'Torneo de Recomendacion de Peliculas')
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_PlayerId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_PlayerId] ON [dbo].[AspNetUsers]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Divisions_TournamentId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Divisions_TournamentId] ON [dbo].[Divisions]
(
	[TournamentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Instances_DivisionId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Instances_DivisionId] ON [dbo].[Instances]
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_GenreId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Matches_GenreId] ON [dbo].[Matches]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_InstanceId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Matches_InstanceId] ON [dbo].[Matches]
(
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_Review1ReviewId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Review1ReviewId] ON [dbo].[Matches]
(
	[Review1ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_Review2ReviewId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Review2ReviewId] ON [dbo].[Matches]
(
	[Review2ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlayerInstance_InstanceId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_PlayerInstance_InstanceId] ON [dbo].[PlayerInstance]
(
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_MovieId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_MovieId] ON [dbo].[Reviews]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_RecommendedByPlayerId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_RecommendedByPlayerId] ON [dbo].[Reviews]
(
	[RecommendedByPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_ReviewerPlayerId]    Script Date: 25/3/2019 3:59:29 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_ReviewerPlayerId] ON [dbo].[Reviews]
(
	[ReviewerPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matches] ADD  DEFAULT ((0)) FOR [Fecha]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Players_PlayerId] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Players] ([PlayerId])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Players_PlayerId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Divisions]  WITH CHECK ADD  CONSTRAINT [FK_Divisions_Tournaments_TournamentId] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([TournamentId])
GO
ALTER TABLE [dbo].[Divisions] CHECK CONSTRAINT [FK_Divisions_Tournaments_TournamentId]
GO
ALTER TABLE [dbo].[Instances]  WITH CHECK ADD  CONSTRAINT [FK_Instances_Divisions_DivisionId] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([DivisionId])
GO
ALTER TABLE [dbo].[Instances] CHECK CONSTRAINT [FK_Instances_Divisions_DivisionId]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Genres_GenreId]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Instances_InstanceId] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instances] ([InstanceId])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Instances_InstanceId]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Reviews_Review1ReviewId] FOREIGN KEY([Review1ReviewId])
REFERENCES [dbo].[Reviews] ([ReviewId])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Reviews_Review1ReviewId]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Reviews_Review2ReviewId] FOREIGN KEY([Review2ReviewId])
REFERENCES [dbo].[Reviews] ([ReviewId])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Reviews_Review2ReviewId]
GO
ALTER TABLE [dbo].[PlayerInstance]  WITH CHECK ADD  CONSTRAINT [FK_PlayerInstance_Instances_InstanceId] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instances] ([InstanceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerInstance] CHECK CONSTRAINT [FK_PlayerInstance_Instances_InstanceId]
GO
ALTER TABLE [dbo].[PlayerInstance]  WITH CHECK ADD  CONSTRAINT [FK_PlayerInstance_Players_PlayerId] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Players] ([PlayerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerInstance] CHECK CONSTRAINT [FK_PlayerInstance_Players_PlayerId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Movies_MovieId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Players_RecommendedByPlayerId] FOREIGN KEY([RecommendedByPlayerId])
REFERENCES [dbo].[Players] ([PlayerId])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Players_RecommendedByPlayerId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Players_ReviewerPlayerId] FOREIGN KEY([ReviewerPlayerId])
REFERENCES [dbo].[Players] ([PlayerId])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Players_ReviewerPlayerId]
GO
USE [master]
GO
ALTER DATABASE [Recomendapp] SET  READ_WRITE 
GO
