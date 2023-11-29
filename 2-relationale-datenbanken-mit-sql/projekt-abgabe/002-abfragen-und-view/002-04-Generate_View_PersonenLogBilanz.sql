USE [Kalorienbilanz]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_PersonenLogBilanz]
AS		
		
		SELECT TOP (100) PERCENT 
			dbo.tb_Personen.PersonenID, 
			dbo.tb_Personen.Nachname, 
			dbo.tb_Personen.Vorname, 
			dbo.tb_LogBilanz.Datum, 
			dbo.tb_LogBilanz.KalorienZufuhr, 
			dbo.tb_LogBilanz.KalorienVerbrauchGU, 
            dbo.tb_LogBilanz.KalorienVerbrauchLU
		FROM        
			dbo.tb_LogBilanz 
			RIGHT OUTER JOIN dbo.tb_Personen 
			ON dbo.tb_LogBilanz.PersonenID = dbo.tb_Personen.PersonenID
		ORDER BY dbo.tb_Personen.PersonenID, dbo.tb_LogBilanz.Datum DESC