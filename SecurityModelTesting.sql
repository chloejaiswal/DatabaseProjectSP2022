-- Chloe Jaiswal
-- 4/18/2022
-- Script tests security model

-- 1. Test as NSA role
EXECUTE AS USER = 'UnitedStates';

-- User should be able to view data from all tables using select function
SELECT * FROM ATHLETE;
SELECT * FROM TEAM;
SELECT * FROM TEAM_ROSTER;
SELECT * FROM ATHLETE_GAME_STATS;
SELECT * FROM SEASON_GAMES;
SELECT * FROM [STATS];

 -- User should be able to insert data into all of the tables
INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
VALUES(11, 'Christen', 'Press', 33);
-- Check statement was inserted
SELECT * FROM ATHLETE;

-- User should be able to delete data from all tables
DELETE FROM ATHLETE WHERE ATHLETE_ID = 11;
--Check statement was deleted
SELECT * FROM ATHLETE;

REVERT;
-------------------------------------------------------------------------------------------
-- 2. Test Team role
EXECUTE AS USER = 'SanDiegoFC';

-- User should be able to view data from all tables using select function
SELECT * FROM ATHLETE;
SELECT * FROM TEAM;
SELECT * FROM TEAM_ROSTER;
SELECT * FROM ATHLETE_GAME_STATS;
SELECT * FROM SEASON_GAMES;
SELECT * FROM [STATS];

-- User should be able to edit athlete, athlete game stats, and stats table
-- This includes insertion, selection, referencing
INSERT INTO [STATS] (ATHLETE_ID, NUM_APPEARANCES, GOALS, ASSISTS)
VALUES (11, 4, 4, 0);
-- Check insertion
SELECT * FROM [STATS];
-- Delete
DELETE FROM [STATS] WHERE ATHLETE_ID = 11;
-- Check deletion
SELECT * FROM [STATS];

-- User should be able to insert values into team, but not be able to delete
INSERT INTO TEAM(TEAM_ID, TEAM_NAME, TEAM_CITY, TEAM_STATE, TEAM_HEAD_COACH)
VALUES(15, 'Angle City FC', 'Los Angeles', 'CA', 'Freya Coombe');
-- Check insertion
SELECT * FROM TEAM;
-- Deletion should not work and raise error
DELETE FROM TEAM WHERE TEAM_ID = 15;
-- TO double check. Value should still be in the table
SELECT * FROM TEAM;

REVERT;
----------------------------------------------------------------------------------

-- 3. Test as Manager role
EXECUTE AS USER = 'CaseyStone';

-- User should be able to view data from all tables using select function
SELECT * FROM ATHLETE;
SELECT * FROM TEAM;
SELECT * FROM TEAM_ROSTER;
SELECT * FROM ATHLETE_GAME_STATS;
SELECT * FROM SEASON_GAMES;
SELECT * FROM [STATS];

-- User should be able to only view the other tables via selection. Should raise error
INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
VALUES(15, 'Christen', 'Press', 33);
-- To double check
SELECT * FROM ATHLETE;

REVERT;
--------------------------------------------------------------------------------------

-- 6. Tests a user with the fan role
EXECUTE AS USER = 'ChloeJaiswal';
-- User should be able to view data from all tables using select function
SELECT * FROM ATHLETE;
SELECT * FROM TEAM;
SELECT * FROM TEAM_ROSTER;
SELECT * FROM ATHLETE_GAME_STATS;
SELECT * FROM SEASON_GAMES;
SELECT * FROM [STATS];

-- This role should not have any other permissions. Attempt to edit will raise error
INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
VALUES(11, 'Christen', 'Press', 33);
-- Check statement was not inserted
SELECT * FROM ATHLETE;

-- User should not be able to delete data from all tables
DELETE FROM ATHLETE WHERE ATHLETE_ID = 11;
--Check
SELECT * FROM ATHLETE;