/*Queries that show all of the data in the database
*/

USE Soccer

/* Shows the tables available in the database
*/
SELECT * FROM Soccer.INFORMATION_SCHEMA.TABLES;
GO

/* Query to show all the data in the Athlete table
*/
SELECT * FROM ATHLETE;

/* Query to show all the data in the Athlete Game Stats table
*/
SELECT * FROM ATHLETE_GAME_STATS;

/* Query to show all the data in the Season Games table
*/
SELECT * FROM SEASON_GAMES;

/* Query to show all the data in the Stats table
*/
SELECT * FROM [STATS];

/* Query to show all the data in the Team table
*/
SELECT * FROM TEAM;

/* Query to show all the data in the Team Roster table
*/
SELECT * FROM TEAM_ROSTER;

/* Query that shows the athlete name corresponding to the city they are from and the team they currently play for and orders by last name
*/
SELECT ATHLETE.ATHLETE_ID, ATHLETE.ATHLETE_FIRST_NAME, ATHLETE.ATHLETE_LAST_NAME, ATHLETE_CITY, TEAM.TEAM_NAME 
FROM TEAM_ROSTER, ATHLETE, TEAM
WHERE ATHLETE.ATHLETE_ID = TEAM_ROSTER.ATHLETE_ID
AND TEAM.TEAM_ID = TEAM_ROSTER.TEAM_ID
ORDER BY ATHLETE.ATHLETE_LAST_NAME;

/* Query that shows the athlete and the games they have played this season and orders by descending number of goals scored
*/

SELECT ATHLETE.ATHLETE_LAST_NAME, SEASON_GAMES.GAME_LOCATION, SEASON_GAMES.GAME_DATE, ATHLETE_GAME_STATS.GAME_TIME, 
ATHLETE_GAME_STATS.GOALS, ATHLETE_GAME_STATS.ASSISTS
FROM ATHLETE, SEASON_GAMES, ATHLETE_GAME_STATS
WHERE ATHLETE.ATHLETE_ID = ATHLETE_GAME_STATS.ATHLETE_ID
AND ATHLETE_GAME_STATS.GAME_ID = SEASON_GAMES.GAME_ID
ORDER BY ATHLETE_GAME_STATS.GOALS DESC;

/* Query that ranks the teams based the total goals they have scored this season which is calculated from the goals
the individual athletes have scored
*/
SELECT TEAM.TEAM_NAME, TEAM.TEAM_HEAD_COACH, SUM([STATS].GOALS) AS TOTALGOALS 
FROM TEAM, [STATS], TEAM_ROSTER
WHERE [STATS].ATHLETE_ID = TEAM_ROSTER.ATHLETE_ID
AND TEAM_ROSTER.TEAM_ID = TEAM.TEAM_ID
GROUP BY TEAM.TEAM_NAME, [STATS].GOALS, TEAM.TEAM_HEAD_COACH
ORDER BY TOTALGOALS DESC;
;

/* Query that shows  all of the games that the athlete Mallory pugh has played in along with her game stats
*/
SELECT SEASON_GAMES.GAME_DATE, SEASON_GAMES.GAME_LOCATION, ATHLETE_GAME_STATS.GAME_TIME,
ATHLETE_GAME_STATS.GOALS, ATHLETE_GAME_STATS.ASSISTS, ATHLETE_GAME_STATS.SHOTS, 
ATHLETE_GAME_STATS.SHOTS_ON_GOAL, ATHLETE_GAME_STATS.CORNER_KICKS, ATHLETE_GAME_STATS.OFFSIDES,
ATHLETE_GAME_STATS.FOULS_COMMITTED, ATHLETE_GAME_STATS.FOULS_SUSTAINED
FROM SEASON_GAMES, ATHLETE_GAME_STATS, ATHLETE
WHERE ATHLETE.ATHLETE_FIRST_NAME = 'Mallory'
AND ATHLETE.ATHLETE_ID = ATHLETE_GAME_STATS.ATHLETE_ID
AND ATHLETE_GAME_STATS.GAME_ID = SEASON_GAMES.GAME_ID;

/* Query that lists all the athletes that are an attacker for their team
*/
SELECT ATHLETE.ATHLETE_LAST_NAME AS ATTACKER FROM
TEAM_ROSTER, ATHLETE
WHERE ATHLETE.ATHLETE_ID = TEAM_ROSTER.ATHLETE_ID
AND ATHLETE_POSITION = 'Attacker'
ORDER BY ATHLETE.ATHLETE_LAST_NAME;