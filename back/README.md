# EHR MySQL

## Endpoints

- `GET /api/summary/patients/{patient_id}/`: Get summary for a specific patient's notes.


## Setup

Set environment variables for MySQL in the `.env` file.
```bash
MYSQL_ROOT_PASSWORD=my-secret-pw
MYSQL_DATABASE=ehr_system
```

## Run with docker

⚠️ You need to make sure the MySQL db is up before running the summarizer app.

```bash
docker-compose up --build
```

### Test

```bash
curl -X GET http://localhost:8080/api/summary/patients/1
```
