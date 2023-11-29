USE [Kalorienbilanz]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Valerie Münz
-- Create date: 07.07.2023
-- Description:	Skalarwertfunktion Zeitstempel
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_Zeitstempel] 
(
)
RETURNS char(18)
AS
BEGIN
	
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');
	
END
GO


