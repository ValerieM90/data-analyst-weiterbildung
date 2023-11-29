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
CREATE OR ALTER FUNCTION sf_GetPersonenID
(
	@PersoAktivID int
)
RETURNS int
AS
BEGIN
	DECLARE @PersonenID int;

    SET @PersonenID = 
	(
		SELECT [PersonenID] 
		FROM [dbo].[tb_PersoAktivZuordnung]
		WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID
    );
    RETURN @PersonenID;

END
GO