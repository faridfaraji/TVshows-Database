CREATE DATABASE IF NOT EXISTS untitled_review_website;
USE untitled_review_website;

CREATE USER IF NOT EXISTS 'application'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'applicationPASSWORD';

CREATE ROLE IF NOT EXISTS 'Administrator'@'localhost';
CREATE USER IF NOT EXISTS 'admin'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'adminPASSWORD';
GRANT 'Administrator'@'localhost' TO 'admin'@'localhost';

CREATE ROLE IF NOT EXISTS 'Critic'@'localhost';
CREATE USER IF NOT EXISTS 'scollura'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'scolluraPASSWORD';
GRANT 'Critic'@'localhost' TO 'scollura'@'localhost';
CREATE USER IF NOT EXISTS 'csiede'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'csiedePASSWORD';
GRANT 'Critic'@'localhost' TO 'csiede'@'localhost';
CREATE USER IF NOT EXISTS 'jrivera'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'jriveraPASSWORD';
GRANT 'Critic'@'localhost' TO 'jrivera'@'localhost';

REVOKE ALL PRIVILEGES, GRANT OPTION
FROM 'application'@'localhost';

GRANT SELECT
ON *
TO 'application'@'localhost';
# Dangerous, but no other way to do this
GRANT SELECT
ON mysql.role_edges
TO 'application'@'localhost';

GRANT DELETE, INSERT, UPDATE 
ON *
TO 'Administrator'@'localhost';

CREATE TABLE IF NOT EXISTS Program
	(progID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(100), 
	releaseDate DATE,
	runtime INTEGER, 
	budget INTEGER
);

CREATE TABLE IF NOT EXISTS Film
	(progID INTEGER PRIMARY KEY, 
	FOREIGN KEY(progID) 
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Serial
	(serialID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Platform
	(platformID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(25), 
	isNetwork BOOL
);

CREATE TABLE IF NOT EXISTS Season
	(serialID INTEGER, 
	seasonID INTEGER, 
	orderingPlatformID INTEGER,
	announceDate DATE, 
	renewed BOOL,
	PRIMARY KEY(serialID, seasonID),
	FOREIGN KEY(serialID)
		REFERENCES Serial(serialID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(orderingPlatformID)
		REFERENCES Platform(platformID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Episode
	(progID INTEGER PRIMARY KEY, 
	serialID INTEGER, 
	seasonID INTEGER,
    epID INTEGER,
	FOREIGN KEY(progID)
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(serialID, seasonID)
		REFERENCES Season(serialID, seasonID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS CrewPerson
	(crewID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50), 
	birthdate DATE
);

CREATE TABLE IF NOT EXISTS RoleType
	(roleID CHAR(10) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS WorksOn
	(progID INTEGER, 
	crewID INTEGER,
	roleID CHAR(10),
    creditedAs VARCHAR(100),
	PRIMARY KEY(progID, crewID, roleID),
	FOREIGN KEY(progID)
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(crewID)
		REFERENCES CrewPerson(crewID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(roleID)
		REFERENCES RoleType(roleID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS BroadcastSchedule
	(platformID INTEGER, 
	date DATE,
    time TIME,
	PRIMARY KEY(platformID, date, time),
	FOREIGN KEY(platformID)
		REFERENCES Platform(platformID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Broadcast
	(platformID INTEGER, 
	date DATE,
    time TIME,
	progID INTEGER, 
	dayOfViewers DOUBLE,
	dayOfShare DOUBLE,
	livePlusThree DOUBLE, 
	livePlusSeven DOUBLE,
	PRIMARY KEY(platformID, date, time, progID),
	FOREIGN KEY(platformID, date, time)
		REFERENCES BroadcastSchedule(platformID, date, time)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(progID) 
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Stream
	(platformID INTEGER, 
	progID INTEGER, 
	releaseDate DATE,
	PRIMARY KEY(platformID, progID),
	FOREIGN KEY(platformID)
		REFERENCES Platform(platformID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(progID)
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS User
	(reviewerID INTEGER PRIMARY KEY AUTO_INCREMENT,
	ip VARCHAR(50)
);
GRANT INSERT
ON User
TO 'application'@'localhost';

CREATE TABLE IF NOT EXISTS Critic
	(reviewerID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Review
	(reviewID INTEGER PRIMARY KEY AUTO_INCREMENT, 
	rating DOUBLE, 
	progID INTEGER, 
    serialID INTEGER,
	seasonID INTEGER,
    FOREIGN KEY(progID)
		REFERENCES Program(progID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY(serialID, seasonID)
		REFERENCES Season(serialID, seasonID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GRANT INSERT, UPDATE 
ON Review
TO 'application'@'localhost';

CREATE TABLE IF NOT EXISTS UserReview
	(reviewID INTEGER PRIMARY KEY, 
	reviewerID INTEGER,
	FOREIGN KEY(reviewID) 
		REFERENCES Review(reviewID) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(reviewerID) 
		REFERENCES User(reviewerID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
GRANT INSERT, UPDATE 
ON UserReview
TO 'application'@'localhost';

CREATE TABLE IF NOT EXISTS CriticReview
	(reviewID INTEGER PRIMARY KEY, 
	title VARCHAR(250), 
	textExcerpt VARCHAR(1000),
	FOREIGN KEY(reviewID)
		REFERENCES Review(reviewID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
GRANT DELETE, INSERT, UPDATE
ON CriticReview
TO 'Critic'@'localhost';

CREATE TABLE IF NOT EXISTS CriticWrites
	(reviewerID INTEGER, 
	reviewID INTEGER,
	PRIMARY KEY(reviewerID, reviewID),
	FOREIGN KEY(reviewerID) 
		REFERENCES Critic(reviewerID) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(reviewID) 
		REFERENCES CriticReview(reviewID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
GRANT DELETE, INSERT, UPDATE
ON CriticWrites
TO 'Critic'@'localhost';

CREATE TABLE IF NOT EXISTS Publication
	(publicationName VARCHAR(40) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Publishes
	(publicationName VARCHAR(40), 
	reviewID INTEGER, 
	date DATE,
	PRIMARY KEY(publicationName, reviewID),
	FOREIGN KEY(publicationName) 
		REFERENCES Publication(publicationName) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(reviewID) 
		REFERENCES CriticReview(reviewID) 
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
GRANT DELETE, INSERT, UPDATE
ON Publishes
TO 'Critic'@'localhost';

CREATE TABLE IF NOT EXISTS Award
	(awardOrganization VARCHAR(50), 
	awardName VARCHAR(100), 
	date DATE,
	PRIMARY KEY(awardOrganization, awardName, date)
);

CREATE TABLE IF NOT EXISTS AwardForProgram
	(awardOrganization VARCHAR(50), 
	awardName VARCHAR(100), 
	date DATE, 
	progID INTEGER,
    won BOOLEAN,
	PRIMARY KEY(awardOrganization, awardName, date, progID),
	FOREIGN KEY(awardOrganization, awardName, date) 
		REFERENCES Award(awardOrganization, awardName, date) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(progID) 
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS AwardForProgramForCrewPerson
	(awardOrganization VARCHAR(50), 
	awardName VARCHAR(100), 
	date DATE, 
	progID INTEGER, 
	crewID INTEGER,
	PRIMARY KEY(awardOrganization, awardName, date, progID, crewID),
	FOREIGN KEY(awardOrganization, awardName, date)
		REFERENCES Award(awardOrganization, awardName, date)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(progID) 
		REFERENCES Program(progID) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(crewID) 
		REFERENCES CrewPerson(crewID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE OR REPLACE VIEW UpcomingReleases (programID, showName, season, episode, 
	programName, releaseDate, currentCriticRating, currentUserRating) AS
(
	SELECT P.progID, ES.name, ES.seasonID, ES.epID, P.name, 
		DATE_FORMAT(P.releaseDate, '%M %e, %Y'), C.rating, U.rating
    FROM Program P
    LEFT JOIN (SELECT E.progID, E.serialID, E.seasonID, E.epID, S.name
		FROM Episode E
		LEFT JOIN Serial S
		ON S.serialID = E.serialID) ES
	ON ES.progID = P.progID
    LEFT JOIN 
    (SELECT R.progID, AVG(rating) AS rating 
		FROM Review R
		WHERE EXISTS (SELECT CR.reviewID
					  FROM CriticReview CR 
                      WHERE CR.reviewID = R.reviewID)
		GROUP BY (R.progID)) C
    ON P.progID = C.progID
    LEFT JOIN 
    (SELECT R.progID, AVG(rating) AS rating 
		FROM Review R
		WHERE EXISTS (SELECT UR.reviewID
					  FROM UserReview UR 
                      WHERE UR.reviewID = R.reviewID)
		GROUP BY (R.progID)) U
    ON P.progID = U.progID
    WHERE P.releaseDate >= (SELECT CURRENT_DATE())
    GROUP BY (P.progID)
    ORDER BY P.releaseDate ASC, ES.name ASC, P.progID ASC
);