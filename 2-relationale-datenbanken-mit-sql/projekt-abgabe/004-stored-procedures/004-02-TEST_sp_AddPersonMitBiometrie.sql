DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback nvarchar(MAX); -- Fehlermeldungen etc.

-- geht nicht, weil Person bereits existiert
--EXEC [dbo].[sp_AddPersonMitBiometrie] 'Kathy', 'Su', '06.01.1992', 1, 42, 42, @Erfolg, @Feedback;

-- geht, weil neue Person
EXEC [dbo].[sp_AddPersonMitBiometrie] 'Kathy', 'Su', '16.01.1992', 1, 42, 42, @Erfolg OUTPUT, @Feedback OUTPUT;

SELECT
	@Erfolg AS 'Geklappt?',
	@Feedback AS 'Rückgabemeldung';
