USE [Kalorienbilanz]
GO

ALTER TABLE [dbo].[tb_Nahrung]  WITH CHECK ADD  CONSTRAINT [CK_NahrungKaloriengehalt] CHECK  (([Kaloriengehalt]>(0)))
GO

ALTER TABLE [dbo].[tb_Nahrung] CHECK CONSTRAINT [CK_NahrungKaloriengehalt]
GO


