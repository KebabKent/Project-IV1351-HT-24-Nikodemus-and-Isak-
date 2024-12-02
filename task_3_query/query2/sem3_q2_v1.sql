-- Makes the sibling relation ship bidirectional, 		
-- CHANGES student_sibling_id -> student_id	to	student_id -> student_sibling_id 	
-- Creates an equvalen relationship for sibling
CREATE MATERIALIZED VIEW student_to_sibling AS (
	    SELECT student_id, student_sibling_id 
		FROM sibling	
	    UNION
	    SELECT student_sibling_id AS student_id, 
			   student_id AS student_sibling_id 
		FROM sibling
)

