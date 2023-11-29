USE [Kalorienbilanz]
GO
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


