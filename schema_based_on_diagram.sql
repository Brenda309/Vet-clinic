CREATE TABLE patients (
 id SERIAL PRIMARY KEY,
 name varchar(111),
 date_of_birth date);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at timestamp NOT NULL,
  patient_id int NOT NULL,
  status varchar(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE invoices(
     id SERIAL PRIMARY KEY,
     total_amount decimal,
     generated_at timestamp,
     payed_at timestamp,
     medical_history_id int,
     FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);