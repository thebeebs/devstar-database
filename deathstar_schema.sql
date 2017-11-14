CREATE DATABASE deathstar;
USE deathstar;

CREATE TABLE DeathStars (
id int NOT NULL AUTO_INCREMENT,
startHealth INTEGER,
currentHealth INTEGER,
state VARCHAR(50),
PRIMARY KEY(id)
);

CREATE TABLE Games (
id int NOT NULL AUTO_INCREMENT,
startTime DATETIME NOT NULL DEFAULT NOW(),
endTime DATETIME NOT NULL,
timeLimit INTEGER,
deathStarId int,
gseDomains JSON,
PRIMARY KEY(id),
FOREIGN KEY (deathStarId)
    REFERENCES DeathStars(id)
);

CREATE TABLE Missions (
id int NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
gameId int,
PRIMARY KEY(id),
FOREIGN KEY (gameId)
    REFERENCES Games(id)
);

CREATE TABLE Squads (
id int NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
gameId int,
environment VARCHAR(50),
username VARCHAR(50),
PRIMARY KEY(id),
FOREIGN KEY (gameId)
    REFERENCES Games(id)
);

CREATE TABLE Microservices (
id int NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
gameId int,
environment VARCHAR(50),
created VARCHAR(255),
modified VARCHAR(255),
platform VARCHAR(50),
instances INTEGER,
memory VARCHAR(10),
status VARCHAR(50),
userName VARCHAR(50),
PRIMARY KEY(id),
FOREIGN KEY (gameId)
    REFERENCES Games(id)
);

CREATE TABLE SquadsMicroservices (
squadId int,
microserviceId int,
PRIMARY KEY(squadId, microserviceId),
FOREIGN KEY (squadId)
    REFERENCES Squads(id),
FOREIGN KEY (microserviceId)
    REFERENCES Microservices(id)
);

CREATE TABLE MissionsMicroservices (
microserviceId int,
missionId int,
score int,
PRIMARY KEY(missionId, microserviceId),
FOREIGN KEY (missionId)
    REFERENCES Missions(id),
FOREIGN KEY (microserviceId)
    REFERENCES Microservices(id)
);

CREATE TABLE Logs (
id int NOT NULL AUTO_INCREMENT,
time DATETIME NOT NULL DEFAULT NOW(),
gamesId int,
squadName VARCHAR(50),
microserviceName VARCHAR(50),
score int,
damage int,
type VARCHAR(50),
PRIMARY KEY(id),
FOREIGN KEY (gamesId)
    REFERENCES Games(id)
);

CREATE USER 'Captain'@'%' IDENTIFIED BY 'welcome1';

CREATE TABLE SecretTable (
    xCoordinate VARCHAR (30),
    yCoordinate VARCHAR (30),
    PRIMARY KEY (xCoordinate));

GRANT SELECT ON deathstar.SecretTable TO 'Captain'@'%';
