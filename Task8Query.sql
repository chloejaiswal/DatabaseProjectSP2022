/* Query that uses the creational view, TEAM RANKINGS
*/
USE Soccer
GO

/* Orders the creational view by the number of goals the team has scored
in descending order. Only lists the teams that have scored goals this 
season
*/
SELECT * FROM [TEAM RANKINGS]
WHERE [TEAM RANKINGS].TOTALGOALS > 0
ORDER BY [TEAM RANKINGS].TOTALGOALS DESC;

/* 
*/
