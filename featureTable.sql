# Chaoran Huang 2DEFAULT '0'15 at UNSW CSE
# MIT-licensed

use stackoverflow;

CREATE TABLE FeaturesDescription (
    Id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(6DEFAULT '0') NULL,
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
  FeatureId INT NOT NULL,
  FeatureValue DOUBLE DEFAULT '0',
  NormalizedValue DOUBLE DEFAULT '0'
);