USE [Kalorienbilanz]
GO

/****** Object:  Index [IX_PersoAktivZuordnung]    Script Date: 10.07.2023 15:31:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PersoAktivZuordnung] ON [dbo].[tb_PersoAktivZuordnung]
(
	[AktivArtID] ASC,
	[PersonenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


