-- ============================================================
--  HOSTEL MANAGEMENT SYSTEM
-- ============================================================
--  TABLE DEFINITIONS 
-- ============================================================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(50),
    year INT
);

CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    capacity INT,
    occupied INT DEFAULT 0
);

CREATE TABLE allocation (
    allocation_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    room_id INT REFERENCES rooms(room_id),
    allocation_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE complaints (
    complaint_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    issue TEXT,
    status VARCHAR(20) DEFAULT 'Pending'
);


-- ============================================================
--  CONSTRAINTS 
-- ============================================================

ALTER TABLE rooms
ADD CONSTRAINT check_capacity CHECK (occupied <= capacity);


-- ============================================================
--  TRIGGER & FUNCTION: Auto-update room occupancy on allocation
-- ============================================================

CREATE OR REPLACE FUNCTION update_occupancy()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE rooms
    SET occupied = occupied + 1
    WHERE room_id = NEW.room_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER allocate_room_trigger
AFTER INSERT ON allocation
FOR EACH ROW
EXECUTE FUNCTION update_occupancy();


-- ============================================================
--  VIEW: Rooms that still have available space
-- ============================================================

CREATE VIEW available_rooms AS
SELECT * FROM rooms
WHERE occupied < capacity;


-- ============================================================
--  FUNCTION: Get room allocated to a specific student
-- ============================================================

CREATE OR REPLACE FUNCTION get_student_room(sid INT)
RETURNS TABLE(room_id INT) AS $$
BEGIN
    RETURN QUERY
    SELECT room_id FROM allocation WHERE student_id = sid;
END;
$$ LANGUAGE plpgsql;


-- ============================================================
--  Student Data
-- ============================================================

INSERT INTO students (name, course, year)
VALUES
('Aman Riyaz',     'BBA',    2),
('Riya Pal',     'BCA',    1),
('Karan Kumar',    'B.Tech', 4),
('Priyanka Chandwani', 'MCA',    1),
('Sahil Hans',    'MCA',    2),
('Shubham Agarwal',  'MSC',    1),
('Harpreet Kaur',  'B.Tech',  1), 
('Navdeep Singh',  'B.Tech',  2), 
('Simran Sharma',  'BCA',     2), 
('Rohit Verma',    'MBA',     1), 
('Manpreet Gill',  'B.Tech',  3), 
('Deepika Negi',   'MCA',     2), 
('Arjun Malhotra', 'B.Com',   1), 
('Jasleen Kaur',   'MBA',     2), 
('Vishal Thakur',  'B.Tech',  4), 
('Pooja Bhatia',   'MSC',     2); 


SELECT * FROM students;
DROP TABLE STUDENTS
-- ============================================================
-- Hostel Rooms
-- ============================================================

INSERT INTO rooms (capacity, occupied)
VALUES
(2, 0),   
(3, 0),   
(4, 0),   
(2, 0),   
(3, 0),    
(4, 0),   
(1, 0),    
(2, 0),    
(3, 0),    
(4, 0);   

SELECT * FROM rooms;

-- ============================================================
-- Room Allocations
-- ============================================================

INSERT INTO allocation (student_id, room_id)
VALUES
(1, 1),   
(2, 3),   
(3, 2),  
(4,  7),  
(5,  2),  
(6,  5),  
(7,  3),  
(8,  6),  
(9,  5),  
(10, 8),  
(11, 6),  
(12, 9),  
(13, 4);  

DROP TAble allocation
SELECT * FROM allocation;
Drop table complaints
-- ============================================================
-- Complaints
-- ============================================================

INSERT INTO complaints (student_id, issue, status)
VALUES
(1,  'Water supply disrupted in bathroom since 2 days',          'Pending'),
(2,  'Wi-Fi connectivity very slow after 10 PM',                 'Pending'),
(3,  'Room window latch broken, security concern',               'Resolved'),
(5,  'Mess food quality has degraded this week',                 'Pending'),
(7,  'AC in room not functioning, room temperature unbearable',  'In Progress'),
(8,  'Cockroach infestation noticed near washroom',              'Pending'),
(10, 'Laundry machine on 2nd floor out of order',                'Resolved'),
(11, 'Common room TV remote is missing',                         'Pending'),
(13, 'Power socket near study table not working',                'In Progress'),
(6,  'Noisy neighbour disturbing studies late at night',         'Pending');

SELECT * FROM complaints;

--SELECT QUERIES

-- Q1: Students allocated to Room 1
SELECT s.name
FROM students s
JOIN allocation a ON s.student_id = a.student_id
WHERE a.room_id = 1;

-- Q2: Rooms that still have space
SELECT * FROM rooms WHERE occupied < capacity;

-- Q3: All pending complaints
SELECT * FROM complaints WHERE status = 'Pending';

-- Q4: List all students with their course and year
SELECT name, course, year
FROM students
ORDER BY course, year;

-- Q5: Students currently in final year of B.Tech 
SELECT name, course, year
FROM students
WHERE year >3 and course = 'B.Tech';

-- Q6: All students enrolled in B.Tech program
SELECT student_id, name, year
FROM students
WHERE course = 'B.Tech'
ORDER BY year;

-- Q7: Full allocation details — student name, room, and date
SELECT s.name, a.room_id, a.allocation_date
FROM students s
JOIN allocation a ON s.student_id = a.student_id
ORDER BY a.room_id;

-- Q8: Rooms with their current occupancy and remaining capacity
SELECT room_id,
       capacity,
       occupied,
       (capacity - occupied) AS remaining_seats
FROM rooms
ORDER BY remaining_seats DESC;

-- Q9: Students who have NOT been allocated any room yet
SELECT s.student_id, s.name, s.course
FROM students s
LEFT JOIN allocation a ON s.student_id = a.student_id
WHERE a.student_id IS NULL;

-- Q10: Complaints with student name and current status
SELECT s.name, c.issue, c.status
FROM complaints c
JOIN students s ON c.student_id = s.student_id
ORDER BY c.status;


--  ADDED: UPDATE QUERIES 

-- Q1: Mark a specific complaint as Resolved (complaint_id = 1)
UPDATE complaints
SET status = 'Resolved'
WHERE complaint_id = 1;

-- Q2: Mark all 'In Progress' complaints as 'Resolved' in bulk
UPDATE complaints
SET status = 'Resolved'
WHERE status = 'In Progress';

SELECT * FROM complaints where status = 'Resolved';
-- Q3: Correct a student's year — Rohit (student_id=10) advances to year 2
UPDATE students
SET year = 2
WHERE student_id = 10;

-- Q4: Update a student's course (e.g., course correction at CU)
UPDATE students
SET course = 'M.Tech'
WHERE student_id = 15; 


--  Other Queries

-- Q1: Remove a specific complaint once fully handled
DELETE FROM complaints
WHERE complaint_id = 1 AND status = 'Resolved';


-- Q2: Total complaints grouped by status
SELECT status, COUNT(*) AS count
FROM complaints
GROUP BY status;

-- Q3: Room-wise student list (multiple students per room shown together)
SELECT r.room_id, r.capacity, r.occupied,
       STRING_AGG(s.name, ', ') AS students_in_room
FROM rooms r
LEFT JOIN allocation a ON r.room_id = a.room_id
LEFT JOIN students s   ON a.student_id = s.student_id
GROUP BY r.room_id, r.capacity, r.occupied
ORDER BY r.room_id;