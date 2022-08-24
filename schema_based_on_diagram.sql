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
     total_amount DECIMAL,
     generated_at timestamp,
     payed_at timestamp,
     medical_history_id int,
     FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type varchar(50),
  name varchar(100)
);

CREATE TABLE invoices_items (
 id SERIAL PRIMARY KEY,  
 unit_price DECIMAL,
 quantity INT,
 total_price DECIMAL,
 invoices_id INT,
 treatment_id INT,
  FOREIGN KEY (invoices_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE medical_history_treatments(
    treatment_id  INT,
    medical_history_id INT,
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);