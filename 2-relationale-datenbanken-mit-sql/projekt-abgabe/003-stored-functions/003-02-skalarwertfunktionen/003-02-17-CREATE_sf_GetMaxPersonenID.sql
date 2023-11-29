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
CREATE OR ALTER FUNCTION sf_GetMaxPersonenID
(
)
RETURNS int
AS
BEGIN
	DECLARE @MaxPersonenID int;

    SET @MaxPersonenID = 
	(
		SELECT MAX ([PersonenID]) 
		FROM [dbo].[tb_Personen]
    );
    RETURN @MaxPersonenID;
END
GO