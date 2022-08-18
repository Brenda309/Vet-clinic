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





