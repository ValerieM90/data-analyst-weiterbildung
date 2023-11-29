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
CREATE OR ALTER FUNCTION sf_GetMETWert
(
	@AktivArtID int
)
RETURNS float
AS
BEGIN
	DECLARE @METWert float;

    SET @METWert = 
	(
		SELECT [METWert] 
		FROM [dbo].[tb_AktivArt]
		WHERE [dbo].[tb_AktivArt].[AktivArtID] = @AktivArtID
    );
    RETURN @METWert;

END
GO