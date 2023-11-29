USE [Kalorienbilanz]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:                <Author,,Name>
-- Create date: <Create Date,,>
-- Description:        <Description,,>
-- =============================================
CREATE OR ALTER FUNCTION tf_LeistungsumsatzParameter
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