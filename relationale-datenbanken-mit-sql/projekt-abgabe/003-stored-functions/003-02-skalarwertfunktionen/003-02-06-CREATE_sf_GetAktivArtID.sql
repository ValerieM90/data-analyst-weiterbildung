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
CREATE OR ALTER FUNCTION sf_GetAktivArtID
(
	@PersoAktivID int
)
RETURNS int
AS
BEGIN
	DECLARE @AktivArtID int;

    SET @AktivArtID = 
	(
		SELECT [AktivArtID] 
		FROM [dbo].[tb_PersoAktivZuordnung]
		WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID
    );
    RETURN @AktivArtID;

END
GO