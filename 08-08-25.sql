use healthcare;

select * from patient;
select * from appointment;
select * from admission;
select * from bill;
select * from doctor;
select * from room;

select sum(total_amount) from bill;

select avg(age) from patient; 

select count(room_id) from room where status = 'Available';

select count(room_id) as Room_ID, status from room group by status;

select patient_id, count(total_amount) from bill group by patient_id having count(total_amount) = 7000;