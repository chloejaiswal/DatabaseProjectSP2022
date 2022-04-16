/*Chloe Jaiswal
4/15/2022
*/
USE Soccer
GO

/* Function parses the first name and last name together
*/
CREATE FUNCTION FullName (@FirstName VARCHAR(100), @LastName VARCHAR(100))
	RETURNS VARCHAR(400)
	AS
	BEGIN
	RETURN (SELECT @FirstName + SPACE(1) + @LastName)
	END
