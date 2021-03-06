/* Chloe Jaiswal
4/9/2022
File to load using SSIS
*/
Use Soccer

IF OBJECT_ID(N'dbo.TEAM_ROSTER', N'U') IS NOT NULL
	DROP TABLE dbo.TEAM_ROSTER;
GO

IF OBJECT_ID(N'dbo.ATHLETE', N'U') IS NOT NULL
	DROP TABLE dbo.ATHLETE;
GO

IF OBJECT_ID(N'dbo.ATHLETE_GAME_STATS', N'U') IS NOT NULL
	DROP TABLE dbo.ATHLETE_GAME_STATS;
GO

IF OBJECT_ID(N'dbo.TEAM', N'U') IS NOT NULL
	DROP TABLE dbo.TEAM;
GO

IF OBJECT_ID(N'dbo.STATS', N'U') IS NOT NULL
	DROP TABLE dbo.[STATS];
GO

IF OBJECT_ID(N'dbo.SEASON_GAMES', N'U') IS NOT NULL
	DROP TABLE dbo.SEASON_GAMES;
GO

CREATE TABLE ATHLETE (
	ATHLETE_ID INT NOT NULL,
	ATHLETE_FIRST_NAME NVARCHAR(100) NOT NULL,
	ATHLETE_LAST_NAME NVARCHAR(100) NOT NULL,
	ATHLETE_AGE INT NOT NULL,
	PRIMARY KEY(ATHLETE_ID)
);

CREATE TABLE TEAM (
	TEAM_ID INT NOT NULL,
	TEAM_NAME NVARCHAR(100) NOT NULL,
	TEAM_CITY NVARCHAR(100) NOT NULL,
	TEAM_STATE NVARCHAR(100) NOT NULL,
	TEAM_HEAD_COACH NVARCHAR(100) NOT NULL,
	PRIMARY KEY(TEAM_ID)
);

CREATE TABLE TEAM_ROSTER (
	TEAM_ID INT NOT NULL,
	ATHLETE_ID INT NOT NULL,
	ATHLETE_CITY NVARCHAR(100) NOT NULL,
	ATHLETE_STATE NVARCHAR(100),
	ATHLETE_COUNTRY NVARCHAR(100) NOT NULL,
	ATHLETE_POSITION NVARCHAR(100) NOT NULL,
	ATHLETE_NUMBER INT NOT NULL,
	ATHLETE_HEIGHT NVARCHAR(20) NOT NULL,
	ATHLETE_DOB NVARCHAR(20) NOT NULL
	PRIMARY KEY(TEAM_ID),
	FOREIGN KEY (ATHLETE_ID) REFERENCES ATHLETE(ATHLETE_ID)
);

CREATE TABLE [STATS] (
	ATHLETE_ID INT NOT NULL,
	NUM_APPEARANCES INT NOT NULL,
	GOALS INT NOT NULL,
	ASSISTS INT NOT NULL,
	PRIMARY KEY(ATHLETE_ID)
);

CREATE TABLE SEASON_GAMES (
	GAME_ID INT NOT NULL,
	GAME_LOCATION NVARCHAR(100) NOT NULL,
	SCORE NVARCHAR(100) NOT NULL,
	HOME_TEAM_ID INT NOT NULL,
	AWAY_TEAM_ID INT NOT NULL,
	TOURNAMENT_NAME NVARCHAR(200),
	GAME_DATE NVARCHAR(100),
	PRIMARY KEY(GAME_ID)
);

CREATE TABLE ATHLETE_GAME_STATS (
	ATHLETE_ID INT NOT NULL,
	GAME_ID INT NOT NULL,
	GAME_TIME INT NOT NULL,
	GOALS INT NOT NULL,
	ASSISTS INT NOT NULL,
	SHOTS INT NOT NULL,
	SHOTS_ON_GOAL INT NOT NULL,
	CORNER_KICKS INT NOT NULL,
	OFFSIDES INT NOT NULL,
	FOULS_COMMITTED INT NOT NULL,
	FOULS_SUSTAINED INT NOT NULL,
);