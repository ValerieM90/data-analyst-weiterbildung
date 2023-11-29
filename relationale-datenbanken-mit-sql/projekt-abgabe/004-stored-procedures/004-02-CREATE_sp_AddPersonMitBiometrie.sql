USE [Kalorienbilanz];
GO

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
CREATE OR ALTER PROCEDURE [dbo].[sp_AddPersonMitBiometrie]
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
