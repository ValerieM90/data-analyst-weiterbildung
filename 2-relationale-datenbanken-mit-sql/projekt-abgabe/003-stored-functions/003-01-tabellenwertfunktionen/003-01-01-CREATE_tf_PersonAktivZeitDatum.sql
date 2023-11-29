USE Kalorienbilanz
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER FUNCTION tf_PersonAktivZeitDatum 
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

