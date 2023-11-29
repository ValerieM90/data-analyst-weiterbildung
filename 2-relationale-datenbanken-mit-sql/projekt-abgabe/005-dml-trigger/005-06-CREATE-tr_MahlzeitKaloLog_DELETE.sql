USE [Kalorienbilanz]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER TRIGGER [dbo].[tr_MahlzeitKaloLog_DELETE]
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

