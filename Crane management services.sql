USE [master]
GO

/****** Object:  Database [Cranemanagementservices]    Script Date: 1/9/2025 11:23:04 PM ******/
CREATE DATABASE [Cranemanagementservices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cranemanagementservices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Cranemanagementservices.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cranemanagementservices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Cranemanagementservices_log.ldf' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Cranemanagementservices] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cranemanagementservices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Cranemanagementservices] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET ARITHABORT OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Cranemanagementservices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Cranemanagementservices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Cranemanagementservices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Cranemanagementservices] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET RECOVERY FULL 
GO

ALTER DATABASE [Cranemanagementservices] SET  MULTI_USER 
GO

ALTER DATABASE [Cranemanagementservices] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Cranemanagementservices] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Cranemanagementservices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Cranemanagementservices] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Cranemanagementservices] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Cranemanagementservices] SET  READ_WRITE 
GO

