SELECT
    instructor.instructor_id,
    person.given_name,
    person.surname,
    COALESCE(total_ensembles, 0) + COALESCE(total_individual_lessons, 0) + COALESCE(total_group_lessons, 0) AS total_lessons

FROM
    instructor
	JOIN person ON instructor.person_id = person.person_id
	LEFT JOIN lesson_counts ON instructor.instructor_id = lesson_counts.instructor_id

ORDER BY total_lessons DESC;