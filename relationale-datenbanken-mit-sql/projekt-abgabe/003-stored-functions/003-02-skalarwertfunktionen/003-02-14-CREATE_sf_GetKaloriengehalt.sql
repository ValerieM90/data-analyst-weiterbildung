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
CREATE OR ALTER FUNCTION sf_GetKaloriengehalt
(
	@NahrungID int
)
RETURNS int
AS
BEGIN
	DECLARE @Kaloriengehalt int;

    SET @Kaloriengehalt = 
	(
		SELECT [Kaloriengehalt] 
		FROM [dbo].[tb_Nahrung]
		WHERE [dbo].[tb_Nahrung].[NahrungID] = @NahrungID
    );
    RETURN @Kaloriengehalt;

END
GO