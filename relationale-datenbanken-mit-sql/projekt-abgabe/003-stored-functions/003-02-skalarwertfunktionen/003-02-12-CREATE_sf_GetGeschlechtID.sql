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
CREATE OR ALTER FUNCTION sf_GetGeschlechtID
(
	@PersonenID int
)
RETURNS int
AS
BEGIN
	DECLARE @GeschlechtID int;

    SET @GeschlechtID = 
	(
		SELECT [GeschlechtID] 
		FROM [dbo].[tb_Personen]
		WHERE [dbo].[tb_Personen].[PersonenID] = @PersonenID
    );
    RETURN @GeschlechtID;

END
GO