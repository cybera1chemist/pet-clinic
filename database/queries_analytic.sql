-- Average years of experience for doctors in each department
SELECT dept.DepartmentName, AVG(d.YearsOfExperience) AS AvgExperience
FROM Doctor d
JOIN Department dept ON d.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName;

-- Doctor with the highest number of visits
SELECT d.FirstName, d.LastName, COUNT(vr.VisitID) AS NumVisits
FROM Doctor d
JOIN VisitRecord vr ON d.DoctorID = vr.DoctorID
GROUP BY d.DoctorID
ORDER BY NumVisits DESC
LIMIT 1;

-- Pet age distribution
SELECT Age, COUNT(*) AS PetCount
FROM Pet
GROUP BY Age
ORDER BY Age;