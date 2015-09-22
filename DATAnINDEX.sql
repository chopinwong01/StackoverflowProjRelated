# Chaoran Huang 2015 at UNSW CSE
# Referenced Georgios Gousios 2013 code on GitHub
# MIT-licensed

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