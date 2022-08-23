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

--Who owns the most animals?
SELECT Owners, COUNT(DISTINCT Animals.name) count FROM animals JOIN owners ON Animals.owners_id = owners.id
GROUP BY Owners ORDER BY count DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher

SELECT Animals.name,  Vets.name, Visits.date_of_visit
FROM Visits
JOIN Animals on Vets_id = Animals.id
JOIN Vets on Vets_id = Visits.animals_id
WHERE Vets.name = 'William Tatcher' Order by date_of_visit Desc ;

-- How many different animals did Stephanie Mendez see


-- How many different animals did Stephanie Mendez see?
SELECT name, COUNT(DISTINCT animal_id) FROM visits JOIN vets ON vet_id = vets.id
  WHERE name = 'Stephanie Mendez' GROUP BY name;

  -- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vet_id = vets.id
LEFT JOIN species ON species_id = species.id
ORDER BY vets.name, species.name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT Animals.name Animals
FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN 'April 1, 2020' AND 'August 30, 2020';

-- What animal has the most visits to vets?
SELECT animals.name animals, COUNT(animals.name) visited_times
FROM animals JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
GROUP BY animals.name
ORDER BY visited_times DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, date_of_visit
FROM visits JOIN vets ON vet_id = vets.id
JOIN animals ONanimal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;


-- Details for most recent visit: animal information, vets information, and date of visit.
SELECT animals.name animals, vets.name vets, visits.date_of_visit
FROM visits JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
ORDER BY visits.date_of_visit  DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(date_of_visit) FROM vets LEFT JOIN visits V ON V.vet_id = vets.id LEFT JOIN specializations S ON
  S.vet_id = vets.id LEFT JOIN animals ON animal_id = animals.id
  WHERE Animals.spicies_id NOT IN (SELECT spicies_id FROM specializations WHERE vet_id = vets.id) OR S.spicies_id IS NULL;


  -- How many visits were with a vets that did not specialize in that animal's species?

SELECT COUNT(vets.name) FROM vets
WHERE vets.id NOT IN (SELECT vet_id FROM specializations);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT  species.name,  count(*)
FROM visits JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id JOIN vets ON visits.vet_id = vets.id
GROUP BY species.name, vets.name HAVING vets.name = 'Maisy Smith'
ORDER BY count(*) DESC LIMIT 1;

--  queries to test
SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

-- Analyse
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
