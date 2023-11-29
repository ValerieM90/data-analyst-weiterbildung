USE [Kalorienbilanz]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: 
-- Create date: 
-- Description: 
-- =============================================
CREATE OR ALTER FUNCTION sf_GetGebDat
(
	@PersonenID int
)
RETURNS date
AS
BEGIN
	DECLARE @GebDat date;

    SET @GebDat = 
	(
		SELECT [Geburtsdatum] 
		FROM [dbo].[tb_Personen]
		WHERE [dbo].[tb_Personen].[PersonenID] = @PersonenID
    );
    RETURN @GebDat;

END
GO