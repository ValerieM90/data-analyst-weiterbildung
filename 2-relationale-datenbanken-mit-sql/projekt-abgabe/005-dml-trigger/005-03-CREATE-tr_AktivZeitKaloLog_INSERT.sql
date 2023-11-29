USE [Kalorienbilanz]
GO

/****** Object:  Trigger [dbo].[tr_AktivZeitKaloLog_INSERT]    Script Date: 11.07.2023 13:06:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER TRIGGER [dbo].[tr_AktivZeitKaloLog_INSERT]
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


