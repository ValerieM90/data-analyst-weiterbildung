USE [Kalorienbilanz]
GO

/****** Object:  Trigger [dbo].[tr_AktivZeit24h_INSERT]    Script Date: 11.07.2023 07:18:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- This trigger prevents a row from being inserted 
-- in the [dbo].[tb_AktivZeit] table
-- when the AktivZeit would become > 24h.

CREATE OR ALTER   TRIGGER [dbo].[tr_AktivZeit24h_INSERT] 
ON [dbo].[tb_AktivZeit]
AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	DECLARE @PersoAktivID int;
	DECLARE @Datum date;
	------------------------------			
	SELECT @PersoAktivID = PersoAktivID FROM inserted;
	SELECT @Datum = Datum FROM inserted;

	DECLARE @DauerBisher smallint;
	DECLARE @PersonenID int;
	--
	SELECT @PersonenID = PersonenID
	FROM [dbo].[tb_PersoAktivZuordnung]
	WHERE [dbo].[tb_PersoAktivZuordnung].[PersoAktivID] = @PersoAktivID;
	--
	SELECT @DauerBisher = [dbo].[sf_Aktivzeit_Sum_Person_Datum](@PersonenID, @Datum);
	
	IF @DauerBisher > 1440
	BEGIN  
		RAISERROR ('Die maximale Aktivitaeten-Zeit für den Tag wurde überschritten. Bitte anpassen.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN 
	END;
END;

GO

ALTER TABLE [dbo].[tb_AktivZeit] ENABLE TRIGGER [tr_AktivZeit24h_INSERT]
GO


