# EHR MySQL

## Tables

- `patients`: Stores basic patient demographic details.
- `encounters`: Logs patient visits (encounters) with doctors.
- `notes`: Stores clinical notes written by healthcare providers during encounters.
- `providers`: Contains information about the doctors and healthcare providers.
- `departments`: Tracks hospital or clinic departments linked to encounters.


## Setup

Set environment variables for MySQL in the `.env` file.
```bash
MYSQL_ROOT_PASSWORD=my-secret-pw
MYSQL_DATABASE=ehr_system
```

## Run with docker

```bash
docker-compose up --build
```

### Test

```bash
docker exec -it ehr_mysql mysql -u root -p
# Insert your MYSQL_ROOT_PASSWORD
```

```sql
USE ehr_system;

-- List all patients
SELECT * FROM patients;

-- Retrieve notes for a specific patient
SELECT n.note_text, n.note_date
FROM notes n
JOIN encounters e ON n.encounter_id = e.encounter_id
WHERE e.patient_id = 1;
```