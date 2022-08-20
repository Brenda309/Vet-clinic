/*Animals*/
/* Populate database with sample data. */

INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Agumon', 'Feb 3, 2020', True, 10.23, 0);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES (' Gabumon', 'Nov 15, 2018', True, 8.0, 2);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES (' Pikachu', 'Jan 7, 2021,', False, 15.04, 1);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Devimon', 'May 12 2017', True, 11.0, 5);

/* new data */
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Charmander','Feb 8, 2020', False, -11, 0); 
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Plantmon','Nov 15, 2021', True, -5.7, 2);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Squirtle','Apr 2, 1993', False, -12.13, 3);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Angemon','Jun 12, 2005', True, -45, 1);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Boarmon','Jun 7, 2005', True, 20.4, 7);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Blossom','Oct 13, 1998', True, 17, 3);
INSERT INTO Animals(name, date_of_birth, neutered, weight_kg, escape_attempts) VALUES ('Ditto','May 14, 2022', True, 22, 4);

*Update table*/ 

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
/*Owners*/
INSERT INTO Owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO Owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO Owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO Owners (full_name, age) VALUES ('Melody Pond',77);
INSERT INTO Owners (full_name, age) VALUES ('Dean Winchester',14);
INSERT INTO Owners (full_name, age) VALUES ('Jodie Whittaker',38);


/*Species*/
INSERT INTO Species (name) VALUES('Pokemon');
INSERT INTO Species (name) VALUES('Digimon');

 /* Modify your inserted animals so it includes the species_id value */
 BEGIN;
 UPDATE Animals
 SET species_id = 1
 WHERE name LIKE '%mon';

UPDATE Animals
SET species_id = 2
WHERE species_id IS NULL;
COMMIT;

/*Modify your inserted animals to include owner information (owner_id)*/
UPDATE Animals
SET  owners_id = 1
WHERE name =  'Agumon';

/*suggest by reviewer*/
UPDATE animals
   SET owners_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
   WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE Animals
SET  owners_id = 3
WHERE name = 'Devimon' ;

UPDATE Animals
SET  owners_id = 3
WHERE name = 'Plantmon';

UPDATE Animals
SET  owners_id = 4
WHERE name = 'Charmander';

 UPDATE Animals
SET  owners_id = 4
WHERE name ='Squirtle';

 UPDATE Animals
SET  owners_id = 4
WHERE name = 'Blossom';


UPDATE Animals
SET  owners_id = 5
WHERE name =  'Angemon'  

UPDATE Animals
SET  owners_id = 5
WHERE name =  'Boarmon';

COMMIT;

