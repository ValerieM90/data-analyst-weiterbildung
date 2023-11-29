USE [Kalorienbilanz]
GO

/****** Object:  Table [dbo].[tb_MahlzeitArt]    Script Date: 10.07.2023 15:30:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_MahlzeitArt](
	[MahlzeitArtID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Mahlzeitart] PRIMARY KEY CLUSTERED 
(
	[MahlzeitArtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


