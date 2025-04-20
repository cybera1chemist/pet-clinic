-- Query latest visit record of a pet
SELECT vr.*
FROM VisitRecord vr
JOIN Pet p ON vr.PetID = p.PetID
WHERE p.Name = 'Coco'
ORDER BY vr.VisitDate DESC
LIMIT 1;

-- Query all pets and visit dates for a doctor
SELECT d.FirstName, d.LastName, p.Name, vr.VisitDate
FROM VisitRecord vr
JOIN Doctor d ON vr.DoctorID = d.DoctorID
JOIN Pet p ON vr.PetID = p.PetID
WHERE d.FirstName = 'Liam' AND d.LastName = 'Smith'
ORDER BY vr.VisitDate DESC;

-- Query full medical history for a pet
SELECT mh.*
FROM MedicalHistory mh
JOIN Pet p ON mh.PetID = p.PetID
WHERE p.Name = 'Coco';

-- Query all doctors in a department
SELECT d.*
FROM Doctor d
JOIN Department dept ON d.DepartmentID = dept.DepartmentID
WHERE dept.DepartmentName = 'Internal Medicine';