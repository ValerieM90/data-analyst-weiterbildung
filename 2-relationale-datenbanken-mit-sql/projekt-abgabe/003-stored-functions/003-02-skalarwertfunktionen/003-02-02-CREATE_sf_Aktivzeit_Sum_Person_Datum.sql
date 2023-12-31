USE [Kalorienbilanz]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_Aktivzeit_Sum_Person_Datum]    Script Date: 10.07.2023 13:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE OR ALTER   FUNCTION [dbo].[sf_Aktivzeit_Sum_Person_Datum] 
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
