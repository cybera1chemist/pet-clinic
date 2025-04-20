Database: veterinary_clinic
----------------------------------------

📁 Directory Structure:

├── schema.sql  
├── data/  
│   ├── data_owner.sql  
│   ├── data_department.sql  
│   ├── data_doctor.sql  
│   ├── data_pet.sql  
│   ├── data_visitrecord.sql  
│   ├── data_medicalhistory.sql  
├── procedures.sql  
└── index.sql  

----------------------------------------

File Execution Order:

1. Create database:
   CREATE DATABASE veterinary_clinic;
   USE veterinary_clinic;

2. Import schema:
   mysql -u root -p veterinary_clinic < schema.sql

3. Import data (in order):
   mysql -u root -p veterinary_clinic < data/data_department.sql  
   mysql -u root -p veterinary_clinic < data/data_owner.sql  
   mysql -u root -p veterinary_clinic < data/data_doctor.sql  
   mysql -u root -p veterinary_clinic < data/data_pet.sql  
   mysql -u root -p veterinary_clinic < data/data_visitrecord.sql  
   mysql -u root -p veterinary_clinic < data/data_medicalhistory.sql  

4. Create indexes:
   mysql -u root -p veterinary_clinic < index.sql

5. Create stored procedures:
   mysql -u root -p veterinary_clinic < procedures.sql

6. Run practical queries (for testing):
   mysql -u root -p veterinary_clinic < queries_practical.sql

7. Run analytic queries (optional bonus):
   mysql -u root -p veterinary_clinic < queries_analytic.sql

----------------------------------------

Basic Commands:

- SHOW TABLES;             // List all tables  
- DESCRIBE TableName;      // View table structure  
- SELECT * FROM TableName; // View table data  

----------------------------------------

Supported Database Operations:

1. Query Operations:
- Retrieve all pets belonging to a specific owner  
- Get visit records for a specific pet or doctor  
- List all medical histories for a pet  
- Query all doctors in a specific department  
- Retrieve department info for a given doctor  
- Get visit history sorted by date for a pet  

2. Insert Operations:
- Add a new owner  
- Add a new pet for an existing owner  
- Add a new doctor under a department  
- Record a new visit for a pet  
- Add a new medical history record for a pet  

3. Update Operations:
- Update pet info (e.g. Name, Species)  
- Update doctor's department assignment  
- Change visit record status or notes  

4. Delete Operations:
- Delete a pet and cascade related visit & medical history  
- Remove a doctor (if no visits assigned)  
- Delete a specific visit record  

5. Stored Procedures (see procedures.sql)
- Example: Call `AddVisitRecord()` to insert a visit record with input parameters  

----------------------------------------

Environment:
- MySQL 8.x  
- Compatible with Visual Studio Code + SQL tools / MySQL Workbench  

----------------------------------------