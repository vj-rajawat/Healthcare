-- Stored Procedure to get appointments for a doctor between two dates

DELIMITER $$

CREATE PROCEDURE GetAppointmentsForDoctor(
    IN DoctorIDParameter INT,
    IN StartDate DATE,
    IN EndDate DATE
)
BEGIN
    SELECT 
        Appointment.Appointment_ID,
        Appointment.Patient_ID,
        Patient.Name AS Patient_Name,
        Appointment.Appointment_Date,
        Appointment.Diagnosis,
        Appointment.Prescription
    FROM Appointment
    INNER JOIN Patient 
        ON Appointment.Patient_ID = Patient.Patient_ID
    WHERE Appointment.Doctor_ID = DoctorIDParameter
      AND Appointment.Appointment_Date BETWEEN StartDate AND EndDate;
END $$

delimiter ;

CALL GetAppointmentsForDoctor(1, "2025-01-01", "2025-12-31");

-- Stored Function to get total bill amount for a patient
DELIMITER $$

CREATE FUNCTION GetTotalBillForPatient(PatientIDParameter INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE TotalAmount DECIMAL(10,2);

    SELECT SUM(Bill.Total_Amount)
    INTO TotalAmount
    FROM Bill
    WHERE Bill.Patient_ID = PatientIDParameter;
        RETURN IFNULL(TotalAmount, 0.00);
END $$

delimiter ;
SELECT GetTotalBillForPatient(2) AS Total_Bill;