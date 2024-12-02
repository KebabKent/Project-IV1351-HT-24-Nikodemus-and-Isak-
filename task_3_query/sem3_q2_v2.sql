-- Creates table with number of sibling a student has 
-- by counting the amount of relations a particular student has.
CREATE MATERIALIZED VIEW siblings_count AS (
	    SELECT student_id, COUNT(DISTINCT student_sibling_id) AS sibling_count
	    FROM student_to_sibling
	    GROUP BY student_id
)