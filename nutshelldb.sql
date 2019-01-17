-- Creating a User
CREATE TABLE `Users` (
	`Name` TEXT NOT null,
	`Email` TEXT NOT null,
	`Password` TEXT NOT null,
	`DisplayName` TEXT NOT null
);

CREATE TABLE `Events` (
    `EventId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `Location`    TEXT NOT NULL,
    `Date`    TEXT NOT NULL,
    `UserId`    INTEGER NOT NULL,
    `isEdited`    BOOLEAN

    FOREIGN KEY(`UserId`)
 REFERENCES `Users`(`UserId`)
 ON DELETE cascade
);


CREATE TABLE `Messages` (
    `MessageId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `UserId`    INTEGER NOT NULL,
    `Text`    TEXT NOT NULL,
    `isEdited`    BOOLEAN,
    FOREIGN KEY(`UserId`)
 REFERENCES `Users`(`UserId`)
 ON DELETE cascade
);

CREATE TABLE `News` (
    `NewsId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId`    INTEGER NOT NULL,
    `Title`    TEXT NOT NULL,
    `Summary`    TEXT NOT NULL,
    `TimeStamp`    TEXT NOT NULL,
    `URL`    TEXT NOT NULL,
    `isEdited`    BOOLEAN,
    FOREIGN KEY(`UserId`)
 REFERENCES `Users`(`UserId`)
 ON DELETE cascade
);

CREATE TABLE `Tasks` (
    `TaskId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId`    INTEGER NOT NULL,
    `dueBy`    TEXT NOT NULL,
    `Name`    TEXT NOT NULL,
    `Status`    TEXT NOT NULL,
    `isEdited`    BOOLEAN,
    FOREIGN KEY(`UserId`)
 REFERENCES `Users`(`UserId`)
 ON DELETE cascade
);

CREATE TABLE `Relationship` (
    `RelId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId`    INTEGER NOT NULL,
    `FriendId`    INTEGER NOT NULL,
    FOREIGN KEY(`UserId`)
 REFERENCES `Users`(`UserId`)
 ON DELETE cascade
);