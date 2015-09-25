# Chaoran Huang 2015 at UNSW CSE
# Reference: Georgios Gousios 2013 code on GitHub
# MIT-licensed

create database stackoverflow DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use stackoverflow;

CREATE TABLE Badges (
    Id INT NOT NULL PRIMARY KEY,
    UserId INT,
    Name VARCHAR(50),
    CreationDate DATETIME
);

CREATE TABLE Comments (
    Id INT NOT NULL PRIMARY KEY,
    PostId INT NOT NULL,
    Score INT NOT NULL DEFAULT 0,
    Text TEXT,
    CreationDate DATETIME,
    UserId INT NOT NULL,
    UserDisplayName VARCHAR(40)
);

CREATE TABLE Post_history (
    Id INT NOT NULL PRIMARY KEY,
    PostHistoryTypeId SMALLINT NOT NULL,
    PostId INT NOT NULL,
    RevisionGUID VARCHAR(36),
    CreationDate DATETIME,
    UserId INT NOT NULL,
    Text TEXT,
    UserDisplayName VARCHAR(40),
    Comment TEXT
);

CREATE TABLE Post_links (
    Id INT NOT NULL PRIMARY KEY,
    CreationDate DATETIME DEFAULT NULL,
    PostId INT NOT NULL,
    RelatedPostId INT NOT NULL,
    LinkTypeId INT DEFAULT NULL
);

CREATE TABLE Posts (
    Id INT NOT NULL PRIMARY KEY,
    PostTypeId SMALLINT,
    AcceptedAnswerId INT,
    ParentId INT,
    Score INT NULL,
    ViewCount INT NULL,
    Body text NULL,
    OwnerUserId INT NOT NULL,
    LastEditorUserId INT,
    LastEditDate DATETIME,
    LastActivityDate DATETIME,
    Title varchar(256) NOT NULL,
    Tags VARCHAR(256),
    AnswerCount INT NOT NULL DEFAULT 0,
    CommentCount INT NOT NULL DEFAULT 0,
    FavoriteCount INT NOT NULL DEFAULT 0,
    CreationDate DATETIME,
    ClosedDate DATETIME,
    CommunityOwnedDate DATETIME,
    LastEditorDisplayName VARCHAR(40),
    OwnerDisplayName VARCHAR(40)
);

CREATE TABLE Questions (
#When PostTypeId = 1
    Id INT NOT NULL PRIMARY KEY,
    AcceptedAnswerId INT,
    Score INT NULL,
    ViewCount INT NULL,
    Body text NULL,
    OwnerUserId INT NOT NULL,
    LastEditorUserId INT,
    LastEditDate DATETIME,
    LastActivityDate DATETIME,
    Title varchar(256) NOT NULL,
    Tags VARCHAR(256),
    AnswerCount INT NOT NULL DEFAULT 0,
    CommentCount INT NOT NULL DEFAULT 0,
    FavoriteCount INT NOT NULL DEFAULT 0,
    CreationDate DATETIME,
    ClosedDate DATETIME,
    CommunityOwnedDate DATETIME,
    LastEditorDisplayName VARCHAR(40),
    OwnerDisplayName VARCHAR(40)
);

CREATE TABLE Answers (
#When PostTypeId = 2
    Id INT NOT NULL PRIMARY KEY,
    ParentId INT,
    Score INT NULL,
    Body text NULL,
    OwnerUserId INT NOT NULL,
    LastEditorUserId INT,
    LastEditDate DATETIME,
    LastActivityDate DATETIME,
    Title varchar(256) NOT NULL,
    Tags VARCHAR(256),
    CommentCount INT NOT NULL DEFAULT 0,
    FavoriteCount INT NOT NULL DEFAULT 0,
    CreationDate DATETIME,
    ClosedDate DATETIME,
    CommunityOwnedDate DATETIME,
    LastEditorDisplayName VARCHAR(40),
    OwnerDisplayName VARCHAR(40)
);

CREATE TABLE Tags (
    Id INT NOT NULL PRIMARY KEY,
    TagName VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
    Count INT DEFAULT NULL,
    ExcerptPostId INT DEFAULT NULL,
    WikiPostId INT DEFAULT NULL
);

CREATE TABLE Users (
    Id INT NOT NULL PRIMARY KEY,
    Reputation INT NOT NULL,
    CreationDate DATETIME,
    DisplayName VARCHAR(50) NULL,
    LastAccessDate  DATETIME,
    Views INT DEFAULT 0,
    WebsiteUrl VARCHAR(256) NULL,
    Location VARCHAR(256) NULL,
    AboutMe TEXT NULL,
    Age INT,
    UpVotes INT,
    DownVotes INT,
    EmailHash VARCHAR(32),
    AccountId INT,
    ProfileImageUrl VARCHAR(256)
);

CREATE TABLE Votes (
    Id INT NOT NULL PRIMARY KEY,
    PostId INT NOT NULL,
    VoteTypeId SMALLINT,
    CreationDate DATETIME,
    UserId INT,
    BountyAmount INT
);

CREATE TABLE PostiveVotes (
#When VoteTypeId = 2 or 5
    Id INT NOT NULL PRIMARY KEY,
    PostId INT NOT NULL,
    CreationDate DATETIME,
    UserId INT,
    BountyAmount INT
);

CREATE TABLE NegativeVotes (
#When VoteTypeId = 3, 4, or 12
    Id INT NOT NULL PRIMARY KEY,
    PostId INT NOT NULL,
    CreationDate DATETIME,
    UserId INT,
    BountyAmount INT
);

CREATE TABLE User_accessHistory (
    Id INT NOT NULL PRIMARY KEY,
    UserId INT,
    accessDate DATETIME
);

CREATE TABLE Locations (
    Id INT NOT NULL PRIMARY KEY,
    Country VARCHAR(40),
    State VARCHAR(40),
    City VARCHAR(40),
    County VARCHAR(40)
);

CREATE TABLE Post_activeHistory (
    Id INT NOT NULL PRIMARY KEY,
    PostId INT,
    accessDate DATETIME
);

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Badges.xml'
INTO TABLE Badges
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Comments.xml'
INTO TABLE Comments
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/PostHistory.xml'
INTO TABLE Post_history
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/PostLinks.xml'
INTO TABLE Post_links
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Posts.xml'
INTO TABLE Posts
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Tags.xml'
INTO TABLE Tags
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Users.xml'
INTO TABLE Users
ROWS IDENTIFIED BY '<row>';

LOAD XML LOCAL INFILE '/Users/chaoran/Documents/Work/stackExchange/data/stackoverflow.com/Votes.xml'
INTO TABLE Votes
ROWS IDENTIFIED BY '<row>';


INSERT INTO Questions(Id, AcceptedAnswerId, Score, ViewCount, 
            Body, OwnerUserId, LastEditorUserId, 
            LastEditDate, LastActivityDate, Title,
            Tags, AnswerCount, CommentCount, 
            FavoriteCount, CreationDate, CommunityOwnedDate, 
            LastEditorDisplayName, OwnerDisplayName)
    SELECT  Id, AcceptedAnswerId, Score, ViewCount, 
            Body, OwnerUserId, LastEditorUserId, 
            LastEditDate, LastActivityDate, Title,
            Tags, AnswerCount, CommentCount, 
            FavoriteCount, CreationDate, CommunityOwnedDate, 
            LastEditorDisplayName, OwnerDisplayName
    FROM Posts WHERE PostTypeId = 1 ;

INSERT INTO Answers(Id, ParentId, Score, Body, 
            OwnerUserId,LastEditorUserId, LastEditDate, 
            LastActivityDate, Title, Tags, CommentCount, 
            FavoriteCount, CreationDate, CommunityOwnedDate, 
            LastEditorDisplayName, OwnerDisplayName)
    SELECT  Id, ParentId, Score, Body, 
            OwnerUserId,LastEditorUserId, LastEditDate, 
            LastActivityDate, Title, Tags, CommentCount, 
            FavoriteCount, CreationDate, CommunityOwnedDate, 
            LastEditorDisplayName, OwnerDisplayName
    FROM Posts WHERE PostTypeId = 2 ;

INSERT INTO PostiveVotes(Id, PostId, CreationDate, UserId, BountyAmount)
    SELECT  Id, PostId, CreationDate, UserId, BountyAmount
    FROM Votes WHERE VoteTypeId = 1 or VoteTypeId = 2 or VoteTypeId = 5 ;
  
INSERT INTO NegativeVotes(Id, PostId, CreationDate, UserId, BountyAmount)
    SELECT  Id, PostId, CreationDate, UserId, BountyAmount
    FROM Votes WHERE  VoteTypeId = 3 or VoteTypeId = 4 or VoteTypeId = 6 or 
                      VoteTypeId = 10 or VoteTypeId = 12 or VoteTypeId = 15 ;

CREATE INDEX badges_idx_1 ON badges(UserId);

CREATE INDEX Comments_idx_1 ON Comments(PostId);
CREATE INDEX Comments_idx_2 ON Comments(UserId);

CREATE INDEX Post_history_idx_1 ON Post_history(PostId);
CREATE INDEX Post_history_idx_2 ON Post_history(UserId);

CREATE INDEX Posts_idx_1 ON Posts(AcceptedAnswerId);
CREATE INDEX Posts_idx_2 ON Posts(ParentId);
CREATE INDEX Posts_idx_3 ON Posts(OwnerUserId);
CREATE INDEX Posts_idx_4 ON Posts(LastEditorUserId);
CREATE INDEX Posts_idx_5 ON Posts(PostTypeId);

CREATE INDEX Votes_idx_1 ON Votes(PostId);