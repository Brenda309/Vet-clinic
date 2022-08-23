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

 /*Vets*/

 CREATE TABLE Vets (
 id SERIAL PRIMARY KEY,
 name varchar(111),
 age INT,
 date_of_graduation date);
 
--  to drop a table that has depedencies
DROP TABLE if exists Vets cascade;

-- Create a "join table" called specializations to handle this relationship
DROP TABLE if exists Specializations cascade;

CREATE TABLE Specializations(
species_id INT,
vets_id INT,
PRIMARY KEY (species_id, vets_id),
FOREIGN Key (species_id) REFERENCES Species(id),
FOREIGN Key (vets_id) REFERENCES Vets(id));

-- Create a "join table" called visits to handle this relationship
DROP TABLE if exists Visits cascade;

CREATE TABLE Visits(
animals_id INT,
vets_id INT,
date_of_visit date,
FOREIGN Key (animals_id) REFERENCES Animals(id),
FOREIGN Key (vets_id) REFERENCES Vets(id));


-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);