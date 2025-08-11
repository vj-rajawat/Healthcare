-- 1. INNER JOIN: Show all appointments with patient and doctor details
SELECT 
    a.Appointment_ID, 
    p.Name AS Patient_Name, 
    d.Name AS Doctor_Name, 
    a.Appointment_Date, 
    a.Diagnosis 
FROM Appointment a
INNER JOIN Patient p ON a.Patient_ID = p.Patient_ID
INNER JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID;

-- 2. LEFT JOIN: Show all patients with their bills (including those with no bills yet)
SELECT 
    p.Patient_ID, 
    p.Name AS Patient_Name, 
    b.Bill_ID, 
    b.Total_Amount, 
    b.Payment_Status 
FROM Patient p
LEFT JOIN Bill b ON p.Patient_ID = b.Patient_ID;

-- 3. RIGHT JOIN: Show all rooms with admission details (including rooms never assigned to patients)
SELECT 
    r.Room_ID, 
    r.Room_Number, 
    r.Type, 
    r.Status, 
    a.Patient_ID, 
    a.Admission_Date, 
    a.Discharge_Date 
FROM Admission a
RIGHT JOIN Room r ON a.Room_ID = r.Room_ID;

-- 4. FULL OUTER JOIN (MySQL doesn't support FULL JOIN directly, so we use UNION)
-- Show all patients and their appointments, including patients without appointments and appointments without matching patients.
SELECT 
    p.Patient_ID, 
    p.Name AS Patient_Name, 
    a.Appointment_ID, 
    a.Appointment_Date 
FROM Patient p
LEFT JOIN Appointment a ON p.Patient_ID = a.Patient_ID

UNION

SELECT 
    p.Patient_ID, 
    p.Name AS Patient_Name, 
    a.Appointment_ID, 
    a.Appointment_Date 
FROM Patient p
RIGHT JOIN Appointment a ON p.Patient_ID = a.Patient_ID;
