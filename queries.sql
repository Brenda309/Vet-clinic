/*Animals*/

/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM Animals WHERE name LIKE '%mon'; 
SELECT name FROM Animals WHERE date_of_birth BETWEEN 'Jan, 1, 2016' AND 'Dec, 31, 2019';
SELECT name FROM Animals WHERE neutered = true AND escape_attempts < 3;
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

UPDATE Animals 
SET species  = 'pokemon'
WHERE species IS NULL;
COMMIT;

/*Delete a whole table and Rollback*/

BEGIN;
DELETE FROM Animals;
ROLLBACK;

/*Delete all animals born after Jan 1st, 2022*/
BEGIN;
DELETE FROM Animals
WHERE date_of_birth >  'Jan, 1, 2022';

/*Create a savepoint for the transaction.*/
BEGIN;
 SAVEPOINT SP1;

/*Update all animals' weight to be their weight multiplied by -1*/

UPDATE Animals
SET weight_kg = -1;

/*Rollback to the savepoint*/

ROLLBACK TO SP1;

/*Update all animals' weights that are negative to be their weight multiplied by -1*/

UPDATE Animals
SET weight_kg = -1
WHERE weight_kg < 0; 

/* Total number of animals in the table*/
SELECT COUNT(*) FROM Animals;

/* Animals have never tried to escape?*/

SELECT COUNT(*) FROM Animals
WHERE escape_attempts <= 0;

/* the average weight of animals?*/

SELECT AVG(weight_kg) FROM Animals;
/*  Escaped the most */
SELECT neutered, SUM(escape_attempts) FROM Animals GROUP BY neutered;

/*Min and max weight each animal species */

 SELECT species, MIN(weight_kg), Max(weight_kg) FROM Animals GROUP BY species;

/*AVG number of escape attempt for each animal species born  between 1990 and 2000*/

SELECT species, AVG(escape_attempts) FROM Animals 
 WHERE date_of_birth BETWEEN 'Jan, 1, 1990' AND 'Dec, 31, 2000'
 GROUP BY species;

/*Owners*/

 /*species*/