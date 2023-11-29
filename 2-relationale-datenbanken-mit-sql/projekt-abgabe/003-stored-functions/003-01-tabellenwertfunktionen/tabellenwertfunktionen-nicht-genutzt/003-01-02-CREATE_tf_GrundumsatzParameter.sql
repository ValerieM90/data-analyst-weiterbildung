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
CREATE OR ALTER FUNCTION tf_GrundumsatzParameter
(        
        @PersonenID int
)
RETURNS TABLE 
AS
RETURN 
(
        SELECT
                dbo.tb_Personen.PersonenID,
                dbo.tb_Personen.Geburtsdatum,
                dbo.tb_Geschlecht.GeschlechtID,
                dbo.tb_Geschlecht.GeschlechtKat,
                dbo.tb_Biometrie.Gewicht,
                dbo.tb_Biometrie.Groesse,
                dbo.tb_GUKonst.GUKonst
        FROM
                dbo.tb_Biometrie
                INNER JOIN dbo.tb_Personen
                        ON dbo.tb_Biometrie.PersonenID = dbo.tb_Personen.PersonenID
                INNER JOIN dbo.tb_Geschlecht
                        ON dbo.tb_Personen.GeschlechtID = dbo.tb_Geschlecht.GeschlechtID
                INNER JOIN dbo.tb_GUKonst
                ON dbo.tb_Geschlecht.GeschlechtID = dbo.tb_GUKonst.GeschlechtID
        WHERE
                dbo.tb_Personen.PersonenID = @PersonenID
)
GO