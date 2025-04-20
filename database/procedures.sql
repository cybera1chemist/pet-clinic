DELIMITER //

CREATE PROCEDURE AddVisitRecord (
  IN in_PetID INT,
  IN in_DoctorID INT,
  IN in_VisitDate DATE,
  IN in_Symptoms TEXT,
  IN in_Diagnosis TEXT,
  IN in_Treatment TEXT,
  IN in_Charge DECIMAL(10, 2)
)
BEGIN
  INSERT INTO VisitRecord (PetID, DoctorID, VisitDate, Symptoms, Diagnosis, Treatment, Charge)
  VALUES (in_PetID, in_DoctorID, in_VisitDate, in_Symptoms, in_Diagnosis, in_Treatment, in_Charge);
END //

CREATE PROCEDURE GetMedicalHistory (
  IN in_PetID INT
)
BEGIN
  SELECT * FROM MedicalHistory WHERE PetID = in_PetID;
END //

DELIMITER ;