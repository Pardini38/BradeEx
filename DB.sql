USE [master]
GO
/****** Object:  Database [Recorder]    Script Date: 22/09/2023 20:00:57 ******/
CREATE DATABASE [Recorder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Recorder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Recorder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Recorder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Recorder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Recorder] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Recorder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Recorder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Recorder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Recorder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Recorder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Recorder] SET ARITHABORT OFF 
GO
ALTER DATABASE [Recorder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Recorder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Recorder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Recorder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Recorder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Recorder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Recorder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Recorder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Recorder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Recorder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Recorder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Recorder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Recorder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Recorder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Recorder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Recorder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Recorder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Recorder] SET RECOVERY FULL 
GO
ALTER DATABASE [Recorder] SET  MULTI_USER 
GO
ALTER DATABASE [Recorder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Recorder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Recorder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Recorder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Recorder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Recorder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Recorder', N'ON'
GO
ALTER DATABASE [Recorder] SET QUERY_STORE = ON
GO
ALTER DATABASE [Recorder] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Recorder]
GO
/****** Object:  Table [dbo].[ALBUNS]    Script Date: 22/09/2023 20:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALBUNS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NULL,
	[Ritmo] [varchar](255) NULL,
	[Id_artista] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARTISTAS]    Script Date: 22/09/2023 20:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTISTAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NULL,
	[Qtd_integrantes] [tinyint] NULL,
	[Ritmo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Recorder] SET  READ_WRITE 
GO