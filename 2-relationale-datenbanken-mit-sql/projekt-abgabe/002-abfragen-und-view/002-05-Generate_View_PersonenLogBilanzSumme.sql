USE [Kalorienbilanz]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_PersonenLogBilanzSumme]
AS	


SELECT        
	TOP (100) PERCENT 
			dbo.tb_Personen.PersonenID, 
			dbo.tb_Personen.Nachname, 
			dbo.tb_Personen.Vorname, 
			dbo.tb_LogBilanz.Datum, 
			SUM(dbo.tb_LogBilanz.KalorienZufuhr) AS KaloZufuhr, 
			SUM(dbo.tb_LogBilanz.KalorienVerbrauchGU) AS KaloVerbrauchGU, 
			SUM(dbo.tb_LogBilanz.KalorienVerbrauchLU) AS KaloVerbrauchLU
	FROM    
			dbo.tb_LogBilanz 
		RIGHT OUTER JOIN
            dbo.tb_Personen ON dbo.tb_LogBilanz.PersonenID = dbo.tb_Personen.PersonenID
	GROUP BY dbo.tb_Personen.PersonenID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_LogBilanz.Datum
	ORDER BY dbo.tb_Personen.PersonenID, dbo.tb_LogBilanz.Datum DESC