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
CREATE OR ALTER FUNCTION sf_GetGUKonst
(
	@GeschlechtID int
)
RETURNS smallint
AS
BEGIN
	DECLARE @GUKonst smallint;

    SET @GUKonst = 
	(
		SELECT [GUKonst] 
		FROM [dbo].[tb_GUKonst]
		WHERE [dbo].[tb_GUKonst].[GeschlechtID] = @GeschlechtID
    );
    RETURN @GUKonst;

END
GO