USE [master]
GO
/****** Object:  Database [Project 3]    Script Date: 11/15/2018 12:04:27 AM ******/
CREATE DATABASE [Project 3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project 3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project 3.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project 3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project 3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Arabic_CI_AS
GO
ALTER DATABASE [Project 3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project 3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project 3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project 3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project 3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project 3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project 3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project 3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project 3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project 3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project 3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project 3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project 3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project 3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project 3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project 3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project 3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project 3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project 3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project 3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project 3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project 3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project 3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project 3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project 3] SET RECOVERY FULL 
GO
ALTER DATABASE [Project 3] SET  MULTI_USER 
GO
ALTER DATABASE [Project 3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project 3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project 3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project 3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project 3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project 3', N'ON'
GO
USE [Project 3]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/15/2018 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberCode] [int] IDENTITY(1,1) NOT NULL,
	[MemberUsername] [varchar](32) COLLATE Arabic_CI_AS NOT NULL,
	[MemberPassword] [varchar](32) COLLATE Arabic_CI_AS NULL,
	[MemberFriendkey] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Member] UNIQUE NONCLUSTERED 
(
	[MemberUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM]    Script Date: 11/15/2018 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM](
	[PMCode] [int] IDENTITY(1,1) NOT NULL,
	[ProblemCode] [int] NULL,
	[MemberCode] [int] NULL,
 CONSTRAINT [PK_PM] PRIMARY KEY CLUSTERED 
(
	[PMCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Problem]    Script Date: 11/15/2018 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Problem](
	[ProblemCode] [int] IDENTITY(1,1) NOT NULL,
	[ProblemName] [varchar](100) COLLATE Arabic_CI_AS NULL,
	[ProblemAsk] [varchar](1500) COLLATE Arabic_CI_AS NULL,
	[ProblemAnswer] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[ProblemSolved] [int] NULL,
	[ProblemDificulty] [varchar](50) COLLATE Arabic_CI_AS NULL,
	[ProblemTime] [varchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[ProblemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PM]  WITH CHECK ADD  CONSTRAINT [FK_PM_Member1] FOREIGN KEY([MemberCode])
REFERENCES [dbo].[Member] ([MemberCode])
GO
ALTER TABLE [dbo].[PM] CHECK CONSTRAINT [FK_PM_Member1]
GO
ALTER TABLE [dbo].[PM]  WITH CHECK ADD  CONSTRAINT [FK_PM_Problem1] FOREIGN KEY([ProblemCode])
REFERENCES [dbo].[Problem] ([ProblemCode])
GO
ALTER TABLE [dbo].[PM] CHECK CONSTRAINT [FK_PM_Problem1]
GO
USE [master]
GO
ALTER DATABASE [Project 3] SET  READ_WRITE 
GO
