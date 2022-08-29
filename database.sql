USE [master]
GO
/****** Object:  Database [eStore_Asm3_SE150974]    Script Date: 09-Jul-22 1:14:05 PM ******/
CREATE DATABASE [eStore_Asm3_SE150974]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eStore_Asm3_SE150974', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eStore_Asm3_SE150974.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eStore_Asm3_SE150974_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eStore_Asm3_SE150974_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eStore_Asm3_SE150974].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ARITHABORT OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET  MULTI_USER 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [eStore_Asm3_SE150974]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09-Jul-22 1:14:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09-Jul-22 1:14:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09-Jul-22 1:14:05 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 09-Jul-22 1:14:05 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [nvarchar](450) NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09-Jul-22 1:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Weight] [nvarchar](50) NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703152211_AddIdentity', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220706154808_UpdateIdentity', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (10, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (11, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (12, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (13, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (14, N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (15, N'6c82cc55-ffe0-4c8e-8d95-268e61cd5bac', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (16, N'2e04284b-348e-423e-9c07-ad398417ac5b', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (17, N'2e04284b-348e-423e-9c07-ad398417ac5b', N'http://schemas.microsoft.com/ws/2008/06/identity/claims/role', N'User')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator]) VALUES (N'06dcfb41-9c59-42ba-8d17-1428e10012c5', N'phong@gmail.com', N'PHONG@GMAIL.COM', N'phong@gmail.com', N'PHONG@GMAIL.COM', 1, N'', N'HL7CN3YOZPGJ56654HELQGQGDCX5J2ES', N'f040cf60-1d55-4160-b29c-73d7b5b2c1e1', NULL, 0, 0, CAST(N'2022-07-09T06:09:32.1654455+00:00' AS DateTimeOffset), 1, 0, N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator]) VALUES (N'2e04284b-348e-423e-9c07-ad398417ac5b', N'phong123@gmail.com', N'PHONG123@GMAIL.COM', N'phong123@gmail.com', N'PHONG123@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEHdwNmSSuYEe4hiFoe9z9u4Ns9sqs4T+k+U1S3TFwdI84Ztw0MKXPTjox4yQZql/+g==', N'EJM3CVQBUXX2DMHSYGP6Z3QGBVLQWUNT', N'c35e727e-e9ec-4952-a5bb-a1d32a69ae58', N'0334052001', 0, 0, NULL, 1, 0, N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator]) VALUES (N'5e6795ec-341c-4d98-a64e-e58d2bae51ca', N'phognntse150974@fpt.edu.vn', N'PHOGNNTSE150974@FPT.EDU.VN', N'phognntse150974@fpt.edu.vn', N'PHOGNNTSE150974@FPT.EDU.VN', 1, N'AQAAAAEAACcQAAAAENfjvQMSD7F4kUr8N0QJt3fNqmUu0Ykq0WFUP0hQBmfBpYSpOyuxkDhOC3AQUfGUgg==', N'6XZFBWKIUXGX7NKXKNUOG5S3JJQEGWZB', N'ca9e42a6-8c4a-4b35-b207-9290b1cd851c', NULL, 0, 0, NULL, 1, 0, N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator]) VALUES (N'6c82cc55-ffe0-4c8e-8d95-268e61cd5bac', N'phongphong@gmail.com', N'PHONGPHONG@GMAIL.COM', N'phongphong@gmail.com', N'PHONGPHONG@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEscPyqQ0rFfskc6st6HAaxAl6uD1VQut74uT0nkS091H2qlCIdusxSW/APyuiUBNg==', N'DPRW4O5Z57BDSRCSF7E2UUF6AHLEZO52', N'66c2a160-f8f5-489a-a5b2-849530247264', NULL, 0, 0, NULL, 1, 0, N'IdentityUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator]) VALUES (N'd0e861c2-5607-445a-854c-f8e6bcd52787', N'phong1@gmail.com', N'PHONG1@GMAIL.COM', N'phong1@gmail.com', N'PHONG1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFsHez57B60DZtCUjFecTCdXaayHWwDzk7MzRBZzdHo6JMMNxppEiqqPP9BozkccWw==', N'T54KOTIPWGOUW5DCE3PIH4Y6BO5XQ53Z', N'4ae10903-38cc-44c6-bf24-1c1c85dcd883', NULL, 0, 0, CAST(N'2022-07-08T09:42:23.4285639+00:00' AS DateTimeOffset), 1, 0, N'IdentityUser')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Laptop')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Soft drink')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1002, N'Electronic')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1003, N'Stationery')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1004, N'Fast food')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1005, N'T-Shirt')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1006, N'Trouser')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1007, N'Smartphone')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1008, N'Pet food')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1009, N'Book')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1010, N'Textbook')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1011, N'Diary Product')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (1, N'06dcfb41-9c59-42ba-8d17-1428e10012c5', CAST(N'2022-07-08T11:53:23.007' AS DateTime), CAST(N'2022-07-16T11:53:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (2, N'06dcfb41-9c59-42ba-8d17-1428e10012c5', CAST(N'2022-07-08T11:54:14.197' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (3, N'06dcfb41-9c59-42ba-8d17-1428e10012c5', CAST(N'2022-07-08T14:17:51.810' AS DateTime), CAST(N'2022-07-24T14:17:00.000' AS DateTime), CAST(N'2022-07-09T14:17:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (4, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T11:35:01.250' AS DateTime), CAST(N'2022-07-15T11:33:00.000' AS DateTime), CAST(N'2022-07-13T11:33:00.000' AS DateTime), 1.5000, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (5, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T11:36:50.947' AS DateTime), CAST(N'2022-07-20T11:36:00.000' AS DateTime), CAST(N'2022-07-13T11:36:00.000' AS DateTime), 4.5000, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (6, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T11:38:52.593' AS DateTime), CAST(N'2022-07-14T11:38:00.000' AS DateTime), CAST(N'2022-07-12T11:38:00.000' AS DateTime), 4.8900, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (7, N'06dcfb41-9c59-42ba-8d17-1428e10012c5', CAST(N'2022-07-09T12:45:56.580' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (8, N'06dcfb41-9c59-42ba-8d17-1428e10012c5', CAST(N'2022-07-09T12:48:12.307' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (9, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T12:51:48.657' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (10, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T12:58:02.517' AS DateTime), CAST(N'2022-07-14T12:57:00.000' AS DateTime), CAST(N'2022-07-13T12:58:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (11, N'd0e861c2-5607-445a-854c-f8e6bcd52787', CAST(N'2022-07-09T12:58:22.150' AS DateTime), CAST(N'2022-07-20T12:58:00.000' AS DateTime), CAST(N'2022-07-19T12:58:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (12, N'6c82cc55-ffe0-4c8e-8d95-268e61cd5bac', CAST(N'2022-07-09T13:07:15.247' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [IsDeleted]) VALUES (13, N'2e04284b-348e-423e-9c07-ad398417ac5b', CAST(N'2022-07-09T13:09:39.183' AS DateTime), CAST(N'2022-07-21T13:09:00.000' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 15000000.0000, 1, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 2, 15000000.0000, 1, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 5, 15000000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 7, 15000000.0000, 3, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 8, 15000000.0000, 1, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 2, 7000.0000, 2, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 4, 7000.0000, 2, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 4, 20200000.0000, 3, 0.01)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 6, 20200000.0000, 2, 0.25)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 3, 7000.0000, 1, 0.2)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 5, 7000.0000, 2, 1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 8, 7000.0000, 2, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 9, 7000.0000, 1, 0.1)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 10, 25000000.0000, 1, 0.25)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 11, 199000.0000, 2, 0.15)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 10, 25000.0000, 15, 0.25)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 12, 7000.0000, 1, 0.2)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 13, 149000.0000, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (1, 1, N'Laptop Hp 8GB/256GB SSD', N'2.55', 15000000.0000, 450, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (3, 2, N'7up', N'0.5', 7000.0000, 150, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (5, 1, N'Laptop ASUS 16GB/552GB SSD', N'2.5', 20200000.0000, 10, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (6, 2, N'Mirinda Cream Soda', N'0.25', 7000.0000, 39, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (7, 1, N'asdasd', N'2.5', 52.0000, 25, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (8, 1007, N'iPhone 13 Pro Max', N'0.6', 25000000.0000, 11, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (9, 1005, N'teelab T-Shirt VN3X', N'0.25', 199000.0000, 43, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (10, 1008, N'Cat pate', N'0.5', 25000.0000, 63, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (11, 1011, N'Vinamilk', N'0.5', 7000.0000, 24, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (12, 1009, N'Tuoi tre dang gia bao nhieu', N'0.75', 149000.0000, 123, 0)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock], [IsDeleted]) VALUES (13, 1007, N'asdas', N'52', 12312.0000, 123123, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_MemberId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_MemberId] ON [dbo].[Order]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 09-Jul-22 1:14:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers] FOREIGN KEY([MemberId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [eStore_Asm3_SE150974] SET  READ_WRITE 
GO
