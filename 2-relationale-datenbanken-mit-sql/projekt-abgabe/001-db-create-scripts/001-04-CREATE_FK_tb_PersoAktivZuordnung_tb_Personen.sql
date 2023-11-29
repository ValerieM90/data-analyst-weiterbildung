USE [Kalorienbilanz]
GO

ALTER TABLE [dbo].[tb_PersoAktivZuordnung]  WITH CHECK ADD  CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_Personen] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO

ALTER TABLE [dbo].[tb_PersoAktivZuordnung] CHECK CONSTRAINT [FK_tb_PersoAktivZuordnung_tb_Personen]
GO


