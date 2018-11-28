CREATE TABLE Program
	(progID INTEGER PRIMARY KEY, 
	name VARCHAR(100), 
	releaseDate DATE,
	runtime INTEGER, 
	budget INTEGER
);

CREATE TABLE Film
	(progID INTEGER PRIMARY KEY, 
	FOREIGN KEY(progID) 
		REFERENCES Program(progID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Serial
	(serialID INTEGER PRIMARY KEY, 
	name VARCHAR(50)
);

CREATE TABLE Platform
	(platformID INTEGER PRIMARY KEY, 
	name VARCHAR(25), 
	isNetwork BOOL
);

CREATE TABLE Season
	(serialID INTEGER, 
	seasonID INTEGER, 
	orderingPlatformID INTEGER,
	announceDate INTEGER, 
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

CREATE TABLE Episodes
	(progID INTEGER PRIMARY KEY, 
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

CREATE TABLE CrewPerson
	(crewID INTEGER PRIMARY KEY, 
	name VARCHAR(50), 
	birthdate DATE
);

CREATE TABLE RoleType
	(roleID CHAR(10) PRIMARY KEY
);

CREATE TABLE WorksOn
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

CREATE TABLE BroadcastSchedule
	(platformID INTEGER, 
	date DATE,
    time TIME,
	PRIMARY KEY(platformID, date, time),
	FOREIGN KEY(platformID)
		REFERENCES Platform(platformID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Broadcast
	(platformID INTEGER, 
	date DATE,
    time TIME,
	progID INTEGER, 
	dayOf DOUBLE,
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

CREATE TABLE Stream
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

CREATE TABLE User
	(reviewerID INTEGER PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE Critic
	(reviewerID INTEGER PRIMARY KEY, 
	name VARCHAR(50)
);

CREATE TABLE Review
	(reviewID INTEGER PRIMARY KEY, 
	rating DOUBLE, 
	progID INTEGER, 
	seasonID INTEGER
);

CREATE TABLE UserReview
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

CREATE TABLE CriticReview
	(reviewID INTEGER PRIMARY KEY, 
	title VARCHAR(250), 
	textExcerpt VARCHAR(1000),
	FOREIGN KEY(reviewID)
		REFERENCES Review(reviewID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE CriticWrites
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

CREATE TABLE Publication
	(publicationName VARCHAR(40) PRIMARY KEY
);

CREATE TABLE Publishes
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

CREATE TABLE Award
	(awardOrganization VARCHAR(50), 
	awardName VARCHAR(100), 
	date DATE,
	PRIMARY KEY(awardOrganization, awardName, date)
);

CREATE TABLE AwardForProgram
	(awardOrganization VARCHAR(50), 
	awardName VARCHAR(100), 
	date DATE, 
	progID INTEGER,
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

CREATE TABLE AwardForProgramForCrewPerson
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