-- This is how comments are written with two hyphens at the start of a sentence.
-- Any commented out code will not be executed, i.e no results will be produced for it.


-- Creating the required tables.


CREATE TABLE PATIENTS (
    PID INT(11) PRIMARY KEY NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    DISTRICT VARCHAR(50) NOT NULL,
    DRUGID INT(11) NOT NULL,
    NURSED INT(11) NOT NULL,
    WARDID INT(11) NOT NULL,
    FOREIGN KEY (DRUGID) REFERENCES DRUGS(DRUGID),
    FOREIGN KEY (NURSED) REFERENCES NURSES(NURSEID),
    FOREIGN KEY (WARDID) REFERENCES WARDS(WARDID)
);

CREATE TABLE DRUGS (
    DRUGID INT(11) PRIMARY KEY NOT NULL,
    DRUGNAME VARCHAR(50) NOT NULL
);

CREATE TABLE NURSES (
    NURSEID INT(11) PRIMARY KEY NOT NULL,
    NURSENAME VARCHAR(50) NOT NULL,
    WARDID INT(11) NOT NULL,
    FOREIGN KEY (WARDID) REFERENCES WARDS(WARDID)
);

CREATE TABLE WARDS (
    WARDID INT(11) PRIMARY KEY NOT NULL,
    WARDNAME VARCHAR(50) NOT NULL
);


-- Inserting sample data into tables

INSERT INTO PATIENTS (PID, NAME, DISTRICT, DRUGID, NURSED, WARDID) VALUES
(1, 'John Doe', 'Kampala', 1, 1, 1),
(2, 'Jane Smith', 'Mbarara', 2, 2, 2),
(3, 'David Brown', 'Gulu', 3, 3, 3),
(4, 'Emily Davis', 'Jinja', 4, 4, 4),
(5, 'Michael Johnson', 'Mityana', 5, 5, 5),
(6, 'Sarah Williams', 'Masaka', 6, 6, 6),
(7, 'Christopher Jones', 'Arua', 7, 7, 7),
(8, 'Hannah Thomas', 'Fort Portal', 8, 8, 8),
(9, 'Matthew Wilson', 'Hoima', 9, 9, 9),
(10, 'Olivia Taylor', 'Lira', 10, 10, 10);

INSERT INTO DRUGS (DRUGID, DRUGNAME) VALUES
(1, 'Paracetamol'),
(2, 'Ibuprofen'),
(3, 'Amoxicillin'),
(4, 'Aspirin'),
(5, 'Metformin'),
(6, 'Losartan'),
(7, 'Atorvastatin'),
(8, 'Lisinopril'),
(9, 'Fluoxetine'),
(10, 'Sertraline');

INSERT INTO NURSES (NURSEID, NURSENAME, WARDID) VALUES
(1, 'Nurse A', 1),
(2, 'Nurse B', 2),
(3, 'Nurse C', 3),
(4, 'Nurse D', 4),
(5, 'Nurse E', 5),
(6, 'Nurse F', 6),
(7, 'Nurse G', 7),
(8, 'Nurse H', 8),
(9, 'Nurse I', 9),
(10, 'Nurse J', 10);

INSERT INTO WARDS (WARDID, WARDNAME) VALUES
(1, 'Medical Ward'),
(2, 'Surgical Ward'),
(3, 'Maternity Ward'),
(4, 'Pediatric Ward'),
(5, 'ICU'),
(6, 'CCU'),
(7, 'Dialysis Unit'),
(8, 'Radiology Department'),
(9, 'Laboratory'),
(10, 'Pharmacy');


-- Querying for data: genetating a report

SELECT p.NAME AS PNAME, d.DRUGNAME, n.NURSENAME, w.WARDNAME
FROM PATIENTS p, DRUGS d, NURSES n, WARDS w
WHERE p.DRUGID = d.DRUGID AND p.NURSED = n.NURSEID AND p.WARDID = w.WARDID;
