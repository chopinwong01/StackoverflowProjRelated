# Chaoran Huang 2015 at UNSW CSE
# MIT-licensed

use stackoverflow;

CREATE TABLE FeaturesDescription (
    Id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(60) NULL,
    Description Text
);

Create table UsersFeatures(
  Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  UserId INT NOT NULL,
  FeatureId INT NOT NULL,
  FeatureValue DOUBLE DEFAULT '0',
  NormalizedValue DOUBLE DEFAULT '0'
);

Create table PostFeatures(
  Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  PostId INT NOT NULL,
  FeatureId INT NOT NULL,
  FeatureValue DOUBLE DEFAULT '0',
  NormalizedValue DOUBLE DEFAULT '0'
);

Create table OtherFeatures(
  Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Note VARCHAR(20) DEFAULT 'LOCATION',
  Content text NULL,
  FeatureId INT NOT NULL DEFAULT '107',
  FeatureValue DOUBLE DEFAULT '0',
  NormalizedValue DOUBLE DEFAULT '0'
);

INSERT INTO UsersFeatures(UserId,FeatureId)
SELECT Users.Id as UId, FeaturesDescripiton.Id as FId
FROM Users join FeaturesDescripiton
WHERE FeaturesDescripiton.Id=101 or 102 or 103 or 104 or 105 or 106
                                 or 108 or 117 or 118 or 119 or 121
                                 or 129 or 201 or 206 or 207 or 209
                                 or 210 or 211 or 212 or 213 or 214
                                 or 215 or 217;

INSERT INTO PostFeatures(PostId,FeatureId)
SELECT Posts.Id as PId, FeaturesDescripiton.Id as FId
FROM Posts join FeaturesDescripiton
WHERE FeaturesDescripiton.Id=109 or 110 or 111 or 112 or 113 or 114
                 or 115 or 116 or 120 or 122 or 123
                                 or 124 or 125 or 126 or 127 or 128
                                 or 202 or 203 or 204 or 205 or 208
                                 or 216;
                                 

insert into OtherFeatures(Content,FeatureValue,NormalizedValue)
select Location,count(*),count(*) 
from stackoverflow.Users where Location is not NULL
group by location