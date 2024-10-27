-- Schema for EHR system
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('M', 'F', 'Other'),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

CREATE TABLE providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE encounters (
    encounter_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    department_id INT,
    encounter_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE notes (
    note_id INT AUTO_INCREMENT PRIMARY KEY,
    encounter_id INT,
    note_text TEXT,
    note_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (encounter_id) REFERENCES encounters(encounter_id)
);

-- Sample Data
INSERT INTO patients (first_name, last_name, dob, gender, phone, email, address)
VALUES ('John', 'Doe', '1990-05-15', 'M', '555-1234', 'john.doe@example.com', '123 Elm St'),
       ('Jane', 'Smith', '1985-10-02', 'F', '555-5678', 'jane.smith@example.com', '456 Oak St');

INSERT INTO providers (first_name, last_name, specialty, email)
VALUES ('Alice', 'Brown', 'Cardiology', 'alice.brown@hospital.com'),
       ('Bob', 'Johnson', 'Neurology', 'bob.johnson@hospital.com');

INSERT INTO departments (name) VALUES ('Cardiology'), ('Neurology');

INSERT INTO encounters (patient_id, provider_id, department_id, reason)
VALUES (1, 1, 1, 'Routine cardiac check-up'), 
       (2, 2, 2, 'Headache and dizziness');

INSERT INTO notes (encounter_id, note_text)
VALUES (1, 'Patient reports mild chest pain. No significant ECG changes. Continue monitoring.'),
       (2, 'Patient has migraines for the past week. Prescribed medication for relief.');
