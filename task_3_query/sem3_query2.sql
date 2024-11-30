
-- Makes the sibling relation ship bidirectional, 		
-- CHANGES student_sibling_id -> student_id	to	student_id -> student_sibling_id 	
-- Creates an equvalen relationship for sibling
WITH 
	student_to_sibling AS (
	    SELECT student_id, student_sibling_id 
		FROM sibling	
	    UNION
	    SELECT student_sibling_id AS student_id, 
			   student_id AS student_sibling_id 
		FROM sibling
	),

-- Creates table with number of sibling a student has 
-- by counting the amount of relations a particular student has.
	siblings_count AS (
	    SELECT student_id, COUNT(DISTINCT student_sibling_id) AS sibling_count
	    FROM student_to_sibling
	    GROUP BY student_id
	)

-- COALESCE: if "siblings_count.sibling_count" is null the second value in the list is chosen, which is 0.
-- 
SELECT 
    COALESCE(siblings_count.sibling_count, 0) AS Number_of_Siblings,
    COUNT(student.student_id) AS Number_of_Students
	
FROM student
	FULL JOIN siblings_count ON student.student_id = siblings_count.student_id
	
GROUP BY Number_of_Siblings

ORDER BY Number_of_Siblings;
