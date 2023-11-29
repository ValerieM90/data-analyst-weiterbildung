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
CREATE OR ALTER FUNCTION sf_GetGrundumsatz
(
	@Gewicht tinyint,
	@Groesse tinyint,
	@Age int,
	@GUKonst int
)
RETURNS float
AS
BEGIN
	DECLARE @Grundumsatz float;
	SET @Grundumsatz = (10 * @Gewicht) + (6.25 * @Groesse) - (5 * @Age) + @GUKonst;
	RETURN @Grundumsatz;
END
GO