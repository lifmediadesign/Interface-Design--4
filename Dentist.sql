USE [master]
GO
/****** Object:  Database [Dentist]    Script Date: 13-12-2017 12:48:59 ******/
CREATE DATABASE [Dentist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dentist', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Dentist.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dentist_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Dentist_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dentist] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dentist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dentist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dentist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dentist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dentist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dentist] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dentist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dentist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dentist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dentist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dentist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dentist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dentist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dentist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dentist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dentist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dentist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dentist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dentist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dentist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dentist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dentist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dentist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dentist] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dentist] SET  MULTI_USER 
GO
ALTER DATABASE [Dentist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dentist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dentist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dentist] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Dentist] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Dentist]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[patientID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[SSN] [nvarchar](50) NOT NULL,
	[insurance] [nchar](10) NOT NULL,
	[gender] [nchar](10) NOT NULL,
	[age] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nchar](10) NOT NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reservations]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[patientID] [int] NOT NULL,
	[treatmentID] [int] NOT NULL,
	[date] [nvarchar](50) NOT NULL,
	[time] [time](2) NOT NULL,
	[state] [int] NOT NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK_reservations] PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treatments]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[treatments](
	[treatmentID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[picture] [varchar](250) NULL,
 CONSTRAINT [PK_treatments] PRIMARY KEY CLUSTERED 
(
	[treatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_patients] FOREIGN KEY([patientID])
REFERENCES [dbo].[patients] ([patientID])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_patients]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_treatments] FOREIGN KEY([treatmentID])
REFERENCES [dbo].[treatments] ([treatmentID])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_treatments]
GO
/****** Object:  StoredProcedure [dbo].[Myinsertreservation]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myinsertreservation]
	@PatientID int,
	@TreatmentID int,
	@Date text,
	@Time time,
	@State int,
	@Phone int
AS
	INSERT INTO reservations
	values(@PatientID, @TreatmentID, @Date, @Time, @State, @Phone)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Mylogin]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mylogin]
	@Email Varchar (50),
	@Password Varchar (50)
AS
	SELECT patientID, email, password FROM patients WHERE email = @Email and password = @Password
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Myselectallpatients]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectallpatients]
AS
	SELECT *
	FROM patients
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Myselectallreservations]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectallreservations]
AS
	SELECT 
	patients.patientID, patients.name, treatments.name, reservations.date, reservations.time, reservationID
	FROM 
	patients, reservations, treatments 
	WHERE 
	reservations.patientID = patients.patientID and reservations.treatmentID = treatments.treatmentID
			
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Myselectalltreatments]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectalltreatments]
AS
	SELECT *
	FROM treatments
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Myselectloggedinpatientreservation]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectloggedinpatientreservation]
	@patientID int
AS
	SELECT patients.patientID, treatments.name, reservations.date, reservations.time
FROM reservations, patients, treatments
WHERE reservations.patientID = patients.patientID AND reservations.treatmentID = treatments.treatmentID AND patients.patientID = @patientID
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Myselectnamefromtreatments]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectnamefromtreatments]
AS
	SELECT *
	FROM treatments
RETURN
GO
/****** Object:  StoredProcedure [dbo].[MyselectpatientbyID]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MyselectpatientbyID]
AS
	SELECT patients.patientID, treatments.name, reservations.date, reservations.time, reservations.reservationID 
	FROM reservations, treatments, patients 
	WHERE reservations.treatmentID = treatments.treatmentID
			
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Myselectpatientreservation]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Myselectpatientreservation]
	@patientID int,
	@patientCount int = 0 output
AS
	SELECT * FROM reservations WHERE patientID = @patientID
	SELECT @patientCount = count(*) FROM reservations
RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatusFromRes]    Script Date: 13-12-2017 12:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatusFromRes]
	@res_id int,
	@res_status int,
	@res_oldstatus int
AS
	UPDATE dbo.reservations
	set state=@res_status 
	where reservationID = @res_id AND state=@res_oldstatus
RETURN
GO
USE [master]
GO
ALTER DATABASE [Dentist] SET  READ_WRITE 
GO
