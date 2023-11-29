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
CREATE OR ALTER FUNCTION sf_GetLeistungsumsatz
(

	@Dauer int,
	@METWert float,
	@Gewicht int

)
RETURNS float
AS
BEGIN

	DECLARE @Leistungsumsatz float;
    SET @Leistungsumsatz = @METWert * 3.5 * @Gewicht * @Dauer / 200;
    RETURN @Leistungsumsatz;

END
GO