# Chaoran Huang 2015 at UNSW CSE
# MIT-licensed

use stackoverflow;

CREATE TABLE Features (
    Id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(60) NULL,
    Value DOUBLE NULL,
    NormalizedValue DOUBLE NULL,
    Description Text
);