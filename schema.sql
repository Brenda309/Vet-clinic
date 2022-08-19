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
 

/*Owners*/
CREATE TABLE Owners (
 id INT NOT NULL AUTO_INCREMENT,
 full_name varchar(111),
 age INT,
 PRIMARY KEY(id));

 /*species*/
 CREATE TABLE Species (
 id INT NOT NULL AUTO_INCREMENT,
 name varchar(111),
 PRIMARY KEY(id));