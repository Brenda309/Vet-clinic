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

/*Vets*/
INSERT INTO Vets(name, age,  date_of_graduation) VALUES('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO Vets(name, age,  date_of_graduation) VALUES('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO Vets(name, age,  date_of_graduation) VALUES('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO Vets(name, age,  date_of_graduation) VALUES('Jack Harkness', 38, 'Jun 8, 2008');

 /*specializations*/
 INSERT INTO specializations (vet_id, spicies_id) VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vet_id, spicies_id) VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
    (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vet_id, spicies_id) VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
    (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specializations (vet_id, spicies_id) VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
    (SELECT id FROM species WHERE name = 'Digimon'));
/*Visits*/

INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  'May 24, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Agumon'),
  (SELECT id FROM Vets WHERE name = 'Stephanie Mendez'),
  'Jul 22, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Gabumon'),
  (SELECT id FROM Vets WHERE name = 'Jack Harkness'),
  'Feb 2, 2021');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Pikachu'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Jan 5, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Pikachu'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Mar 8, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Pikachu'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'May 14, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Devimon'),
  (SELECT id FROM Vets WHERE name = 'Stephanie Mendez'),
  'May 4, 2021');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Charmander'),
  (SELECT id FROM Vets WHERE name = 'Jack Harkness'),
  'Feb 24, 2021');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Plantmon'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Dec 21, 2019');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Plantmon'),
  (SELECT id FROM Vets WHERE name = 'William Tatcher'),
  'Aug 10, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name ='Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Apr 7, 2021');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Squirtle'),
  (SELECT id FROM Vets WHERE name = 'Stephanie Mendez'),
  'Sep 29, 2019');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Angemon'),
  (SELECT id FROM Vets WHERE name = 'Jack Harkness'),
  'Oct 3, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Angemon'),
  (SELECT id FROM Vets WHERE name = 'Jack Harkness'),
  'Nov 4, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Boarmon'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Jan 24, 2019');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Boarmon'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'May 15, 2019');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Boarmon'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Feb 27, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Boarmon'),
  (SELECT id FROM Vets WHERE name = 'Maisy Smith'),
  'Aug 3, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Blossom'),
  (SELECT id FROM Vets WHERE name = 'Stephanie Mendez'),
  'May 24, 2020');
INSERT INTO Visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM Animals WHERE name ='Blossom'),
  (SELECT id FROM Vets WHERE name = 'William Tatcher'),
  'Jan 11, 2021');

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

