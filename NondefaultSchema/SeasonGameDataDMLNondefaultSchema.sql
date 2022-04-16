/* Chloe Jaiswal
4/16/2022
DML Script to load data into games from 2022 season table non-defaul schema
*/ 

USE Soccer

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (1, 'Seattle Washington', '1-1', 5, 11, '2022 Challenge Cup', '3/18/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (2, 'Fullerton California', '1-3', 1, 5, '2022 Challenge Cup', '3/26/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (3, 'Portland Oregon', '1-0', 5, 1, '2022 Challenge Cup', '4/2/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (4, 'Fullerton California', '1-1', 1, 2, '2022 Challenge Cup', '3/19/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (6, 'Portland Oregon', '3-0', 11, 1, '2022 Challenge Cup', '3/30/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (7, 'San Diego California', '4-2', 2, 1, '2022 Challenge Cup', '4/2/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (8, 'Bridgeview Illinois', '1-2', 3, 14, '2022 Challenge Cup', '3/25/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (9, 'Bridgeview Illinois', '0-0', 3, 12, '2022 Challenge Cup', '3/30/2022');

INSERT INTO Soccer_League.SEASON_GAMES (GAME_ID, GAME_LOCATION, SCORE, HOME_TEAM_ID, AWAY_TEAM_ID, TOURNAMENT_NAME, GAME_DATE)
VALUES (10, 'Bridgeview Illinois', '2-0', 3, 13, '2022 Challenge Cup', '4/2/2022');