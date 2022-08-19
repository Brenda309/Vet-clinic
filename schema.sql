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
/*Owners*/
CREATE TABLE Owners (
 id SERIAL PRIMARY KEY,
 full_name varchar(111),
 age INT,
 PRIMARY KEY(id));

 /*species*/
 CREATE TABLE Species (
 id SERIAL PRIMARY KEY,
 name varchar(111));

