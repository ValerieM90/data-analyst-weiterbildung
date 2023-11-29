USE [Kalorienbilanz]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_GetAge]    Script Date: 11.07.2023 07:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER FUNCTION [dbo].[sf_GetAge] 
(
	@GebDat date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Age int;
	DECLARE @Heute date;
	SET @Heute = GETDATE();
		
	IF (MONTH(@GebDat) > MONTH(@Heute)) -- Geburtsmonat erst später
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE IF (MONTH(@GebDat) = MONTH(@Heute) AND DAY(@GebDat) > DAY(@Heute))
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE SET @Age = DATEDIFF(YEAR, @GebDat, @Heute);

	-- Return the result of the function
	RETURN @Age;

END

GO


