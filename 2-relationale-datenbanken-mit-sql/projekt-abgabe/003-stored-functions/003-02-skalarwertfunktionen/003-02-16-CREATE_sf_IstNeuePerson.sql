USE [Kalorienbilanz]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   FUNCTION sf_IstNeuePerson
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


