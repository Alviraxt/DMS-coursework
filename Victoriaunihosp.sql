USE [master]
GO
/****** Object:  Database [Victoria_University_Hospital]    Script Date: 1/10/2025 2:42:05 PM ******/
CREATE DATABASE [Victoria_University_Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Victoria_University_Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Victoria_University_Hospital.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Victoria_University_Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Victoria_University_Hospital_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Victoria_University_Hospital] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Victoria_University_Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Victoria_University_Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Victoria_University_Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Victoria_University_Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Victoria_University_Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Victoria_University_Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Victoria_University_Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Victoria_University_Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Victoria_University_Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Victoria_University_Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Victoria_University_Hospital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Victoria_University_Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Victoria_University_Hospital]
GO
/****** Object:  Table [dbo].[DB_User]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_User](
	[User_ID] [numeric](11, 0) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Preferred_Name] [varchar](50) NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Role_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[epidemiological_data]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[epidemiological_data](
	[Data_ID] [numeric](11, 0) NOT NULL,
	[Location_ID] [numeric](11, 0) NOT NULL,
	[Average_Temperature] [decimal](5, 2) NULL,
	[Added_By] [numeric](11, 0) NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Data_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[facility_type]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facility_type](
	[Facility_Type_ID] [numeric](11, 0) NOT NULL,
	[Facility_Type] [varchar](100) NOT NULL,
	[Resource_ID] [numeric](11, 0) NOT NULL,
	[Location_ID] [numeric](11, 0) NOT NULL,
	[Capacity] [numeric](11, 0) NOT NULL,
	[Facility_Name] [varchar](100) NOT NULL,
	[Facility_Head] [varchar](100) NULL,
	[Contact_Details] [varchar](100) NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Facility_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geographical_location]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geographical_location](
	[Location_ID] [int] NOT NULL,
	[Village] [varchar](100) NULL,
	[Parish] [varchar](100) NULL,
	[Sub_County] [varchar](100) NULL,
	[County] [varchar](100) NULL,
	[Region] [varchar](50) NULL,
	[Population] [numeric](20, 0) NULL,
	[Rainfall] [numeric](11, 0) NULL,
	[Malaria_Risk_Level] [varchar](50) NULL,
	[ITM_Coverage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[health_facility]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[health_facility](
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Facility_Type_ID] [numeric](11, 0) NOT NULL,
	[Location_ID] [numeric](11, 0) NOT NULL,
	[Capacity] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Facility_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[interventions]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[interventions](
	[Intervention_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Activity] [text] NULL,
	[Timestamp] [datetime] NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Intervention_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[laboratory_tests]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[laboratory_tests](
	[Test_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Test_Type] [varchar](50) NOT NULL,
	[Test_Result] [varchar](50) NULL,
	[Test_Date] [date] NOT NULL,
	[Technician_ID] [numeric](11, 0) NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Test_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[malaria_cases]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[malaria_cases](
	[Case_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Date_of_Diagnosis] [date] NOT NULL,
	[Type_of_Malaria] [varchar](50) NOT NULL,
	[Treatment_ID] [numeric](11, 0) NOT NULL,
	[Outcome_ID] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Case_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[malaria_cases_by_region]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[malaria_cases_by_region](
	[Case_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Date_of_Diagnosis] [date] NOT NULL,
	[Type_of_Malaria] [varchar](50) NOT NULL,
	[Reported_Cases] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Case_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[malaria_type]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[malaria_type](
	[Type_ID] [numeric](11, 0) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[Date_Added] [date] NOT NULL,
	[Date_Updated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_data]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_data](
	[Patient_ID] [varchar](11) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Phone_Number] [varchar](20) NULL,
	[Next_of_Kin] [varchar](100) NULL,
	[Location_ID] [int] NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_visit]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_visit](
	[Visit_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Visit_Number] [numeric](11, 0) NOT NULL,
	[Visit_Date] [date] NOT NULL,
	[Outcome] [varchar](50) NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[referral]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referral](
	[Referral_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Referred_From] [numeric](11, 0) NOT NULL,
	[Referred_To] [numeric](11, 0) NOT NULL,
	[Reason] [text] NULL,
	[Referral_Date] [date] NOT NULL,
	[Referred_By] [numeric](11, 0) NOT NULL,
	[Outcome_ID] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Referral_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[resource]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource](
	[Resource_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Quantity] [numeric](11, 0) NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Resource_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[supply_chain]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[supply_chain](
	[Supply_ID] [numeric](11, 0) NOT NULL,
	[Data_ID] [numeric](11, 0) NOT NULL,
	[Shipped_by] [numeric](11, 0) NOT NULL,
	[Shipment_Date] [date] NOT NULL,
	[Expected_Arrival_Date] [date] NULL,
	[Quantity_Shipped] [numeric](11, 0) NOT NULL,
	[Cases_Per_Thousand_People] [numeric](11, 0) NULL,
	[Completion_Status] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Added_By] [numeric](11, 0) NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Supply_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[system_log]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_log](
	[Log_ID] [numeric](11, 0) NOT NULL,
	[User_ID] [numeric](11, 0) NOT NULL,
	[Location_ID] [numeric](11, 0) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Activity] [text] NOT NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[training]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[training](
	[Training_ID] [numeric](11, 0) NOT NULL,
	[Training_Type] [varchar](100) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Quantity] [numeric](11, 0) NOT NULL,
	[Training_Date] [date] NOT NULL,
	[Completion_Status] [varchar](50) NULL,
	[Added_By] [numeric](11, 0) NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Training_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[treatment]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[treatment](
	[Treatment_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Treatment_Name] [varchar](50) NOT NULL,
	[Treatment_Description] [text] NULL,
	[Quantity] [numeric](11, 0) NOT NULL,
	[Dosage] [varchar](50) NULL,
	[Side_Effects] [text] NULL,
	[Outcome] [varchar](50) NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Treatment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[treatment_outcome]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[treatment_outcome](
	[Outcome_ID] [numeric](11, 0) NOT NULL,
	[Outcome_Name] [varchar](50) NOT NULL,
	[Outcome_Description] [text] NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Outcome_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[Role_ID] [numeric](11, 0) NOT NULL,
	[Type_ID] [numeric](11, 0) NOT NULL,
	[User_ID] [numeric](11, 0) NOT NULL,
	[Type_Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visit_record]    Script Date: 1/10/2025 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[visit_record](
	[Visit_ID] [numeric](11, 0) NOT NULL,
	[Patient_ID] [numeric](11, 0) NOT NULL,
	[Facility_ID] [numeric](11, 0) NOT NULL,
	[Visit_Number] [numeric](11, 0) NOT NULL,
	[Visit_Date] [date] NOT NULL,
	[Outcome] [varchar](50) NULL,
	[Date_Added] [date] NOT NULL,
	[Update_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Victoria_University_Hospital] SET  READ_WRITE 
GO
