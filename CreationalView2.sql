/*Use script to create a view
*/
USE Soccer
GO

/* View creates a new database that shows lists the last name of athletes
that are in an attacker position
*/
CREATE VIEW [ATTACKERS] AS
SELECT ATHLETE.ATHLETE_LAST_NAME AS ATTACKER FROM
TEAM_ROSTER, ATHLETE
WHERE ATHLETE.ATHLETE_ID = TEAM_ROSTER.ATHLETE_ID
AND ATHLETE_POSITION = 'Attacker';