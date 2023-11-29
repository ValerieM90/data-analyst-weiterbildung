USE [Kalorienbilanz]
GO

-- ===============================================================================
-- Author: Valerie Münz, Jan Pieplack, Marie-Kristin Sousa Ewerton, Kathy Su
-- Create date: 13.07.2023
-- Description: This script creates a database user for the DB Kalorienbilanz 
--				with specific rights regarding specific database objects. 
--				A database user must be created in order for a login (in this case:
--				login via SQL authentication) to have access to a database.
-- ===============================================================================


CREATE USER [KalorienbilanzBenutzer] FOR LOGIN [KalorienbilanzUser]
GO
use [Kalorienbilanz]
GO

-- rights of the database user

-- tb_Mahlzeiten

GRANT SELECT ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO
GRANT INSERT ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO
GRANT DELETE ON [dbo].[tb_Mahlzeiten] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO

-- tb_AktivZeit

GRANT SELECT ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO
GRANT INSERT ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO
GRANT DELETE ON [dbo].[tb_AktivZeit] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO

-- View_PersonenLogBilanz

GRANT SELECT ON [dbo].[View_PersonenLogBilanz] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO

-- View_PersonenLogBilanz

GRANT SELECT ON [dbo].[View_PersonenLogBilanzSumme] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO

-- sp_Backup_Kalorienbilanz_mit_Zeitstempel

GRANT EXECUTE ON [dbo].[sp_Backup_Kalorienbilanz_mit_Zeitstempel] TO [KalorienbilanzBenutzer]
GO
use [Kalorienbilanz]
GO


