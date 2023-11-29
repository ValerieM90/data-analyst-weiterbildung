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
CREATE OR ALTER FUNCTION sf_GetGewicht
(
	@PersonenID int
)
RETURNS tinyint
AS
BEGIN
	DECLARE @Gewicht tinyint;

    SET @Gewicht = 
	(
		SELECT [Gewicht] 
		FROM [dbo].[tb_Biometrie]
		WHERE [dbo].[tb_Biometrie].[PersonenID] = @PersonenID
    );
    RETURN @Gewicht;

END
GO