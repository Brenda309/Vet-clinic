/* Database schema to keep the structure of entire database. */
CREATE TABLE Animals ( id INT GENERATED ALWAYS AS IDENTITY, 
name varchar(110), 
date_of_birth Date, 
escape_attempts INT, 
neutered  BOOLEAN, 
 weight_kg float);

/* Update the table by adding a new column */
ALTER TABLE Animals
 ADD species varchar(255);
 

