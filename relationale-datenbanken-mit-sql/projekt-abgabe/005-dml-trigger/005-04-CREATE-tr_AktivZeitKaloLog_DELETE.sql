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
CREATE OR ALTER TRIGGER [dbo].[tr_AktivZeitKaloLog_DELETE]
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

ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeitKaloLog_INSERT]
GO


