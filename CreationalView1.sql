/* Script to create a view
*/
USE Soccer
GO

/*  Creational view that ranks the teams based the total goals they have scored this season which is calculated from the goals
the individual athletes have scored
*/
CREATE VIEW [TEAM RANKINGS] AS
SELECT TEAM.TEAM_NAME, TEAM.TEAM_HEAD_COACH, SUM([STATS].GOALS) AS TOTALGOALS 
FROM TEAM, [STATS], TEAM_ROSTER
WHERE [STATS].ATHLETE_ID = TEAM_ROSTER.ATHLETE_ID
AND TEAM_ROSTER.TEAM_ID = TEAM.TEAM_ID
GROUP BY TEAM.TEAM_NAME, [STATS].GOALS, TEAM.TEAM_HEAD_COACH
;
