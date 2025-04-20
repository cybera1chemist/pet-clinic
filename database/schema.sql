CREATE TABLE Owner (
  OwnerID INT PRIMARY KEY AUTO_INCREMENT,
  Phone VARCHAR(20),
  Address VARCHAR(100),
  Email VARCHAR(50)
);

CREATE TABLE Pet (
  PetID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(50),
  Age INT,
  Gender ENUM('Male', 'Female'),
  Species VARCHAR(30),
  OwnerID INT,
  FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID)
);

CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
  DepartmentName VARCHAR(100),
  Location VARCHAR(100)
);

CREATE TABLE Doctor (
  DoctorID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Specialisation VARCHAR(100),
  Phone VARCHAR(20),
  Email VARCHAR(50),
  YearsOfExperience INT,
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE VisitRecord (
  VisitID INT PRIMARY KEY AUTO_INCREMENT,
  PetID INT,
  DoctorID INT,
  VisitDate DATE,
  Symptoms TEXT,
  Diagnosis TEXT,
  Treatment TEXT,
  Charge DECIMAL(10, 2),
  FOREIGN KEY (PetID) REFERENCES Pet(PetID),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE MedicalHistory (
  HistoryID INT PRIMARY KEY AUTO_INCREMENT,
  PetID INT,
  `Condition` VARCHAR(100),
  DateDiagnosed DATE,
  Status VARCHAR(50),
  FOREIGN KEY (PetID) REFERENCES Pet(PetID)
);