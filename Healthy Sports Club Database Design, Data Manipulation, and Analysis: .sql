Create database Healthy_SportsClub;
Use Healthy_SportsClub;

CREATE TABLE ClubMember (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(100),
    telephone_number VARCHAR(15),
    email_address VARCHAR(100),
    date_of_birth DATE,
    medical_conditions TEXT
);


CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15)
);


CREATE TABLE Facility (
    facility_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Class (
    class_id INT PRIMARY KEY,
    class_code VARCHAR(10) UNIQUE,
    name VARCHAR(100),
    instructor_id INT,
    day_of_delivery VARCHAR(15),
    time_of_delivery TIME,
    max_class_size INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);


CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    member_id INT,
    facility_id INT,
    class_id INT,
    booking_date DATE,
    booking_time TIME,
    duration_minutes INT,
    FOREIGN KEY (member_id) REFERENCES ClubMember(member_id),
    FOREIGN KEY (facility_id) REFERENCES Facility(facility_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);


INSERT INTO ClubMember (member_id, first_name, last_name, address, telephone_number, email_address, date_of_birth, medical_conditions)
VALUES
    (1, 'John', 'Doe', '123 Main St', '555-1234', 'john@example.com', '1990-05-15', 'None'),
    (2, 'Jane', 'Smith', '456 Elm St', '555-5678', 'jane@example.com', '1985-09-22', 'Asthma');

INSERT INTO Instructor (instructor_id, first_name, last_name, contact_number)
VALUES
    (1, 'Michael', 'Brown', '555-9876'),
    (2, 'Emily', 'Johnson', '555-5432');


INSERT INTO Facility (facility_id, name)
VALUES
    (1, 'Main Hall'),
    (2, 'Yoga Hall');

INSERT INTO Class (class_id, class_code, name, instructor_id, day_of_delivery, time_of_delivery, max_class_size)
VALUES
    (1, 'YOG101', 'Yoga Basics', 2, 'Monday', '10:00:00', 20),
    (2, 'FIT202', 'High-Intensity Training', 1, 'Wednesday', '18:00:00', 15);


INSERT INTO Booking (booking_id, member_id, facility_id, class_id, booking_date, booking_time, duration_minutes)
VALUES
    (1, 1, 1, NULL, '2023-08-25', '15:00:00', 120),
    (2, 2, NULL, 1, '2023-08-26', '10:30:00', 90);


SELECT * FROM ClubMember;
SELECT * FROM Instructor;
SELECT * FROM Facility;
SELECT * FROM Class;
SELECT * FROM Booking;

SELECT c.first_name, c.last_name, b.booking_date, b.booking_time, b.duration_minutes
FROM Booking b
JOIN ClubMember c ON b.member_id = c.member_id
WHERE b.booking_date BETWEEN '2023-08-25' AND '2023-08-31';



