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
CREATE OR ALTER FUNCTION sf_GetKalorienzufuhr
(
	@Menge float,
	@Kaloriengehalt float
)
RETURNS float
AS
BEGIN
	DECLARE @Kalorienzufuhr float;
	SET @Kalorienzufuhr = (@Menge * @Kaloriengehalt)/100;
    RETURN @Kalorienzufuhr;
END
GO