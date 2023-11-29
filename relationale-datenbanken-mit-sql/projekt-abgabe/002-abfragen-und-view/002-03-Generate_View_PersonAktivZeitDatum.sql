USE [Kalorienbilanz]
GO

/****** Object:  View [dbo].[View_PersonAktivZeitDatum]    Script Date: 10.07.2023 14:19:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PersonAktivZeitDatum]
AS
SELECT        dbo.tb_AktivZeit.Datum, dbo.tb_Personen.PersonenID, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, SUM(dbo.tb_AktivZeit.Dauer) AS SummeZeit
FROM            dbo.tb_PersoAktivZuordnung INNER JOIN
                         dbo.tb_AktivZeit ON dbo.tb_PersoAktivZuordnung.PersoAktivID = dbo.tb_AktivZeit.PersoAktivID INNER JOIN
                         dbo.tb_Personen ON dbo.tb_PersoAktivZuordnung.PersonenID = dbo.tb_Personen.PersonenID
GROUP BY dbo.tb_AktivZeit.Datum, dbo.tb_Personen.Nachname, dbo.tb_Personen.Vorname, dbo.tb_Personen.PersonenID
HAVING        (dbo.tb_AktivZeit.Datum = CONVERT(DATETIME, '2023-07-09 00:00:00', 102)) AND (dbo.tb_Personen.PersonenID = 2)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_PersoAktivZuordnung"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_AktivZeit"
            Begin Extent = 
               Top = 7
               Left = 448
               Bottom = 137
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Personen"
            Begin Extent = 
               Top = 115
               Left = 253
               Bottom = 263
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonAktivZeitDatum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PersonAktivZeitDatum'
GO


