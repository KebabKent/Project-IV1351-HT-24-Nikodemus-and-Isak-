SELECT
    instructor.instructor_id,
    person.given_name,
    person.surname,
    lesson_counts.total_lessons

FROM
    instructor
	JOIN person ON instructor.person_id = person.person_id
	LEFT JOIN lesson_counts ON instructor.instructor_id = lesson_counts.instructor_id
WHERE lesson_counts.total_lessons > 0
ORDER BY total_lessons DESC;