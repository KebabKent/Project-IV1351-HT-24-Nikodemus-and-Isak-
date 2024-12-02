-- Insert data into person
INSERT INTO person (given_name, surname) VALUES 
-- Instructors
('John',    'Doe'),				
('Jane',    'Smith'),
('Mark',    'Jones'),

-- Students
('Emily',   'Brown'),
('Michael', 'Taylor'),
('Laura',   'Wilson'),

-- Contact persons
('Chris',   'Davis'),
('Sophia',  'Martin'),
('Daniel',  'Jackson');			

-- Insert data into address
INSERT INTO address (street, zip_code, city) VALUES
('123 Elm St',    '10001', 'New York'),			
('456 Maple Ave', '20002', 'Washington'),
('789 Oak Blvd',  '30003', 'Atlanta'),
('101 Pine St',   '40004', 'San Francisco'),
('202 Birch Rd',  '50005', 'Chicago'),
('303 Cedar Dr',  '60006', 'Houston'),
('404 Spruce Ln', '70007', 'Miami'),
('505 Walnut Ct', '80008', 'Denver'),
('606 Ash St',    '90009', 'Seattle');				

-- Insert data into person_address
INSERT INTO person_address (address_id, person_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9);

-- Insert data into email
INSERT INTO email (email) VALUES
('john.doe@example.com'),
('jane.smith@example.com'),
('mark.jones@example.com'),
('emily.brown@example.com'),
('michael.taylor@example.com'),
('laura.wilson@example.com'),
('chris.davis@example.com'),
('sophia.martin@example.com'),
('daniel.jackson@example.com');

-- Insert data into person_email
INSERT INTO person_email (person_id, email_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9);

-- Insert data into phone_number
INSERT INTO phone_number (phone_number) VALUES
('1234567890'),
('0987654321'),
('5551234567'),
('4442221111'),
('3338885555'),
('2221119999'),
('7774443333'),
('8885552222'),
('9998887777');

-- Insert data into person_phone_number
INSERT INTO person_phone_number (person_id, phone_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9);

-- Insert data into instructor
-- person number = (20030628-xxxx)
INSERT INTO instructor (person_id, person_number, ensemble_capable) VALUES
(1, '198001010001', '1'),
(2, '198001010002', '0'),
(3, '198001010003', '1');

-- Insert data into instructor_availability
INSERT INTO instructor_availability (start_time, end_time, availability_status, instructor_id) VALUES
('2024-11-21 09:00:00', '2024-11-21 17:00:00', '1', 1),
('2024-11-22 09:00:00', '2024-11-22 17:00:00', '1', 2),
('2024-11-23 10:00:00', '2024-11-23 14:00:00', '1', 3),
('2024-11-24 12:00:00', '2024-11-24 18:00:00', '1', 1),
('2024-11-25 11:00:00', '2024-11-25 15:00:00', '1', 2);

-- Insert data into student 
-- person number = (20030628-xxxx)
INSERT INTO student (person_number, person_id) VALUES
('200001010001', 4),
('200001010002', 5),
('200001010003', 6);

-- Insert data into contact_person
INSERT INTO contact_person (relation, person_id) VALUES
('Parent',   7),
('Uncle grandpa', 8),
('Parent',   9);

-- Insert data into student_contact_person
INSERT INTO student_contact_person (contact_person_id, student_id) VALUES
(1, 1), (2, 2), (2, 3), (3, 3);





-- Insert data into instrument_type
INSERT INTO instrument_type (instrument_type) VALUES
('Piano'),
('Violin'),
('Guitar'),
('Flute'),
('Drums'),
('Cello'),
('Didgeridoo');

-- Insert data into instrument
INSERT INTO instrument (brand, monthly_price, instrument_type_id) VALUES
('Yamaha', 150, 1),
('Stradivarius', 200, 2),
('Fender', 100, 3),
('Pearl', 75, 4),
('Tama', 120, 5),
('Suzuki', 180, 6),
('bogan-blow-sticks', 2000, 7);

-- Insert data into instrument_expertise
INSERT INTO instrument_expertise (skill_level, instrument_type_id) VALUES
(1,     1), (2, 1), (3,     1),
(1,     2), (2, 2), (3,     2),
(1,     3), (2, 3), (3,     3),
(1,     4), (2, 4), (3,     4),
(1,     5), (2, 5), (3,     5),
(1,     6), (2, 6), (3,     6),
(1,     7), (2, 7), (3,     7);

-- Insert data into instructor_expertise
INSERT INTO instructor_expertise (instructor_id, instrument_expertise_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 3),
(3, 7);

-- Insert data into student_expertise
INSERT INTO student_expertise (student_id, instrument_expertise_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 7);

-- Insert data into rented_instrument
INSERT INTO rented_instrument (student_id, instrument_id, rent_date, return_by, time_of_return) VALUES
(1, 1, '2024-11-01', '2024-12-01', '2024-11-30 12:00:00'),
(2, 3, '2024-10-01', '2024-11-01', '2024-10-30 15:00:00'),
(3, 7, '2024-09-01', '2024-10-01', '2024-09-30 16:00:00');





-- Insert data into price_scheme        
-- Beginner, Intermediate, Advanced = 50, 100, 150
-- Individual, Group, Ensemble = 50, 100, 150
-- instructor pay 50%
INSERT INTO price_scheme (skill_level, lesson_type, lesson_price, instructor_pay) VALUES
('Beginner',     'Individual',     100.00, 50.00),
('Beginner',     'Group',     150.00, 75.00),
('Beginner',     'Ensemble',     200.00, 100.00),

('Intermediate', 	'Individual',     150.00, 75.00),
('Intermediate', 	'Group',     200.00, 100.00),
('Intermediate', 	'Ensemble',     250.00, 125.00),

('Advanced',     'Individual',     200.00, 100.00),
('Advanced',     'Group',     250.00, 125.00),
('Advanced',     'Ensemble',     300.00, 150.00);

-- Insert data into time_slot
INSERT INTO time_slot (start_time, end_time) VALUES
('2024-11-22 10:00:00', '2024-11-22 12:00:00'),
('2024-11-22 13:00:00', '2024-11-22 15:00:00'),
('2024-12-22 10:00:00', '2024-12-22 12:00:00'),
('2024-12-02 10:00:00', '2024-12-02 12:00:00');

-- Insert data into individual_lesson
INSERT INTO individual_lesson (student_id, instructor_id, time_slot_id, price_scheme_id) VALUES
(1, 1, 1, 1),
(3, 3, 2, 7),
(1, 1, 3, 4);

-- Insert data into group_lesson
INSERT INTO group_lesson (minimum_students, maximum_students, instructor_id, time_slot_id, price_scheme_id) VALUES
(3, 10, 2, 2, 2);

-- Insert data into ensemble
INSERT INTO ensemble (minimum_students, maximum_students, genre, instructor_id, time_slot_id, price_scheme_id) VALUES
(4, 15, 'Jazz', 2, 2, 6),
(5, 20, 'Classical', 1, 2, 6);





-- Insert data into sibling
INSERT INTO sibling (student_id, student_sibling_id) VALUES
(2, 3);

-- Insert data into discount
INSERT INTO discount (sibling_discount, start_of_discount) VALUES
(0.10, '2024-01-01 08:00:00'),
(0.15, '2024-02-01 08:00:00'),
(0.20, '2024-03-01 08:00:00');

