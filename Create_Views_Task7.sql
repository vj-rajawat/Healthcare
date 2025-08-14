-- 1. Create a view to show detailed appointment information including doctor and patient names
CREATE VIEW View_Appointment_Details AS
SELECT 
    Appointment.Appointment_ID,
    Patient.Name AS Patient_Name,
    Doctor.Name AS Doctor_Name,
    Appointment.Appointment_Date,
    Appointment.Diagnosis,
    Appointment.Prescription
FROM Appointment
JOIN Patient 
    ON Appointment.Patient_ID = Patient.Patient_ID
JOIN Doctor 
    ON Appointment.Doctor_ID = Doctor.Doctor_ID;

-- Example usage of the view
SELECT * FROM View_Appointment_Details;


-- 2. Create a view to show patients with their total bill amounts
CREATE VIEW View_Patient_Billing AS
SELECT 
    Patient.Patient_ID,
    Patient.Name AS Patient_Name,
    SUM(Bill.Total_Amount) AS Total_Bill_Amount,
    COUNT(Bill.Bill_ID) AS Number_Of_Bills
FROM Patient
LEFT JOIN Bill 
    ON Patient.Patient_ID = Bill.Patient_ID
GROUP BY Patient.Patient_ID, Patient.Name;

-- Example usage of the view
SELECT * FROM View_Patient_Billing;


-- 3. Create a view to list all admissions with room details
CREATE VIEW View_Admission_Room_Details AS
SELECT 
    Admission.Admission_ID,
    Patient.Name AS Patient_Name,
    Room.Room_Number,
    Room.Type AS Room_Type,
    Room.Status AS Room_Status,
    Admission.Admission_Date,
    Admission.Discharge_Date
FROM Admission
JOIN Patient 
    ON Admission.Patient_ID = Patient.Patient_ID
JOIN Room 
    ON Admission.Room_ID = Room.Room_ID;

-- Example usage of the view
SELECT * FROM View_Admission_Room_Details;


-- 4. Create a view to show doctors and the number of patients they have treated
CREATE VIEW View_Doctor_Patient_Count AS
SELECT 
    Doctor.Doctor_ID,
    Doctor.Name AS Doctor_Name,
    COUNT(DISTINCT Appointment.Patient_ID) AS Number_Of_Patients
FROM Doctor
LEFT JOIN Appointment
    ON Doctor.Doctor_ID = Appointment.Doctor_ID
GROUP BY Doctor.Doctor_ID, Doctor.Name;

-- Example usage of the view
SELECT * FROM View_Doctor_Patient_Count;
