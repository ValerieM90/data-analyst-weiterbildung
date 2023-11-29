USE [Kalorienbilanz];
GO

DECLARE	
		@PersonenID int,
		@Datum date

SET @PersonenID = 4; 
SET @Datum = '10.07.2023'; 


SELECT [dbo].[sf_Aktivzeit_Sum_Person_Datum] (@PersonenID, @Datum); 
