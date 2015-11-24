# Chaoran Huang 2015 at UNSW CSE
# MIT-licensed

use stackoverflow;

CREATE TABLE FeaturesDescription (
    Id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(60) NULL,
    Description Text
);

Create table UsersFeatures(
  Id INT NOT NULL PRIMARY KEY,
  UserId INT NOT NULL,
  FeatureValue DOUBLE NULL,
  NormalizedValue DOUBLE NULL
);

Create table PostFeatures(
  Id INT NOT NULL PRIMARY KEY,
  UserId INT NOT NULL,
  FeatureValue DOUBLE NULL,
  NormalizedValue DOUBLE NULL
);

Create table OtherFeatures(
  Id INT NOT NULL PRIMARY KEY,
  UserId INT NOT NULL,
  FeatureValue DOUBLE NULL,
  NormalizedValue DOUBLE NULL
);