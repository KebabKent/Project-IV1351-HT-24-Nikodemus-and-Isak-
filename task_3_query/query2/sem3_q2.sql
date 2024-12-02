-- COALESCE: if "siblings_count.sibling_count" is null the second value in the list is chosen, which is 0.
-- 
SELECT 
    COALESCE(siblings_count.sibling_count, 0) AS Number_of_Siblings,
    COUNT(student.student_id) AS Number_of_Students
	
FROM student
	FULL JOIN siblings_count ON student.student_id = siblings_count.student_id
	
GROUP BY Number_of_Siblings

ORDER BY Number_of_Siblings;
