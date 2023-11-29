USE [Kalorienbilanz]
GO

/****** Object:  Trigger [dbo].[tr_KundenINSERT]    Script Date: 11.07.2023 11:45:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER TRIGGER [dbo].[tr_MahlzeitKaloLog_INSERT]
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

