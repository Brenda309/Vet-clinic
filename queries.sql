/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM Animals WHERE name LIKE '%mon'; 
SELECT name FROM Animals WHERE date_of_birth BETWEEN 'Jan, 1, 2016' AND 'Dec, 31, 2019';
SELECT name FROM Animals WHERE neutered= true AND escape_attempts < 3;
SELECT date_of_birth FROM Animals WHERE name = 'Agumon' OR  name = 'Pikachu';
SELECT name, escape_attempts FROM Animals WHERE weight_kg > 10.5;
SELECT * FROM Animals WHERE neutered = True;
SELECT * FROM Animals WHERE name != ' Gabumon';
SELECT * FROM Animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*Update table*/ 

BEGIN;
UPDATE Animals 
SET species  = 'unspecified';

/*Undo the chance*/ 

ROLLBACK;

/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.*/
BEGIN;
UPDATE Animals 
SET species  = 'digimon'
WHERE name LIKE '%mon';


/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set.*/
BEGIN;
UPDATE Animals 
SET species  = 'pokemon'
WHERE species IS NULL;
COMMIT;

/*Delete a whole table and Rollback*/

BEGIN;
DELETE FROM Animals;
ROLLBACK;

/*Delete all animals born after Jan 1st, 2022*/

DELETE FROM Animals;


