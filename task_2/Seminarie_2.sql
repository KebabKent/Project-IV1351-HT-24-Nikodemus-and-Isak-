CREATE TABLE address (
 address_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 street VARCHAR(50) NOT NULL,
 zip_code VARCHAR(50) NOT NULL,
 city VARCHAR(50) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (address_id);


CREATE TABLE discount (
 discount_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibling_discount FLOAT(20) NOT NULL,
 start_of_discount TIMESTAMP(6) NOT NULL
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (discount_id);


CREATE TABLE email (
 email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);


CREATE TABLE instrument_type (
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(50)
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 given_name VARCHAR(50) NOT NULL,
 surname VARCHAR(50) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE person_address (
 address_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE person_address ADD CONSTRAINT PK_person_address PRIMARY KEY (address_id,person_id);


CREATE TABLE person_email (
 person_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE phone_number (
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(12) NOT NULL UNIQUE
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (phone_id);


CREATE TYPE skills AS ENUM('Beginner', 'Intermediate', 'Advanced');						--///////////////////////////
CREATE TYPE lessontypes AS ENUM('Individual', 'Group', 'Ensemble');						--///////////////////////////

CREATE TABLE price_scheme (
 price_scheme_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level SKILLS NOT NULL,
 lesson_type LESSONTYPES NOT NULL,
 lesson_price FLOAT(20) NOT NULL, 
 instructor_pay FLOAT(20) NOT NULL
);

ALTER TABLE price_scheme ADD CONSTRAINT PK_price_scheme PRIMARY KEY (price_scheme_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE time_slot (
 time_slot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id);


CREATE TABLE contact_person (
 contact_person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 relation VARCHAR(50),
 person_id INT NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 ensemble_capable BIT(1) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_availability (
 availability_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL,
 availability_status BIT(1) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_availability ADD CONSTRAINT PK_instructor_availability PRIMARY KEY (availability_id);


CREATE TABLE instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 brand VARCHAR(50) NOT NULL,
 monthly_price INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE instrument_expertise (
 instrument_expertise_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level SKILLS NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE instrument_expertise ADD CONSTRAINT PK_instrument_expertise PRIMARY KEY (instrument_expertise_id);


CREATE TABLE person_phone_number (
 person_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE person_phone_number ADD CONSTRAINT PK_person_phone_number PRIMARY KEY (person_id,phone_id);


CREATE TABLE rented_instrument (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 rent_date DATE NOT NULL,
 return_by DATE NOT NULL,
 time_of_return TIMESTAMP(6) NOT NULL
);

ALTER TABLE rented_instrument ADD CONSTRAINT PK_rented_instrument PRIMARY KEY (student_id,instrument_id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 student_sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,student_sibling_id);


CREATE TABLE student_contact_person (
 contact_person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_contact_person ADD CONSTRAINT PK_student_contact_person PRIMARY KEY (contact_person_id,student_id);


CREATE TABLE student_expertise (
 student_id INT NOT NULL,
 instrument_expertise_id INT NOT NULL
);

ALTER TABLE student_expertise ADD CONSTRAINT PK_student_expertise PRIMARY KEY (student_id,instrument_expertise_id);


CREATE TABLE ensemble (
 ensemble_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 minimum_students INT NOT NULL,
 maximum_students INT NOT NULL,
 genre VARCHAR(50) NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 price_scheme_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);


CREATE TABLE group_lesson (
 group_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 minimum_students INT NOT NULL,
 maximum_students INT NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 price_scheme_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 price_scheme_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE instructor_expertise (
 instructor_id INT NOT NULL,
 instrument_expertise_id INT NOT NULL
);

ALTER TABLE instructor_expertise ADD CONSTRAINT PK_instructor_expertise PRIMARY KEY (instructor_id,instrument_expertise_id);


CREATE TABLE student_ensemble (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE student_group_lesson (
 student_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_lesson_id);


ALTER TABLE person_address ADD CONSTRAINT FK_person_address_0 FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE;
ALTER TABLE person_address ADD CONSTRAINT FK_person_address_1 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;

ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (email_id) ON DELETE CASCADE;


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id) ON DELETE CASCADE;


ALTER TABLE instrument_expertise ADD CONSTRAINT FK_instrument_expertise_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id) ON DELETE CASCADE;


ALTER TABLE person_phone_number ADD CONSTRAINT FK_person_phone_number_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;
ALTER TABLE person_phone_number ADD CONSTRAINT FK_person_phone_number_1 FOREIGN KEY (phone_id) REFERENCES phone_number (phone_id) ON DELETE CASCADE;


ALTER TABLE rented_instrument ADD CONSTRAINT FK_rented_instrument_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE; 
ALTER TABLE rented_instrument ADD CONSTRAINT FK_rented_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE CASCADE;


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (student_sibling_id) REFERENCES student (student_id) ON DELETE CASCADE;


ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id) ON DELETE CASCADE;
ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;


ALTER TABLE student_expertise ADD CONSTRAINT FK_student_expertise_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_expertise ADD CONSTRAINT FK_student_expertise_1 FOREIGN KEY (instrument_expertise_id) REFERENCES instrument_expertise (instrument_expertise_id) ON DELETE CASCADE;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id) ON DELETE CASCADE;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme (price_scheme_id) ON DELETE CASCADE;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id) ON DELETE CASCADE;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme (price_scheme_id) ON DELETE CASCADE;


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id) ON DELETE CASCADE;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (price_scheme_id) REFERENCES price_scheme (price_scheme_id) ON DELETE CASCADE;


ALTER TABLE instructor_expertise ADD CONSTRAINT FK_instructor_expertise_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;
ALTER TABLE instructor_expertise ADD CONSTRAINT FK_instructor_expertise_1 FOREIGN KEY (instrument_expertise_id) REFERENCES instrument_expertise (instrument_expertise_id) ON DELETE CASCADE;


ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id) ON DELETE CASCADE;


ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id) ON DELETE CASCADE;


