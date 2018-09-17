USE [master]
GO

/****** Object:  Database [SimpleDemo]    Script Date: 2018/9/18 0:42:07 ******/
CREATE DATABASE [SimpleDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleDemo', FILENAME = N'/var/opt/mssql/data/SimpleDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SimpleDemo_log', FILENAME = N'/var/opt/mssql/data/SimpleDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [SimpleDemo] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SimpleDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SimpleDemo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SimpleDemo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SimpleDemo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SimpleDemo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SimpleDemo] SET ARITHABORT OFF 
GO

ALTER DATABASE [SimpleDemo] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SimpleDemo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SimpleDemo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SimpleDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SimpleDemo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SimpleDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SimpleDemo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SimpleDemo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SimpleDemo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SimpleDemo] SET  ENABLE_BROKER 
GO

ALTER DATABASE [SimpleDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SimpleDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SimpleDemo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SimpleDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SimpleDemo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SimpleDemo] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [SimpleDemo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SimpleDemo] SET RECOVERY FULL 
GO

ALTER DATABASE [SimpleDemo] SET  MULTI_USER 
GO

ALTER DATABASE [SimpleDemo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SimpleDemo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SimpleDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SimpleDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [SimpleDemo] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SimpleDemo] SET QUERY_STORE = OFF
GO

USE [SimpleDemo]
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [SimpleDemo] SET  READ_WRITE 
GO

/****** Object:  Table [dbo].[Books]    Script Date: 2018/9/18 0:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 2018/9/18 0:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfos](
	[UserId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserInfos] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2018/9/18 0:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'619c1b84-0204-428f-aef7-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-0', CAST(N'2018-09-13T00:15:45.5325482' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'b9eae4c0-8221-4c7b-aef8-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-1', CAST(N'2018-09-13T00:15:50.4985177' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'4612278f-4fc1-4f59-aef9-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-2', CAST(N'2018-09-13T00:15:50.4993401' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'88c27f65-270b-487f-aefa-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-3', CAST(N'2018-09-13T00:15:50.4994457' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'46e62da9-6e22-4441-aefb-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-4', CAST(N'2018-09-13T00:15:50.4995111' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'c56cc070-2aad-4a82-aefc-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-5', CAST(N'2018-09-13T00:15:50.4995714' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'36926aba-f5d3-485c-aefd-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-6', CAST(N'2018-09-13T00:15:50.4996305' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5d8cbb83-6f24-4c9f-aefe-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-7', CAST(N'2018-09-13T00:15:50.4996895' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5816ad32-3d6b-4fe1-aeff-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-8', CAST(N'2018-09-13T00:15:50.4997476' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'c01c56b7-897f-432f-af00-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-9', CAST(N'2018-09-13T00:15:50.4997861' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'89582748-dc99-4bfa-af01-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-10', CAST(N'2018-09-13T00:15:50.4998349' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'81dd9153-eb4f-4b3c-af02-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-11', CAST(N'2018-09-13T00:15:50.4999170' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'83f4b815-25e2-477e-af03-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-12', CAST(N'2018-09-13T00:15:50.4999790' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5598015b-e867-4530-af04-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-13', CAST(N'2018-09-13T00:15:50.5000898' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'687bb1d9-7ecb-4264-af05-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-14', CAST(N'2018-09-13T00:15:50.5001603' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'dcad5b6f-f7fa-4af8-af06-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-15', CAST(N'2018-09-13T00:15:50.5002394' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'be079aff-b4ec-40ac-af07-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-16', CAST(N'2018-09-13T00:15:50.5003344' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e6e07018-126b-464b-af08-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-17', CAST(N'2018-09-13T00:15:50.5003699' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'c30170cc-3887-4d65-af09-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-18', CAST(N'2018-09-13T00:15:50.5004045' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'387dbdec-1329-4443-af0a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-19', CAST(N'2018-09-13T00:15:50.5004250' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'8f4a7190-bdc2-43df-af0b-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-20', CAST(N'2018-09-13T00:15:50.5004879' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'a1f3c3df-e462-477c-af0c-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-21', CAST(N'2018-09-13T00:15:50.5005114' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'3fb4e00b-ed31-45bf-af0d-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-22', CAST(N'2018-09-13T00:15:50.5005344' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'7524ceec-837f-4a79-af0e-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-23', CAST(N'2018-09-13T00:15:50.5005588' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'a8ee1c11-b588-4d17-af0f-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-24', CAST(N'2018-09-13T00:15:50.5005828' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'3aea9564-34e6-4de5-af10-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-25', CAST(N'2018-09-13T00:15:50.5006157' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f5d0660f-ea5d-4280-af11-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-26', CAST(N'2018-09-13T00:15:50.5007034' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f6984489-067d-46e3-af12-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-27', CAST(N'2018-09-13T00:15:50.5007838' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'fde48cae-aa99-485b-af13-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-28', CAST(N'2018-09-13T00:15:50.5008471' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'2986ec11-a70c-449d-af14-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-29', CAST(N'2018-09-13T00:15:50.5008761' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'6e3759ea-7dd7-4360-af15-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-30', CAST(N'2018-09-13T00:15:50.5009031' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'b936e760-8ecf-4abe-af16-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-31', CAST(N'2018-09-13T00:15:50.5009223' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'1d2b1739-f384-44c1-af17-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-32', CAST(N'2018-09-13T00:15:50.5009403' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'1592edd6-50cf-4e7c-af18-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-33', CAST(N'2018-09-13T00:15:50.5009694' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'94f71508-8ef5-4c4b-af19-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-34', CAST(N'2018-09-13T00:15:50.5009886' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'77afa9cb-b618-475a-af1a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-35', CAST(N'2018-09-13T00:15:50.5010066' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'ab449142-835a-47a8-af1b-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-36', CAST(N'2018-09-13T00:15:50.5010314' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f5b35d56-1f10-43aa-af1c-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-37', CAST(N'2018-09-13T00:15:50.5010489' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e2f6b9f6-c5b4-4d6e-af1d-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-38', CAST(N'2018-09-13T00:15:50.5010741' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e675dd42-36c4-42ee-af1e-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-39', CAST(N'2018-09-13T00:15:50.5010925' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'bef5fdae-1036-4600-af1f-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-40', CAST(N'2018-09-13T00:15:50.5011156' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f6a3fe0e-e98c-475e-af20-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-41', CAST(N'2018-09-13T00:15:50.5011332' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'a1d2e654-ddb8-4590-af21-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-42', CAST(N'2018-09-13T00:15:50.5011515' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'22f3a045-68cd-444d-af22-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-43', CAST(N'2018-09-13T00:15:50.5011811' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'98ea24d8-8770-4142-af23-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-44', CAST(N'2018-09-13T00:15:50.5011994' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'84ad45e1-be7e-4041-af24-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-45', CAST(N'2018-09-13T00:15:50.5012170' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'97170776-ff00-4498-af25-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-46', CAST(N'2018-09-13T00:15:50.5012392' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'8548e4ff-7dc2-4748-af26-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-47', CAST(N'2018-09-13T00:15:50.5012572' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'119247be-f3b3-4d9b-af27-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-48', CAST(N'2018-09-13T00:15:50.5012743' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'be02729d-4af7-4b4b-af28-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-49', CAST(N'2018-09-13T00:15:50.5012940' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'92ca7eed-8d8b-4e79-af29-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-50', CAST(N'2018-09-13T00:15:50.5013346' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'c708c39b-f850-4758-af2a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-51', CAST(N'2018-09-13T00:15:50.5013538' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'c0922a8d-47f2-4cc2-af2b-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-52', CAST(N'2018-09-13T00:15:50.5013709' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'79e98556-9130-4556-af2c-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-53', CAST(N'2018-09-13T00:15:50.5013936' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'432576a9-5dae-4598-af2d-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-54', CAST(N'2018-09-13T00:15:50.5014116' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'72870d46-0e3e-4df5-af2e-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-55', CAST(N'2018-09-13T00:15:50.5014287' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e2df44c8-7782-45d9-af2f-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-56', CAST(N'2018-09-13T00:15:50.5014522' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'36fbaed9-de9d-4c39-af30-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-57', CAST(N'2018-09-13T00:15:50.5014701' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'9e8673bd-b5f8-461c-af31-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-58', CAST(N'2018-09-13T00:15:50.5014873' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'a3790aa0-d8c0-45b3-af32-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-59', CAST(N'2018-09-13T00:15:50.5015066' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'54b40604-2a5c-431a-af33-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-60', CAST(N'2018-09-13T00:15:50.5015438' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'47b1d025-2732-4506-af34-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-61', CAST(N'2018-09-13T00:15:50.5015626' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5f9fff60-34df-4d94-af35-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-62', CAST(N'2018-09-13T00:15:50.5015801' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'aa4d91d4-b50b-4a3f-af36-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-63', CAST(N'2018-09-13T00:15:50.5016028' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5907902e-fd3a-4cad-af37-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-64', CAST(N'2018-09-13T00:15:50.5016208' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'bac66ad9-bc1f-4758-af38-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-65', CAST(N'2018-09-13T00:15:50.5016379' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'764b02da-1219-4476-af39-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-66', CAST(N'2018-09-13T00:15:50.5016550' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'864a83c7-ba19-43e1-af3a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-67', CAST(N'2018-09-13T00:15:50.5016794' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'86aa229e-7392-4682-af3b-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-68', CAST(N'2018-09-13T00:15:50.5016965' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'066f0942-859e-42fb-af3c-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-69', CAST(N'2018-09-13T00:15:50.5017140' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f65c674f-7f12-4741-af3d-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-70', CAST(N'2018-09-13T00:15:50.5017431' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'7f8929f1-ecc5-4941-af3e-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-71', CAST(N'2018-09-13T00:15:50.5017615' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f906e1a2-46a8-4db2-af3f-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-72', CAST(N'2018-09-13T00:15:50.5017786' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'b74fb663-6081-4bbf-af40-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-73', CAST(N'2018-09-13T00:15:50.5018004' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'972cbcaa-1887-45e0-af41-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-74', CAST(N'2018-09-13T00:15:50.5018192' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'cb44adb3-d874-48bc-af42-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-75', CAST(N'2018-09-13T00:15:50.5018363' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'afd087e7-cf15-43db-af43-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-76', CAST(N'2018-09-13T00:15:50.5018530' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'10e62d83-9642-4325-af44-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-77', CAST(N'2018-09-13T00:15:50.5018757' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'6fe7b278-448a-4e5c-af45-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-78', CAST(N'2018-09-13T00:15:50.5018932' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'36513958-3d12-40dc-af46-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-79', CAST(N'2018-09-13T00:15:50.5019103' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'eda2ee20-82b4-4a73-af47-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-80', CAST(N'2018-09-13T00:15:50.5019325' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'd9e352ec-6098-45e1-af48-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-81', CAST(N'2018-09-13T00:15:50.5019501' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'7a054b5b-e5b0-4176-af49-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-82', CAST(N'2018-09-13T00:15:50.5019672' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'8cc14874-2e52-4daa-af4a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-83', CAST(N'2018-09-13T00:15:50.5019843' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'642e8027-2fc8-4297-af4b-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-84', CAST(N'2018-09-13T00:15:50.5020069' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'87db1711-52f8-4a7e-af4c-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-85', CAST(N'2018-09-13T00:15:50.5020240' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'946796ca-b1cf-4eb6-af4d-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-86', CAST(N'2018-09-13T00:15:50.5020412' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'd7b32eb7-cbdd-46ad-af4e-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-87', CAST(N'2018-09-13T00:15:50.5020634' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'a7d7c5c8-5604-445e-af4f-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-88', CAST(N'2018-09-13T00:15:50.5020873' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'cc9c9cb6-684b-4c28-af50-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-89', CAST(N'2018-09-13T00:15:50.5021049' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e8e27cf5-44f2-4562-af51-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-90', CAST(N'2018-09-13T00:15:50.5021404' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e7acfb10-4d17-4385-af52-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-91', CAST(N'2018-09-13T00:15:50.5021596' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'4d530481-3a8d-49e8-af53-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-92', CAST(N'2018-09-13T00:15:50.5021823' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'ecbfeac2-635c-4b13-af54-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-93', CAST(N'2018-09-13T00:15:50.5022002' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'bd2087cb-0171-4ad0-af55-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-94', CAST(N'2018-09-13T00:15:50.5022169' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'f5a9d07b-1f48-41ce-af56-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-95', CAST(N'2018-09-13T00:15:50.5022511' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5cf389d6-135b-4a58-af57-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-96', CAST(N'2018-09-13T00:15:50.5022725' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'e487e0a3-810f-4a9a-af58-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-97', CAST(N'2018-09-13T00:15:50.5022900' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'4267feda-36af-42de-af59-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-98', CAST(N'2018-09-13T00:15:50.5023080' AS DateTime2))
INSERT [dbo].[Books] ([Id], [UserId], [Name], [CreationTime]) VALUES (N'5ffcce81-8c0a-4eee-af5a-08d618cafee5', N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'Book-99', CAST(N'2018-09-13T00:15:50.5023358' AS DateTime2))
GO
INSERT [dbo].[UserInfos] ([UserId], [Name], [Age], [LastModificationTime], [CreationTime]) VALUES (N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'zengqinglei', 18, NULL, CAST(N'2018-09-13T00:15:35.3722652' AS DateTime2))
INSERT [dbo].[Users] ([Id], [UserName], [Password], [LastModificationTime], [CreationTime]) VALUES (N'e0730d26-7c5f-4ce2-3d58-08d618caf440', N'zengql', N'123456', NULL, CAST(N'2018-09-13T00:15:09.2069499' AS DateTime2))
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Users_UserId]
GO
ALTER TABLE [dbo].[UserInfos]  WITH CHECK ADD  CONSTRAINT [FK_UserInfos_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfos] CHECK CONSTRAINT [FK_UserInfos_Users_UserId]
GO
