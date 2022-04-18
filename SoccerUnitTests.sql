/* Chloe Jaiswal
4/17/2022 
Unit Testing
*/

/* 1. Execute first. Run in Soccer Database
Creates a new test class
*/
EXEC tSQLt.NewTestClass 'SoccerTests';
GO

/* 2. Execute second
Creates procedures for the test class
*/

-- Procedure 1 - 4 tests Athlete table

-- Procedure 1
CREATE PROCEDURE SoccerTests.[test Athlete table Athlete_ID]
AS
BEGIN
    DECLARE @expected INT; SET @expected = 1;
    DECLARE @actual INT;
    DECLARE @ATHLETE_ID INT; SET @ATHLETE_ID = 1;

------Fake Table
    EXEC tSQLt.FakeTable 'ATHLETE';

    INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
	VALUES(@ATHLETE_ID, 'Christen', 'Press', 33);
------Execution
    SELECT @actual = @ATHLETE_ID FROM ATHLETE;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 2
CREATE PROCEDURE SoccerTests.[test Athlete table Athlete_First_Name]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = 'Christen';
    DECLARE @actual VARCHAR(100);
    DECLARE @ATHLETE_FIRST_NAME VARCHAR(100); SET @ATHLETE_FIRST_NAME = 'Christen';

------Fake Table
    EXEC tSQLt.FakeTable 'ATHLETE';

    INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
	VALUES(1, @ATHLETE_FIRST_NAME, 'Press', 33);
------Execution
    SELECT @actual = @ATHLETE_FIRST_NAME FROM ATHLETE;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 3
CREATE PROCEDURE SoccerTests.[test Athlete table Athlete_Last_Name]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = 'Press';
    DECLARE @actual VARCHAR(100);
    DECLARE @ATHLETE_LAST_NAME VARCHAR(100); SET @ATHLETE_LAST_NAME = 'Press';

------Fake Table
    EXEC tSQLt.FakeTable 'ATHLETE';

    INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
	VALUES(1, 'Christen', @ATHLETE_LAST_NAME, 33);
------Execution
    SELECT @actual = @ATHLETE_LAST_NAME FROM ATHLETE;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 4
CREATE PROCEDURE SoccerTests.[test Athlete table Athlete_Age]
AS
BEGIN
    DECLARE @expected INT; SET @expected = 33;
    DECLARE @actual INT;
    DECLARE @ATHLETE_AGE INT; SET @ATHLETE_AGE = 33;

------Fake Table
    EXEC tSQLt.FakeTable 'ATHLETE';

    INSERT INTO ATHLETE(ATHLETE_ID, ATHLETE_FIRST_NAME, ATHLETE_LAST_NAME, ATHLETE_AGE) 
	VALUES(1, 'Christen', 'Press', @ATHLETE_AGE);
------Execution
    SELECT @actual = @ATHLETE_AGE FROM ATHLETE;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 5 tests Full Name user defined function
CREATE PROCEDURE SoccerTests.[test that Full Name given a first and last name]
AS
BEGIN
    DECLARE @actual VARCHAR(400);
    DECLARE @firstName VARCHAR(100); SET @firstName = 'Christen';
    DECLARE @lastName VARCHAR(100); SET @lastName = 'Press';

    SELECT @actual = dbo.FullName(@firstName, @lastName);

    DECLARE @expected VARCHAR(400); SET @expected = 'Christen Press';  
    EXEC tSQLt.AssertEquals @expected, @actual;

END;
GO

-- Procedure 6 tests Team Roster will NULL
CREATE PROCEDURE SoccerTests.[test that Team Roster table where athlete state can be null]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = NULL;
	DECLARE @actual VARCHAR(100); 
	DECLARE @ATHLETE_STATE VARCHAR(100); SET @ATHLETE_STATE = NULL;

------Fake Table
    EXEC tSQLt.FakeTable 'TEAM_ROSTER';

    INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (10,10, 'Greenock', @ATHLETE_STATE, 'United Kingdon', 'Wing', 10, '5 foot 10', '9/30/1996');
------Execution
    SELECT @actual = @ATHLETE_STATE FROM ATHLETE;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 7 tests Team Roster for insertion of values
CREATE PROCEDURE SoccerTests.[test that Team Roster table to verify insertion of values]
AS
BEGIN
  EXEC tSQLt.FakeTable 'TEAM_ROSTER';

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (1,1, 'Los Angeles', 'CA', 'USA', 'Attacker', 23, '5 foot 6', '12/29/1988');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (2,2, 'San Dimas', 'CA', 'USA', 'Attacker', 13, '5 foot 6', '7/2/1989');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (3,3, 'Highlands Ranch', 'CO', 'USA', 'Attacker', 9, '5 foot 4', '4/29/1998');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (4,4, 'Surrey', 'Canada', 'Attacker', 2, '5 foot 6', '5/7/1990');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (5,5, 'Cincinnati', 'OH', 'USA', 'Midfielder', 10, '5 foot 4', '5/14/1995');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (6,6, 'Buenos Aires', 'Argentina', 'Midfielder', 10, '5 foot 3', '5/31/1994');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (7,7, 'Fort Lauderdale', 'FL', 'USA', 'Defender', 33, '6 foot 2', '3/3/1999');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (8,8, 'Columbus', 'OH', 'USA', 'Midfielder', 20, '5 foot 8', '1/15/1993');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (9,9, 'Remedios de Escalada', 'Argentina', 'Attacker', 15, '6 foot 1', '4/3/1997');

	INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (10,10, 'Greenock', 'United Kingdon', 'Wing', 10, '5 foot 10', '9/30/1996');
 
  SELECT ATHLETE_CITY INTO #ActualValues FROM TEAM_ROSTER;
 
  CREATE TABLE #ExpectedValues (TEAM_ID INT NOT NULL,
	ATHLETE_ID INT NOT NULL,
	ATHLETE_CITY VARCHAR(100) NOT NULL,
	ATHLETE_STATE VARCHAR(100),
	ATHLETE_COUNTRY VARCHAR(100) NOT NULL,
	ATHLETE_POSITION VARCHAR(100) NOT NULL,
	ATHLETE_NUMBER INT NOT NULL,
	ATHLETE_HEIGHT VARCHAR(20) NOT NULL,
	ATHLETE_DOB VARCHAR(20) NOT NULL);
 
	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (1,1, 'Los Angeles', 'CA', 'USA', 'Attacker', 23, '5 foot 6', '12/29/1988');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (2,2, 'San Dimas', 'CA', 'USA', 'Attacker', 13, '5 foot 6', '7/2/1989');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (3,3, 'Highlands Ranch', 'CO', 'USA', 'Attacker', 9, '5 foot 4', '4/29/1998');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (4,4, 'Surrey', 'Canada', 'Attacker', 2, '5 foot 6', '5/7/1990');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (5,5, 'Cincinnati', 'OH', 'USA', 'Midfielder', 10, '5 foot 4', '5/14/1995');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (6,6, 'Buenos Aires', 'Argentina', 'Midfielder', 10, '5 foot 3', '5/31/1994');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (7,7, 'Fort Lauderdale', 'FL', 'USA', 'Defender', 33, '6 foot 2', '3/3/1999');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_STATE, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (8,8, 'Columbus', 'OH', 'USA', 'Midfielder', 20, '5 foot 8', '1/15/1993');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (9,9, 'Remedios de Escalada', 'Argentina', 'Attacker', 15, '6 foot 1', '4/3/1997');

	INSERT INTO #ExpectedValues(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (10,10, 'Greenock', 'United Kingdon', 'Wing', 10, '5 foot 10', '9/30/1996');
 
  EXEC tSQLt.AssertEqualsTable #ActualValues, #ExpectedValues;
END;
GO

-- Procedure 8 tests Team Roster table for position

CREATE PROCEDURE SoccerTests.[test that Team Roster table for position]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = 'Wing';
	DECLARE @actual VARCHAR(100); 
	DECLARE @ATHLETE_POSITION VARCHAR(100); SET @ATHLETE_POSITION = 'Wing';

------Fake Table
    EXEC tSQLt.FakeTable 'TEAM_ROSTER';

    INSERT INTO TEAM_ROSTER(TEAM_ID, ATHLETE_ID, ATHLETE_CITY, ATHLETE_COUNTRY, ATHLETE_POSITION,
	ATHLETE_NUMBER, ATHLETE_HEIGHT, ATHLETE_DOB) VALUES (10,10, 'Greenock', 'United Kingdon', @ATHLETE_POSITION, 10, '5 foot 10', '9/30/1996');

------Execution
    SELECT @actual = @ATHLETE_POSITION FROM TEAM_ROSTER;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 9 tests Games Stats table given an athlete ID and game ID returns the time the athlete played in game
CREATE PROCEDURE SoccerTests.[test that Game Stats table]
AS
BEGIN
    DECLARE @expected INT; SET @expected = 89;
	DECLARE @actual INT; 
	DECLARE @ATHLETE_GAME_TIME INT; SET @ATHLETE_GAME_TIME = 89;

    SELECT @actual = @ATHLETE_GAME_TIME FROM ATHLETE_GAME_STATS
	WHERE ATHLETE_ID = 5
	AND GAME_ID = 3;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 10 tests seaosn games stats table given a date and id returns location
CREATE PROCEDURE SoccerTests.[test that Season Game Stats table]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = 'Fullerton California';
	DECLARE @actual VARCHAR(100); 
	DECLARE @GAME_LOCATION VARCHAR(100); SET @GAME_LOCATION = 'Fullerton California';

    SELECT @actual = @GAME_LOCATION FROM SEASON_GAMES
	WHERE GAME_ID = 1
	AND GAME_DATE = '3/18/2022';

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

-- Procedure 11 tests team table given an id returns head coach
CREATE PROCEDURE SoccerTests.[test that Team table]
AS
BEGIN
    DECLARE @expected VARCHAR(100); SET @expected = 'Casey Stone';
	DECLARE @actual VARCHAR(100); 
	DECLARE @TEAM_HEAD_COACH VARCHAR(100); SET @TEAM_HEAD_COACH = 'Casey Stone';

    SELECT @actual = @TEAM_HEAD_COACH FROM TEAM
	WHERE TEAM_ID = 2;

------Assertion
    EXEC tSQLt.assertEquals @expected, @actual;
END;
GO

/* 3. Execute last
Command to run all tests
*/ 
EXEC tSQLt.RunAll;
GO
