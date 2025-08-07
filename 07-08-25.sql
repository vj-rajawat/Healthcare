use healthcare;

Select * from patient where gender = 'female';

Select name from doctor;

Select Room_Number from room where status = 'available' limit 1;

Select name from patient order by name desc;

Select age, gender from patient where age >= 25 and gender = 'female';

Select * from bill where Payment_Status = 'unpaid' or Payment_Status = 'pending';

select age from patient where age between 25 and 40;

select name from doctor where name like '%n' or name like 'a%';
 
 #Update my foreign in all table
 
Alter table appointment drop foreign key appointment_ibfk_1;
alter table admission drop foreign key admission_ibfk_1;
alter table bill drop foreign key bill_ibfk_1;
 
 alter table appointment add constraint fk_patient_appointment 
 foreign key (Patient_id) references patient(patient_id) on delete cascade;
 
 
 alter table appointment add constraint fk_doctor_appointment 
 foreign key (Doctor_ID) references doctor(doctor_id) on delete cascade;
 
 alter table bill add constraint fk_patient_bill
 foreign key (Patient_ID) references patient(patient_id) on delete cascade;
 
 alter table admission add constraint fk_patient_admission
 foreign key (Patient_ID) references patient(patient_id) on delete cascade;
 
alter table admission add constraint fk_room_admission
 foreign key (Room_ID) references room(room_id) on delete cascade;
 
 describe admission;
 
 select * from patient;
 select * from appointment;
 select * from bill;
 select * from doctor;
 select * from room;
 select * from admission;
 
 delete from patient where Patient_ID = 1;
 
 