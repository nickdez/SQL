DROP DATABASE IF EXISTS med_center;
CREATE DATABASE med_center;
\c med_center;


CREATE TABLE Doctor
(
  doc_id SERIAL UNIQUE PRIMARY KEY,
  doc_name VARCHAR(200) NOT NULL,
  specialty VARCHAR(200) NOT NULL,
  FOREIGN KEY (center_id) REFERENCES Medical_Center(center_id)
);

CREATE TABLE Patient
(
  patient_id SERIAL PRIMARY KEY,
  patient_name VARCHAR(200) NOT NULL,
  patient_address VARCHAR(255) NOT NULL,
  patient_phone VARCHAR(15) NOT NULL
);

CREATE TABLE Visits
(
  visit_id SERIAL PRIMARY KEY,
  doc_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Diagnosis
(
  diagnosis_id SERIAL PRIMARY KEY,
  visit_id INTEGER NOT NULL,
  ailment VARCHAR(500) NOT NULL,
  FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);