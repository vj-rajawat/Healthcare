-- 1. Scalar Subquery in SELECT
-- Find each patient's name along with the total bill amount they have paid
SELECT 
    Patient.Name,
    (SELECT SUM(Bill.Total_Amount) 
     FROM Bill 
     WHERE Bill.Patient_ID = Patient.Patient_ID) AS Total_Bill
FROM Patient;

-- 2. Subquery in WHERE using IN
-- Get names of patients who have taken appointments with a doctor whose specialty is "Cardiology"
SELECT 
    Patient.Name
FROM Patient
WHERE Patient.Patient_ID IN (
    SELECT Appointment.Patient_ID
    FROM Appointment
    WHERE Appointment.Doctor_ID IN (
        SELECT Doctor.Doctor_ID
        FROM Doctor
        WHERE Doctor.Specialty = "Cardiology"
    )
);

-- 3. Subquery in WHERE using EXISTS (Correlated Subquery)
-- Find all doctors who have at least one patient admitted in a room of type "ICU"
SELECT 
    Doctor.Name
FROM Doctor
WHERE EXISTS (
    SELECT 1
    FROM Appointment
    JOIN Admission 
        ON Appointment.Patient_ID = Admission.Patient_ID
    JOIN Room
        ON Admission.Room_ID = Room.Room_ID
    WHERE Appointment.Doctor_ID = Doctor.Doctor_ID
      AND Room.Type = "ICU"
);

-- 4. Subquery in FROM clause
-- List each doctor's name and the number of appointments they have
SELECT 
    Doctor_Appointments.Doctor_Name,
    Doctor_Appointments.Total_Appointments
FROM (
    SELECT 
        Doctor.Name AS Doctor_Name,
        COUNT(Appointment.Appointment_ID) AS Total_Appointments
    FROM Doctor
    LEFT JOIN Appointment
        ON Doctor.Doctor_ID = Appointment.Doctor_ID
    GROUP BY Doctor.Name
) AS Doctor_Appointments;

-- 5. Nested Subquery with =
-- Find the patient who has paid the highest total bill amount
SELECT 
    Patient.Name
FROM Patient
WHERE Patient.Patient_ID = (
    SELECT Bill.Patient_ID
    FROM Bill
    GROUP BY Bill.Patient_ID
    ORDER BY SUM(Bill.Total_Amount) DESC
    limit 1
);
