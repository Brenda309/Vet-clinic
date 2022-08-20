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


-- What animals belong to Melody Pond?
SELECT Animals.name, owners.full_name 
FROM Owners
INNER JOIN Animals ON Owners.id = Animals.owners_id
WHERE full_name =' Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT Animals.name, Species.name  
FROM Animals
JOIN Species ON species_id = Species.id
WHERE Species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal
SELECT owners.full_name, Animals.name
FROM Owners
 JOIN Animals ON Owners.id = Animals.owners_id
WHERE Owners.id = Animals.owners_id
OR  Owners.id != Animals.owners_id;

--How many animals are there per species?
SELECT COUNT(*) FROM Animals, species
FROM Animals
JOIN Species ON species_id = Species.id
 GROUP BY species;



--List all Digimon owned by Jennifer Orwell.
SELECT Species.name, Animals.name, Owners.full_name
FROM Owners
JOIN Animals ON Owners.id = Animals.owners_id
JOIN Species ON species_id = Species.id
WHERE Species.id = 2  AND Owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.

SELECT Animals.name, Animals.escape_attempts, Owners.full_name
FROM Owners
JOIN Animals ON Owners.id = Animals.owners_id
WHERE Owners.full_name = 'Dean Winchester' AND escape_attempts <= 0;

SELECT full_name, COUNT(DISTINCT Animals.name) count FROM animals JOIN owners ON Animals.owners_id = owners.id
GROUP BY full_name ORDER BY count DESC LIMIT 1;