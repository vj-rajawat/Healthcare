create database healthcare;

show databases;

use healthcare;

CREATE TABLE Patient (
         Patient_ID INT PRIMARY KEY,
         Name VARCHAR(100) NOT NULL,
         Age INT,
         Gender VARCHAR(10),
         Address TEXT,
         Phone VARCHAR(15),
         Blood_Group VARCHAR(5)
     );

CREATE TABLE Doctor (
         Doctor_ID INT PRIMARY KEY,
         Name VARCHAR(100) NOT NULL,
         Specialty VARCHAR(100),
         Phone VARCHAR(15),
         Email VARCHAR(100)
     );

 CREATE TABLE Appointment (
         Appointment_ID INT PRIMARY KEY,
         Patient_ID INT NOT NULL,
         Doctor_ID INT NOT NULL,
         Appointment_Date DATE NOT NULL,
         Diagnosis TEXT,
         Prescription TEXT,
         FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
         FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
     );

CREATE TABLE Room (
         Room_ID INT PRIMARY KEY,
         Room_Number VARCHAR(10) UNIQUE NOT NULL,
         Type VARCHAR(50),
         Status VARCHAR(20) CHECK (Status IN ('Available', 'Occupied'))
     );

 CREATE TABLE Admission (
         Admission_ID INT PRIMARY KEY,
         Patient_ID INT NOT NULL,
         Room_ID INT NOT NULL,
         Admission_Date DATE NOT NULL,
         Discharge_Date DATE,
         FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
         FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
     );

 CREATE TABLE Bill (
         Bill_ID INT PRIMARY KEY,
         Patient_ID INT NOT NULL,
         Total_Amount DECIMAL(10,2) NOT NULL,
         Payment_Status VARCHAR(20) CHECK (Payment_Status IN ('Paid', 'Unpaid', 'Pending')),
         Bill_Date DATE NOT NULL,
         FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
     );

