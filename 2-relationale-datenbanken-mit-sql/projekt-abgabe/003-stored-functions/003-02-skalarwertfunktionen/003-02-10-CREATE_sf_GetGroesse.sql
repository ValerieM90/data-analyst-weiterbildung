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
CREATE OR ALTER FUNCTION sf_GetGroesse
(
	@PersonenID int
)
RETURNS tinyint
AS
BEGIN
	DECLARE @Groesse tinyint;

    SET @Groesse = 
	(
		SELECT [Groesse] 
		FROM [dbo].[tb_Biometrie]
		WHERE [dbo].[tb_Biometrie].[PersonenID] = @PersonenID
    );
    RETURN @Groesse;

END
GO