use healthcare;

show columns from patient;


INSERT INTO Patient (Name, Age, Gender, Address, Phone, Blood_Group) VALUES
('Rahul Sharma', 30, 'Male', 'Delhi, India', '9876543210', 'B+'),
( 'Anjali Mehta', 25, 'Female', 'Mumbai, India', '9123456780', 'O+'),
( 'Amit Singh', 40, 'Male', 'Pune, India', '9012345678', 'A-'),
( 'Priya Verma', 28, 'Female', 'Bangalore, India', '9786543210', 'AB+'),
( 'Vikram Patel', 50, 'Male', 'Ahmedabad, India', '9988776655', 'O-');

select * from patient;

INSERT INTO Doctor ( Name, Specialty, Phone, Email) VALUES
( 'Dr. Neha Gupta', 'Cardiologist', '9871112222', 'neha.gupta@hospital.com'),
( 'Dr. Ramesh Rao', 'Neurologist', '9865223344', 'ramesh.rao@hospital.com'),
( 'Dr. Kavita Nair', 'Pediatrician', '9854332211', 'kavita.nair@hospital.com'),
( 'Dr. Sameer Khan', 'Orthopedic', '9844332211', 'sameer.khan@hospital.com'),
( 'Dr. Meera Das', 'Dermatologist', '9822334455', 'meera.das@hospital.com');

select * from Doctor;

INSERT INTO Appointment (Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Diagnosis, Prescription) VALUES
(1001, 1, 1, '2025-08-01', 'High BP', 'Atenolol 50mg'),
(1002, 2, 2, '2025-08-02', 'Fever', 'Paracetamol 500mg'),
(1003, 3, 3, '2025-08-03', 'Migraine', 'Sumatriptan 25mg'),
(1004, 4, 4, '2025-08-04', 'Acne', 'Benzoyl Peroxide'),
(1005, 5, 5, '2025-08-05', 'Joint Pain', 'Ibuprofen 400mg');

select * from appointment;

INSERT INTO Room (Room_ID, Room_Number, Type, Status) VALUES
(1, 'R101', 'General', 'Available'),
(2, 'R102', 'ICU', 'Occupied'),
(3, 'R103', 'General', 'Available'),
(4, 'R104', 'Deluxe', 'Occupied'),
(5, 'R105', 'ICU', 'Available');
 
 select * from room;
 
 INSERT INTO Admission (Admission_ID, Patient_ID, Room_ID, Admission_Date, Discharge_Date) VALUES
(1, 1, 1, '2025-07-25', '2025-07-30'),
(2, 2, 2, '2025-07-28', NULL),
(3, 3, 3, '2025-07-20', '2025-07-22'),
(4, 4, 4, '2025-08-01', NULL),
(5, 5, 5, '2025-07-26', '2025-07-29');

select * from admission;

INSERT INTO Bill (Bill_ID, Patient_ID, Total_Amount, Payment_Status, Bill_Date) VALUES
(1, 1, 12000.00, 'Paid', '2025-07-30'),
(2, 2, 18000.50, 'Unpaid', '2025-08-02'),
(3, 3, 9500.75, 'Paid', '2025-07-22'),
(4, 4, 16000.00, 'Pending', '2025-08-03'),
(5, 5, 7000.00, 'Paid', '2025-07-29');

select * from bill;


update patient set name = 'Vijay Rajawat' where patient_id = 1;
select * from patient;

delete from admission where admission_id = 1; 

