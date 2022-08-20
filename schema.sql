/* Database schema to keep the structure of entire database. */
/*Animals*/
CREATE TABLE Animals ( id INT GENERATED ALWAYS AS IDENTITY, 
name varchar(110), 
date_of_birth Date, 
escape_attempts INT, 
neutered  BOOLEAN, 
 weight_kg float);

/* Update the table by adding a new column */
ALTER TABLE Animals
 ADD species varchar(255);

/*Make sure that id is set as autoincremented PRIMARY KEY*/
ALTER TABLE Animals
ADD CONSTRAINT Animals_pk PRIMARY KEY (id);

/*Remove column species*/
ALTER TABLE Animals
DROP species;

/*Add column species_id which is a foreign key referencing species table*/
ALTER TABLE Animals
ADD COLUMN species_id INT;

ALTER TABLE Animals
ADD CONSTRAINT species_fk
FOREIGN KEY (species_id) 
REFERENCES Species (id);
/*Add column owner_id which is a foreign key referencing the owners table*/
ALTER TABLE Animals
ADD COLUMN owners_id INT;

ALTER TABLE Animals
ADD CONSTRAINT owners_fk
FOREIGN KEY (owners_id) 
REFERENCES Owners (id);

/*Owners*/
CREATE TABLE Owners (
 id SERIAL PRIMARY KEY,
 full_name varchar(111),
 age INT);

 /*species*/
 CREATE TABLE Species (
 id SERIAL PRIMARY KEY,
 name varchar(111));

 /*vets*/
CREATE TABLE Vets (
 id SERIAL PRIMARY KEY,
 name varchar(111),
 age INT,
 date_of_graduation Date);

/*Joining table*/
CREATE TABLE specializations(
  vet_id INT ,
  spicies_id INT ,
  PRIMARY KEY(vet_id, spicies_id));

/*Visitis*/
CREATE TABLE Visits(
  vet_id INT,
  animal_id INT,
  date_of_visit date,
  PRIMARY KEY(vet_id, animal_id, date_of_visit));


ALTER TABLE Visits 
ADD FOREIGN KEY(animal_id) 
REFERENCES Animals(id);

ALTER TABLE Visits 
ADD FOREIGN KEY(vet_id) 
REFERENCES Vets(id);

ALTER TABLE specializations 
ADD FOREIGN KEY(spicies_id) 
REFERENCES Species(id);

ALTER TABLE specializations 
ADD FOREIGN KEY(vet_id)
 REFERENCES Vets(id);