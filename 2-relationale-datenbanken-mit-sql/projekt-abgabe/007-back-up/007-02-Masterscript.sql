USE [master]
GO
/****** Object:  Database [Kalorienbilanz]    Script Date: 13.07.2023 20:25:29 ******/
CREATE DATABASE [Kalorienbilanz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kalorienbilanz', FILENAME = N'C:\SQL-Kurs\DB\Kalorienbilanz\Kalorienbilanz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kalorienbilanz_log', FILENAME = N'C:\SQL-Kurs\DB\Kalorienbilanz\Kalorienbilanz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kalorienbilanz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kalorienbilanz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kalorienbilanz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kalorienbilanz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kalorienbilanz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kalorienbilanz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kalorienbilanz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET RECOVERY FULL 
GO
ALTER DATABASE [Kalorienbilanz] SET  MULTI_USER 
GO
ALTER DATABASE [Kalorienbilanz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kalorienbilanz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kalorienbilanz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kalorienbilanz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kalorienbilanz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kalorienbilanz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kalorienbilanz] SET QUERY_STORE = OFF
GO
/****** Object:  Login [NT-AUTORITÄT\SYSTEM]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [NT-AUTORITÄT\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [KalorienbilanzUser]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [KalorienbilanzUser] WITH PASSWORD=N'gF9g+RuEMTpekMi0ta+jAmq2S2DCrhToMMFZo5yJBFs=', DEFAULT_DATABASE=[Kalorienbilanz], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [KalorienbilanzUser] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [FirmaUser]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [FirmaUser] WITH PASSWORD=N'u8lkp6RaYjbMjsICLSBODQ7AV/km4OC6KUxqEXDQi6E=', DEFAULT_DATABASE=[FirmaUebung], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [FirmaUser] DISABLE
GO
/****** Object:  Login [\Jeder]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [\Jeder] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'f3sVI3MbZHFJ+TFNDIORz3z+zAE1snFILfyL4i+a7KU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 13.07.2023 20:25:29 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'Nwz1xRZHbAnXS6zJB15ljykC2fGphwlPnMMTmPuSHdw=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[Kalorienbilanz] TO [RZPC-4005\alfa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [\Jeder]
GO
USE [Kalorienbilanz]
GO
/****** Object:  User [KalorienbilanzBenutzer]    Script Date: 13.07.2023 20:25:29 ******/
CREATE USER [KalorienbilanzBenutzer] FOR LOGIN [KalorienbilanzUser] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT CONNECT TO [KalorienbilanzBenutzer] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Aktivzeit_Sum_Person_Datum]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE     FUNCTION [dbo].[sf_Aktivzeit_Sum_Person_Datum] 
(
	@PersonenID int,
	@Datum date
)
RETURNS smallint
AS
BEGIN
	DECLARE @Person_Sum_AktivZeit_pro_Datum smallint;
	
	SET @Person_Sum_AktivZeit_pro_Datum =
	(
		SELECT SUM(dbo.tb_AktivZeit.Dauer)
		FROM dbo.tb_AktivZeit 
			INNER JOIN dbo.tb_PersoAktivZuordnung ON dbo.tb_AktivZeit.PersoAktivID = dbo.tb_PersoAktivZuordnung.PersoAktivID 
			INNER JOIN dbo.tb_Personen ON dbo.tb_PersoAktivZuordnung.PersonenID = dbo.tb_Personen.PersonenID
		GROUP BY dbo.tb_AktivZeit.Datum, dbo.tb_Personen.PersonenID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname
		HAVING (dbo.tb_AktivZeit.Datum = @Datum) AND (dbo.tb_Personen.PersonenID = @PersonenID)
	)

	IF @Person_Sum_AktivZeit_pro_Datum IS NULL
		SET @Person_Sum_AktivZeit_pro_Datum = 0;	
	
	RETURN @Person_Sum_AktivZeit_pro_Datum;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_Aktivzeit_Sum_Person_Datum] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetAge]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   FUNCTION [dbo].[sf_GetAge] 
(
	@GebDat date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Age int;
	DECLARE @Heute date;
	SET @Heute = GETDATE();
		
	IF (MONTH(@GebDat) > MONTH(@Heute)) -- Geburtsmonat erst später
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE IF (MONTH(@GebDat) = MONTH(@Heute) AND DAY(@GebDat) > DAY(@Heute))
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE SET @Age = DATEDIFF(YEAR, @GebDat, @Heute);

	-- Return the result of the function
	RETURN @Age;

END

GO
ALTER AUTHORIZATION ON [dbo].[sf_GetAge] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetAktivArtID]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetAktivArtID]
(
	@PersoAktivID int
)
RETURNS int
AS
BEGIN
	DECLARE @AktivArtID int;

    SET @AktivArtID = 
	(
		SELECT [AktivArtID] 
		FROM [dbo].[tb_PersoAktivZuordnung]
		WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID
    );
    RETURN @AktivArtID;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetAktivArtID] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGebDat]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGebDat]
(
	@PersonenID int
)
RETURNS date
AS
BEGIN
	DECLARE @GebDat date;

    SET @GebDat = 
	(
		SELECT [Geburtsdatum] 
		FROM [dbo].[tb_Personen]
		WHERE [dbo].[tb_Personen].[PersonenID] = @PersonenID
    );
    RETURN @GebDat;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGebDat] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGeschlechtID]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGeschlechtID]
(
	@PersonenID int
)
RETURNS int
AS
BEGIN
	DECLARE @GeschlechtID int;

    SET @GeschlechtID = 
	(
		SELECT [GeschlechtID] 
		FROM [dbo].[tb_Personen]
		WHERE [dbo].[tb_Personen].[PersonenID] = @PersonenID
    );
    RETURN @GeschlechtID;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGeschlechtID] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGewicht]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGewicht]
(
	@PersonenID int
)
RETURNS tinyint
AS
BEGIN
	DECLARE @Gewicht tinyint;

    SET @Gewicht = 
	(
		SELECT [Gewicht] 
		FROM [dbo].[tb_Biometrie]
		WHERE [dbo].[tb_Biometrie].[PersonenID] = @PersonenID
    );
    RETURN @Gewicht;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGewicht] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGroesse]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGroesse]
(
	@PersonenID int
)
RETURNS tinyint
AS
BEGIN
	DECLARE @Groesse tinyint;

    SET @Groesse = 
	(
		SELECT [Groesse] 
		FROM [dbo].[tb_Biometrie]
		WHERE [dbo].[tb_Biometrie].[PersonenID] = @PersonenID
    );
    RETURN @Groesse;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGroesse] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGrundumsatz]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGrundumsatz]
(
	@Gewicht tinyint,
	@Groesse tinyint,
	@Age int,
	@GUKonst int
)
RETURNS float
AS
BEGIN
	DECLARE @Grundumsatz float;
	SET @Grundumsatz = (10 * @Gewicht) + (6.25 * @Groesse) - (5 * @Age) + @GUKonst;
	RETURN @Grundumsatz;
END

GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGrundumsatz] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetGUKonst]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetGUKonst]
(
	@GeschlechtID int
)
RETURNS smallint
AS
BEGIN
	DECLARE @GUKonst smallint;

    SET @GUKonst = 
	(
		SELECT [GUKonst] 
		FROM [dbo].[tb_GUKonst]
		WHERE [dbo].[tb_GUKonst].[GeschlechtID] = @GeschlechtID
    );
    RETURN @GUKonst;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetGUKonst] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetKaloriengehalt]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetKaloriengehalt]
(
	@NahrungID int
)
RETURNS int
AS
BEGIN
	DECLARE @Kaloriengehalt int;

    SET @Kaloriengehalt = 
	(
		SELECT [Kaloriengehalt] 
		FROM [dbo].[tb_Nahrung]
		WHERE [dbo].[tb_Nahrung].[NahrungID] = @NahrungID
    );
    RETURN @Kaloriengehalt;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetKaloriengehalt] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetKalorienzufuhr]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetKalorienzufuhr]
(
	@Menge float,
	@Kaloriengehalt float
)
RETURNS float
AS
BEGIN
	DECLARE @Kalorienzufuhr float;
	SET @Kalorienzufuhr = (@Menge * @Kaloriengehalt)/100;
    RETURN @Kalorienzufuhr;
END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetKalorienzufuhr] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetLeistungsumsatz]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetLeistungsumsatz]
(

	@Dauer int,
	@METWert float,
	@Gewicht int

)
RETURNS float
AS
BEGIN

	DECLARE @Leistungsumsatz float;
    SET @Leistungsumsatz = @METWert * 3.5 * @Gewicht * @Dauer / 200;
    RETURN @Leistungsumsatz;

END

GO
ALTER AUTHORIZATION ON [dbo].[sf_GetLeistungsumsatz] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetMaxPersonenID]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetMaxPersonenID]
(
)
RETURNS int
AS
BEGIN
	DECLARE @MaxPersonenID int;

    SET @MaxPersonenID = 
	(
		SELECT MAX ([PersonenID]) 
		FROM [dbo].[tb_Personen]
    );
    RETURN @MaxPersonenID;
END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetMaxPersonenID] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetMETWert]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetMETWert]
(
	@AktivArtID int
)
RETURNS float
AS
BEGIN
	DECLARE @METWert float;

    SET @METWert = 
	(
		SELECT [METWert] 
		FROM [dbo].[tb_AktivArt]
		WHERE [dbo].[tb_AktivArt].[AktivArtID] = @AktivArtID
    );
    RETURN @METWert;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetMETWert] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_GetPersonenID]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE   FUNCTION [dbo].[sf_GetPersonenID]
(
	@PersoAktivID int
)
RETURNS int
AS
BEGIN
	DECLARE @PersonenID int;

    SET @PersonenID = 
	(
		SELECT [PersonenID] 
		FROM [dbo].[tb_PersoAktivZuordnung]
		WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID
    );
    RETURN @PersonenID;

END
GO
ALTER AUTHORIZATION ON [dbo].[sf_GetPersonenID] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_IstNeuePerson]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     FUNCTION [dbo].[sf_IstNeuePerson]
(
	@Vorname nvarchar (50),
	@Nachname nvarchar (50),
	@GebDat date,
	@GeschlechtID int
)
RETURNS int
AS
BEGIN
	DECLARE @IstNeuePerson bit;
	
	DECLARE @entrycount int;
	SET	@entrycount =
	(
		SELECT COUNT(*)
		FROM [dbo].[tb_Personen]
		WHERE
			(Vorname = @Vorname) AND
			(Nachname = @Nachname) AND
			(Geburtsdatum = @GebDat) AND
			(GeschlechtID = @GeschlechtID)
	);

	-- Noch kein Eintrag von Person
	IF (@entrycount = 0)
	BEGIN
		-- Neue Person!
		SET @IstNeuePerson = 1;
	END
	-- Es gibt schon einen Eintrag der Person
	ELSE
	BEGIN
	-- NICHT neue Person
		SET @IstNeuePerson = 0;
	END;

	RETURN @IstNeuePerson;

END

GO
ALTER AUTHORIZATION ON [dbo].[sf_IstNeuePerson] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Zeitstempel]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Valerie Münz
-- Create date: 07.07.2023
-- Description:	Skalarwertfunktion Zeitstempel
-- =============================================
CREATE     FUNCTION [dbo].[sf_Zeitstempel] 
(
)
RETURNS char(18)
AS
BEGIN
	
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');
	
END
GO
ALTER AUTHORIZATION ON [dbo].[sf_Zeitstempel] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Personen]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Personen](
	[PersonenID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Geburtsdatum] [date] NOT NULL,
	[GeschlechtID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Personen] PRIMARY KEY CLUSTERED 
(
	[PersonenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Personen] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_LogBilanz]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LogBilanz](
	[LogBilanzID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[PersonenID] [int] NOT NULL,
	[KalorienZufuhr] [float] NULL,
	[KalorienVerbrauchGU] [float] NULL,
	[KalorienVerbrauchLU] [float] NULL,
 CONSTRAINT [PK_tb_LogBilanz] PRIMARY KEY CLUSTERED 
(
	[LogBilanzID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_LogBilanz] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_PersonenLogBilanz]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[View_PersonenLogBilanz]
AS		
		
		SELECT TOP (100) PERCENT 
			dbo.tb_Personen.PersonenID, 
			dbo.tb_Personen.Nachname, 
			dbo.tb_Personen.Vorname, 
			dbo.tb_LogBilanz.Datum, 
			dbo.tb_LogBilanz.KalorienZufuhr, 
			dbo.tb_LogBilanz.KalorienVerbrauchGU, 
            dbo.tb_LogBilanz.KalorienVerbrauchLU
		FROM        
			dbo.tb_LogBilanz 
			RIGHT OUTER JOIN dbo.tb_Personen 
			ON dbo.tb_LogBilanz.PersonenID = dbo.tb_Personen.PersonenID
		ORDER BY dbo.tb_Personen.PersonenID, dbo.tb_LogBilanz.Datum DESC
GO
ALTER AUTHORIZATION ON [dbo].[View_PersonenLogBilanz] TO  SCHEMA OWNER 
GO
GRANT SELECT ON [dbo].[View_PersonenLogBilanz] TO [KalorienbilanzBenutzer] AS [dbo]
GO
/****** Object:  View [dbo].[View_PersonenLogBilanzSumme]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[View_PersonenLogBilanzSumme]
AS	


SELECT        
	TOP (100) PERCENT 
			dbo.tb_Personen.PersonenID, 
			dbo.tb_Personen.Nachname, 
			dbo.tb_Personen.Vorname, 
			dbo.tb_LogBilanz.Datum, 
			SUM(dbo.tb_LogBilanz.KalorienZufuhr) AS KaloZufuhr, 
			SUM(dbo.tb_LogBilanz.KalorienVerbrauchGU) AS KaloVerbrauchGU, 
			SUM(dbo.tb_LogBilanz.KalorienVerbrauchLU) AS KaloVerbrauchLU
	FROM    
			dbo.tb_LogBilanz 
		RIGHT OUTER JOIN
            dbo.tb_Personen ON dbo.tb_LogBilanz.PersonenID = dbo.tb_Personen.PersonenID
	GROUP BY dbo.tb_Personen.PersonenID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_LogBilanz.Datum
	ORDER BY dbo.tb_Personen.PersonenID, dbo.tb_LogBilanz.Datum DESC
GO
ALTER AUTHORIZATION ON [dbo].[View_PersonenLogBilanzSumme] TO  SCHEMA OWNER 
GO
GRANT SELECT ON [dbo].[View_PersonenLogBilanzSumme] TO [KalorienbilanzBenutzer] AS [dbo]
GO
/****** Object:  Table [dbo].[tb_AktivArt]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_AktivArt](
	[AktivArtID] [int] IDENTITY(1,1) NOT NULL,
	[Art] [nvarchar](50) NOT NULL,
	[METWert] [float] NOT NULL,
 CONSTRAINT [PK_tb_AktivArt] PRIMARY KEY CLUSTERED 
(
	[AktivArtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_AktivArt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_PersoAktivZuordnung]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_PersoAktivZuordnung](
	[PersoAktivID] [int] IDENTITY(1,1) NOT NULL,
	[PersonenID] [int] NOT NULL,
	[AktivArtID] [int] NOT NULL,
 CONSTRAINT [PK_tb_PersoAktivZuordnung] PRIMARY KEY CLUSTERED 
(
	[PersoAktivID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_PersoAktivZuordnung] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_PersoAktivArt]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PersoAktivArt]
AS
SELECT        TOP (100) PERCENT dbo.tb_PersoAktivZuordnung.PersoAktivID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_AktivArt.Art, dbo.tb_AktivArt.METWert
FROM            dbo.tb_Personen INNER JOIN
                         dbo.tb_PersoAktivZuordnung ON dbo.tb_Personen.PersonenID = dbo.tb_PersoAktivZuordnung.PersonenID INNER JOIN
                         dbo.tb_AktivArt ON dbo.tb_PersoAktivZuordnung.AktivArtID = dbo.tb_AktivArt.AktivArtID
ORDER BY dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_AktivArt.Art
GO
ALTER AUTHORIZATION ON [dbo].[View_PersoAktivArt] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[View_Personen_weibl]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Personen_weibl]
AS
SELECT        TOP (100) PERCENT Nachname, Vorname, GeschlechtID
FROM            dbo.tb_Personen
WHERE        (GeschlechtID = 1)
ORDER BY Nachname, Vorname
GO
ALTER AUTHORIZATION ON [dbo].[View_Personen_weibl] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_AktivZeit]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_AktivZeit](
	[AktivZeitID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[Dauer] [int] NOT NULL,
	[PersoAktivID] [int] NOT NULL,
 CONSTRAINT [PK_tb_AktivZeit] PRIMARY KEY CLUSTERED 
(
	[AktivZeitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_AktivZeit] TO  SCHEMA OWNER 
GO
GRANT DELETE ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer] AS [dbo]
GO
GRANT INSERT ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer] AS [dbo]
GO
GRANT SELECT ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer] AS [dbo]
GO
/****** Object:  View [dbo].[View_PersonAktivZeitDatum]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PersonAktivZeitDatum]
AS
SELECT        dbo.tb_AktivZeit.Datum, dbo.tb_Personen.PersonenID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, SUM(dbo.tb_AktivZeit.Dauer) AS SummeZeit
FROM            dbo.tb_PersoAktivZuordnung INNER JOIN
                         dbo.tb_AktivZeit ON dbo.tb_PersoAktivZuordnung.PersoAktivID = dbo.tb_AktivZeit.PersoAktivID INNER JOIN
                         dbo.tb_Personen ON dbo.tb_PersoAktivZuordnung.PersonenID = dbo.tb_Personen.PersonenID
GROUP BY dbo.tb_AktivZeit.Datum, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_Personen.PersonenID
HAVING        (dbo.tb_AktivZeit.Datum = CONVERT(DATETIME, '2023-07-09 00:00:00', 102)) AND (dbo.tb_Personen.PersonenID = 2)
GO
ALTER AUTHORIZATION ON [dbo].[View_PersonAktivZeitDatum] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_PersonAktivZeitDatum]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   FUNCTION [dbo].[tf_PersonAktivZeitDatum] 
(	
	@Datum date,
	@PersonenID int
)
RETURNS TABLE 
AS
RETURN 
(
SELECT
                dbo.tb_AktivZeit.Datum,
                dbo.tb_Personen.PersonenID,
                dbo.tb_Personen.Nachname,
                dbo.tb_Personen.Vorname,
                SUM(dbo.tb_AktivZeit.Dauer) AS SummeZeit
        FROM
                dbo.tb_PersoAktivZuordnung
                INNER JOIN dbo.tb_AktivZeit
                        ON dbo.tb_PersoAktivZuordnung.PersoAktivID = dbo.tb_AktivZeit.PersoAktivID
                INNER JOIN dbo.tb_Personen
                        ON dbo.tb_PersoAktivZuordnung.PersonenID = dbo.tb_Personen.PersonenID
        GROUP BY
                dbo.tb_AktivZeit.Datum,
                dbo.tb_Personen.PersonenID,
                dbo.tb_Personen.Nachname,
                dbo.tb_Personen.Vorname
        HAVING
                (dbo.tb_Personen.PersonenID = @PersonenID) AND
                (dbo.tb_AktivZeit.Datum = @Datum)
)

GO
ALTER AUTHORIZATION ON [dbo].[tf_PersonAktivZeitDatum] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_GUKonst]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_GUKonst](
	[GUKonstID] [int] IDENTITY(1,1) NOT NULL,
	[GeschlechtID] [int] NOT NULL,
	[GUKonst] [smallint] NOT NULL,
 CONSTRAINT [PK_tb_GUKonst] PRIMARY KEY CLUSTERED 
(
	[GUKonstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_GUKonst] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Biometrie]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Biometrie](
	[BioID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[Groesse] [tinyint] NOT NULL,
	[Gewicht] [tinyint] NOT NULL,
	[PersonenID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Biometrie] PRIMARY KEY CLUSTERED 
(
	[BioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Biometrie] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Geschlecht]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Geschlecht](
	[GeschlechtID] [int] IDENTITY(1,1) NOT NULL,
	[GeschlechtKat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Geschlecht] PRIMARY KEY CLUSTERED 
(
	[GeschlechtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Geschlecht] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_GrundumsatzParameter]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:                <Author,,Name>
-- Create date: <Create Date,,>
-- Description:        <Description,,>
-- =============================================
CREATE   FUNCTION [dbo].[tf_GrundumsatzParameter]
(        
        @PersonenID int
)
RETURNS TABLE 
AS
RETURN 
(
        SELECT
                dbo.tb_Personen.PersonenID,
                dbo.tb_Personen.Geburtsdatum,
                dbo.tb_Geschlecht.GeschlechtID,
                dbo.tb_Geschlecht.GeschlechtKat,
                dbo.tb_Biometrie.Gewicht,
                dbo.tb_Biometrie.Groesse,
                dbo.tb_GUKonst.GUKonst
        FROM
                dbo.tb_Biometrie
                INNER JOIN dbo.tb_Personen
                        ON dbo.tb_Biometrie.PersonenID = dbo.tb_Personen.PersonenID
                INNER JOIN dbo.tb_Geschlecht
                        ON dbo.tb_Personen.GeschlechtID = dbo.tb_Geschlecht.GeschlechtID
                INNER JOIN dbo.tb_GUKonst
                ON dbo.tb_Geschlecht.GeschlechtID = dbo.tb_GUKonst.GeschlechtID
        WHERE
                dbo.tb_Personen.PersonenID = @PersonenID
)

GO
ALTER AUTHORIZATION ON [dbo].[tf_GrundumsatzParameter] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [dbo].[tf_LeistungsumsatzParameter]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:                <Author,,Name>
-- Create date: <Create Date,,>
-- Description:        <Description,,>
-- =============================================
CREATE   FUNCTION [dbo].[tf_LeistungsumsatzParameter]
(        
        @PersonenID int,
		@Datum date
)
RETURNS TABLE 
AS
RETURN 
(
        SELECT
			dbo.tb_Personen.PersonenID, 
			dbo.tb_Biometrie.Gewicht, 
			dbo.tb_AktivZeit.Datum, 
			dbo.tb_AktivZeit.Dauer, 
			dbo.tb_AktivArt.METWert
		FROM
			dbo.tb_Biometrie 
			INNER JOIN dbo.tb_Personen 
				ON dbo.tb_Biometrie.PersonenID = dbo.tb_Personen.PersonenID 
			INNER JOIN dbo.tb_PersoAktivZuordnung 
				ON dbo.tb_Personen.PersonenID = dbo.tb_PersoAktivZuordnung.PersonenID 
			INNER JOIN dbo.tb_AktivArt 
				ON dbo.tb_PersoAktivZuordnung.AktivArtID = dbo.tb_AktivArt.AktivArtID 
			INNER JOIN dbo.tb_AktivZeit 
				ON dbo.tb_PersoAktivZuordnung.PersoAktivID = dbo.tb_AktivZeit.PersoAktivID
        WHERE
			(dbo.tb_Personen.PersonenID = @PersonenID) AND 
			(dbo.tb_AktivZeit.Datum = @Datum)
)

GO
ALTER AUTHORIZATION ON [dbo].[tf_LeistungsumsatzParameter] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_BMIKat]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_BMIKat](
	[BMIKatID] [int] IDENTITY(1,1) NOT NULL,
	[BMIKat] [nvarchar](50) NOT NULL,
	[BMIKatMin] [tinyint] NOT NULL,
	[BMIKatMax] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_BMIKat] PRIMARY KEY CLUSTERED 
(
	[BMIKatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_BMIKat] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_MahlzeitArt]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_MahlzeitArt](
	[MahlzeitArtID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Mahlzeitart] PRIMARY KEY CLUSTERED 
(
	[MahlzeitArtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_MahlzeitArt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_Mahlzeiten]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Mahlzeiten](
	[MahlzeitenID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[Menge] [int] NOT NULL,
	[MahlzeitArtID] [int] NOT NULL,
	[NahrungID] [int] NOT NULL,
	[PersonenID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Mahlzeiten] PRIMARY KEY CLUSTERED 
(
	[MahlzeitenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Mahlzeiten] TO  SCHEMA OWNER 
GO
GRANT DELETE ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer] AS [dbo]
GO
GRANT INSERT ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer] AS [dbo]
GO
GRANT SELECT ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer] AS [dbo]
GO
/****** Object:  Table [dbo].[tb_Nahrung]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Nahrung](
	[NahrungID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
	[Kaloriengehalt] [int] NOT NULL,
	[NahrungKatID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Nahrung] PRIMARY KEY CLUSTERED 
(
	[NahrungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_Nahrung] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[tb_NahrungKat]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_NahrungKat](
	[NahrungKatID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_NahrungKat] PRIMARY KEY CLUSTERED 
(
	[NahrungKatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[tb_NahrungKat] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[tb_AktivArt] ON 

INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (1, N'Haushalt', 2.5)
INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (2, N'Gehen', 2.5)
INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (3, N'Gartenarbeit', 4)
INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (4, N'Joggen', 8)
INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (5, N'Schwimmen', 6)
INSERT [dbo].[tb_AktivArt] ([AktivArtID], [Art], [METWert]) VALUES (6, N'Radfahren', 12)
SET IDENTITY_INSERT [dbo].[tb_AktivArt] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_AktivZeit] ON 

INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (1, CAST(N'2023-07-09' AS Date), 120, 1)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (2, CAST(N'2023-07-10' AS Date), 60, 2)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (3, CAST(N'2023-07-09' AS Date), 45, 3)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (4, CAST(N'2023-07-09' AS Date), 15, 4)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (5, CAST(N'2023-07-10' AS Date), 120, 4)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (6, CAST(N'2023-07-09' AS Date), 120, 5)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (7, CAST(N'2023-07-09' AS Date), 60, 6)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (8, CAST(N'2023-07-09' AS Date), 15, 7)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (9, CAST(N'2023-07-10' AS Date), 30, 8)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (60, CAST(N'2023-07-12' AS Date), 60, 7)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (61, CAST(N'2023-07-13' AS Date), 120, 8)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (62, CAST(N'2023-07-13' AS Date), 15, 7)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (63, CAST(N'2023-07-12' AS Date), 70, 6)
INSERT [dbo].[tb_AktivZeit] ([AktivZeitID], [Datum], [Dauer], [PersoAktivID]) VALUES (68, CAST(N'2023-07-13' AS Date), 40, 5)
SET IDENTITY_INSERT [dbo].[tb_AktivZeit] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Biometrie] ON 

INSERT [dbo].[tb_Biometrie] ([BioID], [Datum], [Groesse], [Gewicht], [PersonenID]) VALUES (1, CAST(N'2023-07-07' AS Date), 180, 75, 4)
INSERT [dbo].[tb_Biometrie] ([BioID], [Datum], [Groesse], [Gewicht], [PersonenID]) VALUES (2, CAST(N'2023-07-07' AS Date), 159, 62, 3)
INSERT [dbo].[tb_Biometrie] ([BioID], [Datum], [Groesse], [Gewicht], [PersonenID]) VALUES (3, CAST(N'2023-07-07' AS Date), 160, 52, 2)
INSERT [dbo].[tb_Biometrie] ([BioID], [Datum], [Groesse], [Gewicht], [PersonenID]) VALUES (4, CAST(N'2023-07-07' AS Date), 191, 76, 1)
SET IDENTITY_INSERT [dbo].[tb_Biometrie] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_BMIKat] ON 

INSERT [dbo].[tb_BMIKat] ([BMIKatID], [BMIKat], [BMIKatMin], [BMIKatMax]) VALUES (1, N'Untergewicht', 0, 20)
INSERT [dbo].[tb_BMIKat] ([BMIKatID], [BMIKat], [BMIKatMin], [BMIKatMax]) VALUES (2, N'Normalgewicht', 20, 25)
INSERT [dbo].[tb_BMIKat] ([BMIKatID], [BMIKat], [BMIKatMin], [BMIKatMax]) VALUES (3, N'Uebergewicht', 25, 30)
INSERT [dbo].[tb_BMIKat] ([BMIKatID], [BMIKat], [BMIKatMin], [BMIKatMax]) VALUES (4, N'Adipositas', 30, 100)
SET IDENTITY_INSERT [dbo].[tb_BMIKat] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Geschlecht] ON 

INSERT [dbo].[tb_Geschlecht] ([GeschlechtID], [GeschlechtKat]) VALUES (3, N'divers')
INSERT [dbo].[tb_Geschlecht] ([GeschlechtID], [GeschlechtKat]) VALUES (2, N'maennlich')
INSERT [dbo].[tb_Geschlecht] ([GeschlechtID], [GeschlechtKat]) VALUES (1, N'weiblich')
SET IDENTITY_INSERT [dbo].[tb_Geschlecht] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_GUKonst] ON 

INSERT [dbo].[tb_GUKonst] ([GUKonstID], [GeschlechtID], [GUKonst]) VALUES (1, 1, -161)
INSERT [dbo].[tb_GUKonst] ([GUKonstID], [GeschlechtID], [GUKonst]) VALUES (2, 2, 5)
INSERT [dbo].[tb_GUKonst] ([GUKonstID], [GeschlechtID], [GUKonst]) VALUES (3, 3, 0)
SET IDENTITY_INSERT [dbo].[tb_GUKonst] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_LogBilanz] ON 

INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (85, CAST(N'2023-07-12' AS Date), 4, 0, 1554, 472.5)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (86, CAST(N'2023-07-13' AS Date), 4, 0, 1554, 1890)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (87, CAST(N'2023-07-13' AS Date), 4, 0, 0, 118.125)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (88, CAST(N'2023-07-12' AS Date), 3, 0, 1287.75, 607.6)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (95, CAST(N'2023-07-13' AS Date), 3, 0, 1287.75, 108.5)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (96, CAST(N'2023-07-12' AS Date), 4, 50, 0, 0)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (97, CAST(N'2023-07-12' AS Date), 4, 54, 0, 0)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (100, CAST(N'2023-07-13' AS Date), 4, 725, 0, 0)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (101, CAST(N'2023-07-13' AS Date), 4, 160, 0, 0)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (102, CAST(N'2023-07-12' AS Date), 3, 1392, 0, 0)
INSERT [dbo].[tb_LogBilanz] ([LogBilanzID], [Datum], [PersonenID], [KalorienZufuhr], [KalorienVerbrauchGU], [KalorienVerbrauchLU]) VALUES (103, CAST(N'2023-07-13' AS Date), 3, 114.4, 0, 0)
SET IDENTITY_INSERT [dbo].[tb_LogBilanz] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_MahlzeitArt] ON 

INSERT [dbo].[tb_MahlzeitArt] ([MahlzeitArtID], [Bezeichnung]) VALUES (3, N'Abendbrot')
INSERT [dbo].[tb_MahlzeitArt] ([MahlzeitArtID], [Bezeichnung]) VALUES (1, N'Fruehstueck')
INSERT [dbo].[tb_MahlzeitArt] ([MahlzeitArtID], [Bezeichnung]) VALUES (2, N'Mittagessen')
INSERT [dbo].[tb_MahlzeitArt] ([MahlzeitArtID], [Bezeichnung]) VALUES (4, N'Snack')
SET IDENTITY_INSERT [dbo].[tb_MahlzeitArt] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Mahlzeiten] ON 

INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (1, CAST(N'2023-07-09' AS Date), 100, 1, 8, 1)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (2, CAST(N'2023-07-09' AS Date), 200, 2, 3, 1)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (3, CAST(N'2023-07-09' AS Date), 200, 2, 2, 1)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (4, CAST(N'2023-07-09' AS Date), 100, 3, 7, 1)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (5, CAST(N'2023-07-10' AS Date), 200, 1, 1, 1)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (6, CAST(N'2023-07-09' AS Date), 90, 1, 7, 2)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (7, CAST(N'2023-07-09' AS Date), 20, 1, 5, 2)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (8, CAST(N'2023-07-09' AS Date), 150, 3, 8, 2)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (9, CAST(N'2023-07-10' AS Date), 140, 4, 1, 2)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (10, CAST(N'2023-07-09' AS Date), 50, 2, 7, 3)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (11, CAST(N'2023-07-09' AS Date), 30, 2, 5, 3)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (12, CAST(N'2023-07-09' AS Date), 30, 3, 6, 3)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (13, CAST(N'2023-07-09' AS Date), 200, 3, 8, 3)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (14, CAST(N'2023-07-09' AS Date), 100, 1, 7, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (15, CAST(N'2023-07-09' AS Date), 100, 1, 5, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (16, CAST(N'2023-07-09' AS Date), 200, 2, 4, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (17, CAST(N'2023-07-10' AS Date), 50, 2, 1, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (19, CAST(N'2023-07-10' AS Date), 200, 3, 12, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (20, CAST(N'2023-07-10' AS Date), 100, 3, 10, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (32, CAST(N'2023-07-12' AS Date), 200, 1, 2, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (33, CAST(N'2023-07-12' AS Date), 100, 1, 1, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (37, CAST(N'2023-07-13' AS Date), 500, 2, 4, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (38, CAST(N'2023-07-13' AS Date), 250, 3, 5, 4)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (39, CAST(N'2023-07-12' AS Date), 400, 4, 7, 3)
INSERT [dbo].[tb_Mahlzeiten] ([MahlzeitenID], [Datum], [Menge], [MahlzeitArtID], [NahrungID], [PersonenID]) VALUES (40, CAST(N'2023-07-13' AS Date), 130, 1, 6, 3)
SET IDENTITY_INSERT [dbo].[tb_Mahlzeiten] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Nahrung] ON 

INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (1, N'Apfel', 54, 1)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (2, N'Karotte', 25, 1)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (3, N'Thunfisch', 226, 2)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (4, N'Huhn', 145, 2)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (5, N'Milch', 64, 3)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (6, N'Kaese', 88, 3)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (7, N'Haferflocken', 348, 4)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (8, N'Brot', 260, 4)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (9, N'Schokolade', 531, 5)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (10, N'Gummibaeren', 328, 5)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (11, N'Bier', 43, 6)
INSERT [dbo].[tb_Nahrung] ([NahrungID], [Bezeichnung], [Kaloriengehalt], [NahrungKatID]) VALUES (12, N'Limonade', 49, 6)
SET IDENTITY_INSERT [dbo].[tb_Nahrung] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_NahrungKat] ON 

INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (2, N'FleischFischEier')
INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (6, N'Getraenke')
INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (4, N'Getreideprodukte')
INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (3, N'Milchprodukte')
INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (1, N'ObstGemuese')
INSERT [dbo].[tb_NahrungKat] ([NahrungKatID], [Bezeichnung]) VALUES (5, N'Suesswaren')
SET IDENTITY_INSERT [dbo].[tb_NahrungKat] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_PersoAktivZuordnung] ON 

INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (3, 2, 1)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (5, 3, 1)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (4, 2, 2)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (1, 1, 3)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (2, 1, 4)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (6, 3, 4)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (7, 4, 5)
INSERT [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID], [PersonenID], [AktivArtID]) VALUES (8, 4, 6)
SET IDENTITY_INSERT [dbo].[tb_PersoAktivZuordnung] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Personen] ON 

INSERT [dbo].[tb_Personen] ([PersonenID], [Vorname], [Nachname], [Geburtsdatum], [GeschlechtID]) VALUES (1, N'Jan', N'Piplack', CAST(N'1976-12-15' AS Date), 2)
INSERT [dbo].[tb_Personen] ([PersonenID], [Vorname], [Nachname], [Geburtsdatum], [GeschlechtID]) VALUES (2, N'Kathy', N'Su', CAST(N'1992-01-06' AS Date), 1)
INSERT [dbo].[tb_Personen] ([PersonenID], [Vorname], [Nachname], [Geburtsdatum], [GeschlechtID]) VALUES (3, N'Marie', N'Ewerton', CAST(N'1989-08-03' AS Date), 1)
INSERT [dbo].[tb_Personen] ([PersonenID], [Vorname], [Nachname], [Geburtsdatum], [GeschlechtID]) VALUES (4, N'Valerie', N'Muenz', CAST(N'1990-09-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tb_Personen] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AktivArt]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AktivArt] ON [dbo].[tb_AktivArt]
(
	[Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BioDatPerso]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BioDatPerso] ON [dbo].[tb_Biometrie]
(
	[Datum] ASC,
	[PersonenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BMIKat]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BMIKat] ON [dbo].[tb_BMIKat]
(
	[BMIKat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BMIKatMax]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BMIKatMax] ON [dbo].[tb_BMIKat]
(
	[BMIKatMax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BMIKatMin]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BMIKatMin] ON [dbo].[tb_BMIKat]
(
	[BMIKatMin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GeschlechtKat]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GeschlechtKat] ON [dbo].[tb_Geschlecht]
(
	[GeschlechtKat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GeGUKonst]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GeGUKonst] ON [dbo].[tb_GUKonst]
(
	[GeschlechtID] ASC,
	[GUKonst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MahlzeitArtBez]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MahlzeitArtBez] ON [dbo].[tb_MahlzeitArt]
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NahrungBez]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NahrungBez] ON [dbo].[tb_Nahrung]
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NahrungKatBez]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NahrungKatBez] ON [dbo].[tb_NahrungKat]
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersoAktivZuordnung]    Script Date: 13.07.2023 20:25:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PersoAktivZuordnung] ON [dbo].[tb_PersoAktivZuordnung]
(
	[AktivArtID] ASC,
	[PersonenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_AktivZeit] ADD  CONSTRAINT [DF_tb_AktivZeit_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[tb_Biometrie] ADD  CONSTRAINT [DF_tb_Biometrie_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] ADD  CONSTRAINT [DF_tb_Mahlzeiten_Datum]  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[tb_AktivZeit]  WITH CHECK ADD  CONSTRAINT [FK_tb_AktivZeit_tb_PersoAktivZuordnung] FOREIGN KEY([PersoAktivID])
REFERENCES [dbo].[tb_PersoAktivZuordnung] ([PersoAktivID])
GO
ALTER TABLE [dbo].[tb_AktivZeit] CHECK CONSTRAINT [FK_tb_AktivZeit_tb_PersoAktivZuordnung]
GO
ALTER TABLE [dbo].[tb_Biometrie]  WITH CHECK ADD  CONSTRAINT [FK_tb_Biometrie_tb_Personen] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO
ALTER TABLE [dbo].[tb_Biometrie] CHECK CONSTRAINT [FK_tb_Biometrie_tb_Personen]
GO
ALTER TABLE [dbo].[tb_GUKonst]  WITH CHECK ADD  CONSTRAINT [FK_tb_GUKonst_tb_Geschlecht] FOREIGN KEY([GeschlechtID])
REFERENCES [dbo].[tb_Geschlecht] ([GeschlechtID])
GO
ALTER TABLE [dbo].[tb_GUKonst] CHECK CONSTRAINT [FK_tb_GUKonst_tb_Geschlecht]
GO
ALTER TABLE [dbo].[tb_LogBilanz]  WITH CHECK ADD  CONSTRAINT [FK_tb_LogBilanz_tb_Personen] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO
ALTER TABLE [dbo].[tb_LogBilanz] CHECK CONSTRAINT [FK_tb_LogBilanz_tb_Personen]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mahlzeiten_tb_MahlzeitArt] FOREIGN KEY([MahlzeitArtID])
REFERENCES [dbo].[tb_MahlzeitArt] ([MahlzeitArtID])
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] CHECK CONSTRAINT [FK_tb_Mahlzeiten_tb_MahlzeitArt]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mahlzeiten_tb_Nahrung] FOREIGN KEY([NahrungID])
REFERENCES [dbo].[tb_Nahrung] ([NahrungID])
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] CHECK CONSTRAINT [FK_tb_Mahlzeiten_tb_Nahrung]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mahlzeiten_tb_Personen] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] CHECK CONSTRAINT [FK_tb_Mahlzeiten_tb_Personen]
GO
ALTER TABLE [dbo].[tb_Nahrung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Nahrung_tb_NahrungKat] FOREIGN KEY([NahrungKatID])
REFERENCES [dbo].[tb_NahrungKat] ([NahrungKatID])
GO
ALTER TABLE [dbo].[tb_Nahrung] CHECK CONSTRAINT [FK_tb_Nahrung_tb_NahrungKat]
GO
ALTER TABLE [dbo].[tb_PersoAktivZuordnung]  WITH CHECK ADD  CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_AktivArt] FOREIGN KEY([AktivArtID])
REFERENCES [dbo].[tb_AktivArt] ([AktivArtID])
GO
ALTER TABLE [dbo].[tb_PersoAktivZuordnung] CHECK CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_AktivArt]
GO
ALTER TABLE [dbo].[tb_PersoAktivZuordnung]  WITH CHECK ADD  CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_Personen] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO
ALTER TABLE [dbo].[tb_PersoAktivZuordnung] CHECK CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_Personen]
GO
ALTER TABLE [dbo].[tb_Personen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Personen_tb_Geschlecht] FOREIGN KEY([GeschlechtID])
REFERENCES [dbo].[tb_Geschlecht] ([GeschlechtID])
GO
ALTER TABLE [dbo].[tb_Personen] CHECK CONSTRAINT [FK_tb_Personen_tb_Geschlecht]
GO
ALTER TABLE [dbo].[tb_AktivArt]  WITH CHECK ADD  CONSTRAINT [CK_METWert] CHECK  (([METWert]>=(1.5) AND [METWert]<=(20)))
GO
ALTER TABLE [dbo].[tb_AktivArt] CHECK CONSTRAINT [CK_METWert]
GO
ALTER TABLE [dbo].[tb_AktivZeit]  WITH CHECK ADD  CONSTRAINT [CK_AktivZeitDatum] CHECK  (([Datum]<=getdate()))
GO
ALTER TABLE [dbo].[tb_AktivZeit] CHECK CONSTRAINT [CK_AktivZeitDatum]
GO
ALTER TABLE [dbo].[tb_AktivZeit]  WITH CHECK ADD  CONSTRAINT [CK_AktivZeitDauer] CHECK  (([Dauer]>=(1) AND [Dauer]<=(1440)))
GO
ALTER TABLE [dbo].[tb_AktivZeit] CHECK CONSTRAINT [CK_AktivZeitDauer]
GO
ALTER TABLE [dbo].[tb_Biometrie]  WITH CHECK ADD  CONSTRAINT [CK_BiometrieDatum] CHECK  (([Datum]<=getdate()))
GO
ALTER TABLE [dbo].[tb_Biometrie] CHECK CONSTRAINT [CK_BiometrieDatum]
GO
ALTER TABLE [dbo].[tb_Biometrie]  WITH CHECK ADD  CONSTRAINT [CK_BiometrieGewicht] CHECK  (([Gewicht]>(0)))
GO
ALTER TABLE [dbo].[tb_Biometrie] CHECK CONSTRAINT [CK_BiometrieGewicht]
GO
ALTER TABLE [dbo].[tb_Biometrie]  WITH CHECK ADD  CONSTRAINT [CK_BiometrieGroesse] CHECK  (([Groesse]>(0)))
GO
ALTER TABLE [dbo].[tb_Biometrie] CHECK CONSTRAINT [CK_BiometrieGroesse]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten]  WITH CHECK ADD  CONSTRAINT [CK_MahlzeitenDatum] CHECK  (([Datum]<=getdate()))
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] CHECK CONSTRAINT [CK_MahlzeitenDatum]
GO
ALTER TABLE [dbo].[tb_Mahlzeiten]  WITH CHECK ADD  CONSTRAINT [CK_MahlzeitenMenge] CHECK  (([Menge]>(0)))
GO
ALTER TABLE [dbo].[tb_Mahlzeiten] CHECK CONSTRAINT [CK_MahlzeitenMenge]
GO
ALTER TABLE [dbo].[tb_Nahrung]  WITH CHECK ADD  CONSTRAINT [CK_NahrungKaloriengehalt] CHECK  (([Kaloriengehalt]>(0)))
GO
ALTER TABLE [dbo].[tb_Nahrung] CHECK CONSTRAINT [CK_NahrungKaloriengehalt]
GO
ALTER TABLE [dbo].[tb_Personen]  WITH CHECK ADD  CONSTRAINT [CK_PersonenGeburtsdatum] CHECK  (([Geburtsdatum]<getdate()))
GO
ALTER TABLE [dbo].[tb_Personen] CHECK CONSTRAINT [CK_PersonenGeburtsdatum]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddPersonMitBiometrie]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:
--   Gibt es die Person schon?
--   d.h. dieselben Werte fuer Vorname, Nachname, GebDat und Geschlecht.
--   - wenn ja: error
--   - wenn nein: in tb_Person und tb_Biometrie eintragen
-- =============================================
CREATE   PROCEDURE [dbo].[sp_AddPersonMitBiometrie]
	-- tb_Person
	@Vorname nvarchar(50),
	@Nachname nvarchar(50),
	@GebDat date,
	@GeschlechtID int,
	-- tb_Biometrie
	@Groesse tinyint,
	@Gewicht tinyint,
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback nvarchar(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IstNeuePerson AS bit;		
	-------------------------------------------------------------------	
	-- Ist es eine neue Person?
	SET @IstNeuePerson = [dbo].[sf_IstNeuePerson](@Vorname, @Nachname, @GebDat, @GeschlechtID)

	BEGIN TRY
		-- Neue Person
		IF (@IstNeuePerson = 1)
		BEGIN
			-- INSERT into tb_Personen
			INSERT INTO [dbo].[tb_Personen] 
				(Vorname,  Nachname,  Geburtsdatum,  GeschlechtID)
			VALUES
				(@Vorname, @Nachname, @GebDat, @GeschlechtID);

			-- Get last entry in tb_Personen
			-- (assumption: last entry has highest automatically generated PersonenID)
			DECLARE @MaxPersonenID int;
			SET @MaxPersonenID = [dbo].[sf_GetMaxPersonenID]()

			-- INSERT into tb_Biometrie
			INSERT INTO [dbo].[tb_Biometrie] 
				(Datum,  Groesse,  Gewicht,  PersonenID)
			VALUES
				(getdate(), @Groesse, @Gewicht, @MaxPersonenID);
	
			-- Feedback
			SET @Erfolg = 1;
			SET @Feedback = 'Alles OK!';
		END
		-- Person existiert bereits
		ELSE
		BEGIN
			-- Error
			THROW 50001, 'Person existiert bereits (mit genau diesem Vornamen, Nachnamen, Geburtsdatum und GeschlechtID)!', 1;
		END; 
	END TRY
	BEGIN CATCH
		-- Feedback
		SET @Erfolg = 0;
		SET @Feedback =
			'Person ' +
			CONVERT(nvarchar(50), @Vorname) +
			' ' +
			CONVERT(nvarchar(50), @Nachname) +
			' existiert bereits.'; 
	END CATCH;
END
GO
ALTER AUTHORIZATION ON [dbo].[sp_AddPersonMitBiometrie] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_Backup_Kalorienbilanz_mit_Zeitstempel]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Valerie Münz
-- Create date: 07.07.2023
-- Description:	Prozedur Backup
-- =============================================
CREATE     PROCEDURE [dbo].[sp_Backup_Kalorienbilanz_mit_Zeitstempel] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @backupFile NVARCHAR(MAX); --file name

	SET @backupFile='C:\SQL-Kurs\DB\Kalorienbilanz\Backup\Kalorienbilanz-'
					+ [dbo].[sf_Zeitstempel]()
					+ '.bak';


   	BACKUP DATABASE [Kalorienbilanz] TO DISK = @backupFile;

END
GO
ALTER AUTHORIZATION ON [dbo].[sp_Backup_Kalorienbilanz_mit_Zeitstempel] TO  SCHEMA OWNER 
GO
GRANT EXECUTE ON [dbo].[sp_Backup_Kalorienbilanz_mit_Zeitstempel] TO [KalorienbilanzBenutzer] AS [dbo]
GO
/****** Object:  Trigger [dbo].[tr_AktivZeit24h_INSERT]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- This trigger prevents a row from being inserted 
-- in the [dbo].[tb_AktivZeit] table
-- when the AktivZeit would become > 24h.

CREATE   TRIGGER [dbo].[tr_AktivZeit24h_INSERT] 
ON [dbo].[tb_AktivZeit]
AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	DECLARE @PersoAktivID int;
	DECLARE @Datum date;
	------------------------------			
	SELECT @PersoAktivID = PersoAktivID FROM inserted;
	SELECT @Datum = Datum FROM inserted;

	DECLARE @DauerBisher smallint;
	DECLARE @PersonenID int;
	--
	SELECT @PersonenID = PersonenID
	FROM [dbo].[tb_PersoAktivZuordnung]
	WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID;
	--
	SELECT @DauerBisher = [dbo].[sf_Aktivzeit_Sum_Person_Datum](@PersonenID, @Datum);
	
	IF @DauerBisher > 1440
	BEGIN  
		RAISERROR ('Die maximale Aktivitaeten-Zeit für den Tag wurde überschritten. Bitte anpassen.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN 
	END;
END;

GO
ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeit24h_INSERT]
GO
/****** Object:  Trigger [dbo].[tr_AktivZeit24h_UPDATE]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- This trigger prevents a row from being inserted 
-- in the [dbo].[tb_AktivZeit] table
-- when the AktivZeit would become > 24h.

CREATE   TRIGGER [dbo].[tr_AktivZeit24h_UPDATE] 
ON [dbo].[tb_AktivZeit]
AFTER UPDATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	DECLARE @PersoAktivID int;
	DECLARE @Datum date;
	------------------------------			
	SELECT @PersoAktivID = PersoAktivID FROM inserted;
	SELECT @Datum = Datum FROM inserted;

	DECLARE @DauerBisher smallint;
	DECLARE @PersonenID int;
	--
	SELECT @PersonenID = PersonenID
	FROM [dbo].[tb_PersoAktivZuordnung]
	WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID;
	--
	SELECT @DauerBisher = [dbo].[sf_Aktivzeit_Sum_Person_Datum](@PersonenID, @Datum);
	
	IF @DauerBisher > 1440
	BEGIN  
		RAISERROR ('Die maximale Aktivitaeten-Zeit für den Tag wurde überschritten. Bitte anpassen.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN 
	END;
END;
GO
ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeit24h_UPDATE]
GO
/****** Object:  Trigger [dbo].[tr_AktivZeitKaloLog_DELETE]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   TRIGGER [dbo].[tr_AktivZeitKaloLog_DELETE]
   ON [dbo].[tb_AktivZeit]
AFTER DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Datum date;
	DECLARE @Dauer int;
	DECLARE @PersoAktivID int;
	------------------------------
	SELECT @Datum = Datum FROM deleted;
	SELECT @Dauer = Dauer FROM deleted;
	SELECT @PersoAktivID = PersoAktivID FROM deleted;


	DECLARE @PersonenID int;
	SET @PersonenID = [dbo].[sf_GetPersonenID](@PersoAktivID);

	DECLARE @AktivArtID int;
	SET @AktivArtID = [dbo].[sf_GetAktivArtID](@PersoAktivID);

	DECLARE @METWert float;
	SET @METWert = [dbo].[sf_GetMETWert](@AktivArtID);

	DECLARE @Gewicht tinyint;
	SET @Gewicht = [dbo].[sf_GetGewicht](@PersonenID);

	--
	DECLARE @KalorienverbrauchAktiv float;
	SET @KalorienverbrauchAktiv = -1 * [dbo].[sf_GetLeistungsumsatz](@Dauer, @METWert, @Gewicht);


	BEGIN
		INSERT INTO [dbo].[tb_LogBilanz]
			(Datum, PersonenID, KalorienZufuhr, KalorienVerbrauchGU, KalorienVerbrauchLU )
		SELECT   Datum, @PersonenID, 0, 0, @KalorienverbrauchAktiv
		FROM deleted
	END

END

GO
ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeitKaloLog_DELETE]
GO
/****** Object:  Trigger [dbo].[tr_AktivZeitKaloLog_INSERT]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   TRIGGER [dbo].[tr_AktivZeitKaloLog_INSERT]
   ON [dbo].[tb_AktivZeit]
AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Datum date;
	DECLARE @Dauer int;
	DECLARE @PersoAktivID int;
	------------------------------
	SELECT @Datum = Datum FROM inserted;
	SELECT @Dauer = Dauer FROM inserted;
	SELECT @PersoAktivID = PersoAktivID FROM inserted;


	DECLARE @PersonenID int;
	SET @PersonenID = [dbo].[sf_GetPersonenID](@PersoAktivID);

	DECLARE @AktivArtID int;
	SET @AktivArtID = [dbo].[sf_GetAktivArtID](@PersoAktivID);

	DECLARE @METWert float;
	SET @METWert = [dbo].[sf_GetMETWert](@AktivArtID);

	DECLARE @Gewicht tinyint;
	SET @Gewicht = [dbo].[sf_GetGewicht](@PersonenID);

	--
	DECLARE @KalorienverbrauchAktiv float;
	SET @KalorienverbrauchAktiv = [dbo].[sf_GetLeistungsumsatz](@Dauer, @METWert, @Gewicht);

	DECLARE @Groesse tinyint;
	SET @Groesse = [dbo].[sf_GetGroesse](@PersonenID);

	DECLARE @GebDat date;
	SET @GebDat = [dbo].[sf_GetGebDat](@PersonenID);

	DECLARE @Age int;
	SET @Age = [dbo].[sf_GetAge](@GebDat);

	DECLARE @GeschlechtID int;
	SET @GeschlechtID = [dbo].[sf_GetGeschlechtID](@PersonenID);

	DECLARE @GUKonst smallint;
	SET @GUKonst = [dbo].[sf_GetGUKonst](@GeschlechtID);

	DECLARE @KalorienverbrauchPassiv float;
	SET @KalorienverbrauchPassiv = [dbo].[sf_GetGrundumsatz] (@Gewicht, @Groesse, @Age, @GUKonst)

	DECLARE @rowcount int;
	SET @rowcount =
		(
		SELECT Count(*)
			FROM [dbo].[tb_LogBilanz]
			WHERE ([dbo].[tb_LogBilanz].[PersonenID] = @PersonenID) AND
				([dbo].[tb_LogBilanz].[Datum] = @Datum)
		);
	IF @rowcount = 0
	BEGIN
		INSERT INTO [dbo].[tb_LogBilanz]
			(Datum, PersonenID, KalorienZufuhr, KalorienVerbrauchGU, KalorienVerbrauchLU )
		SELECT   Datum, @PersonenID, 0, @KalorienverbrauchPassiv, @KalorienverbrauchAktiv
		FROM inserted
	END
ELSE
	BEGIN
		INSERT INTO [dbo].[tb_LogBilanz]
			(Datum, PersonenID, KalorienZufuhr, KalorienVerbrauchGU, KalorienVerbrauchLU )
		SELECT   Datum, @PersonenID, 0, 0, @KalorienverbrauchAktiv
		FROM inserted
	END

END

GO
ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeitKaloLog_INSERT]
GO
/****** Object:  Trigger [dbo].[tr_MahlzeitKaloLog_DELETE]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   TRIGGER [dbo].[tr_MahlzeitKaloLog_DELETE]
   ON [dbo].[tb_Mahlzeiten]
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Datum date;
	DECLARE @Menge int;
	DECLARE @NahrungID int;
	DECLARE @PersonenID int;
	------------------------------			
	SELECT @Datum = Datum FROM deleted;
	SELECT @Menge = Menge FROM deleted;
	SELECT @NahrungID = NahrungID FROM deleted;
	SELECT @PersonenID = PersonenID FROM deleted;
	--
	DECLARE @Kaloriengehalt int;
	SET @Kaloriengehalt = [dbo].[sf_GetKaloriengehalt](@NahrungID);

	DECLARE @Kalorienzufuhr float;
	SET @Kalorienzufuhr = -1 * [dbo].[sf_GetKalorienzufuhr](@Menge, @Kaloriengehalt);
	
	INSERT INTO [dbo].[tb_LogBilanz]
		(Datum, PersonenID, KalorienZufuhr, KalorienVerbrauchGU, KalorienVerbrauchLU)
	SELECT   Datum,  @PersonenID, @Kalorienzufuhr, 0 , 0
	FROM deleted;	
END

GO
ALTER TABLE [dbo].[tb_Mahlzeiten] ENABLE TRIGGER [tr_MahlzeitKaloLog_DELETE]
GO
/****** Object:  Trigger [dbo].[tr_MahlzeitKaloLog_INSERT]    Script Date: 13.07.2023 20:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   TRIGGER [dbo].[tr_MahlzeitKaloLog_INSERT]
   ON [dbo].[tb_Mahlzeiten]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Datum date;
	DECLARE @Menge int;
	DECLARE @NahrungID int;
	DECLARE @PersonenID int;
	------------------------------			
	SELECT @Datum = Datum FROM inserted;
	SELECT @Menge = Menge FROM inserted;
	SELECT @NahrungID = NahrungID FROM inserted;
	SELECT @PersonenID = PersonenID FROM inserted;
	--
	DECLARE @Kaloriengehalt int;
	SET @Kaloriengehalt = [dbo].[sf_GetKaloriengehalt](@NahrungID);

	DECLARE @Kalorienzufuhr float;
	SET @Kalorienzufuhr = [dbo].[sf_GetKalorienzufuhr](@Menge, @Kaloriengehalt);
	
	INSERT INTO [dbo].[tb_LogBilanz]
		(Datum, PersonenID, KalorienZufuhr, KalorienVerbrauchGU, KalorienVerbrauchLU)
	SELECT   Datum,  @PersonenID, @Kalorienzufuhr, 0 , 0
	FROM inserted;	
END

GO
ALTER TABLE [dbo].[tb_Mahlzeiten] ENABLE TRIGGER [tr_MahlzeitKaloLog_INSERT]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Personen"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 159
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_AktivArt"
            Begin Extent = 
               Top = 165
               Left = 38
               Bottom = 279
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_PersoAktivZuordnung"
            Begin Extent = 
               Top = 45
               Left = 320
               Bottom = 167
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersoAktivArt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersoAktivArt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_PersoAktivZuordnung"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_AktivZeit"
            Begin Extent = 
               Top = 7
               Left = 448
               Bottom = 137
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Personen"
            Begin Extent = 
               Top = 115
               Left = 253
               Bottom = 263
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonAktivZeitDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonAktivZeitDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Personen"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Personen_weibl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Personen_weibl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[29] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_LogBilanz"
            Begin Extent = 
               Top = 25
               Left = 453
               Bottom = 200
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Personen"
            Begin Extent = 
               Top = 26
               Left = 121
               Bottom = 195
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1905
         Alias = 900
         Table = 1230
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonenLogBilanz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonenLogBilanz'
GO
USE [master]
GO
ALTER DATABASE [Kalorienbilanz] SET  READ_WRITE 
GO
