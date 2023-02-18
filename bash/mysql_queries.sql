-- 11. Display all the data in the student table.
SELECT * FROM mentorship.student;

-- 12. Display only the names and cities of all the students in the student table.
SELECT name, last_name, city FROM mentorship.student;

-- 13. Display only the oldest and youngest student in the student table.
SELECT * FROM mentorship.student WHERE age = (SELECT MAX(age) FROM mentorship.student) OR age = (SELECT MIN(age) FROM mentorship.student);

-- 14. Display all mentors who live in a city whose city name starts with the first half of the English alphabet.
SELECT name, last_name, city FROM mentorship.mentor WHERE city REGEXP "^[A-M].*$";

-- 15. Display all students who are younger than 30.
SELECT * FROM mentorship.student WHERE age < 30;

-- 16. Display the average age of students and mentors.
SELECT AVG(age) FROM mentorship.student UNION SELECT AVG(age) FROM mentorship.mentor;

-- 17. Update the favorite movie of the second oldest student to your favorite movie.
UPDATE mentorship.student SET movie="Blackout" WHERE age=(SELECT age FROM (SELECT age FROM mentorship.student ORDER BY age DESC LIMIT 1, 1) AS second_oldest_student);

-- 18. Delete the 3rd youngest student from the student table.
DELETE FROM mentorship.student WHERE age=(SELECT age FROM (SELECT age FROM mentorship.student ORDER BY age ASC LIMIT 2, 1) AS third_youngest_student);

-- 19. Add a new column to the student and mentor tables to store the date of birth and update it for all entries.
ALTER TABLE mentorship.student ADD COLUMN date_of_birth DATE AFTER age;
ALTER TABLE mentorship.mentor ADD COLUMN date_of_birth DATE AFTER age;

-- 19. Calculate date_of_birth based on age
UPDATE mentorship.student SET date_of_birth=DATE_SUB(NOW(), INTERVAL age YEAR);
UPDATE mentorship.mentor SET date_of_birth=DATE_SUB(NOW(), INTERVAL age YEAR);