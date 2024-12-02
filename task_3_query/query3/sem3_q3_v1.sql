CREATE MATERIALIZED VIEW lesson_counts AS (
    SELECT
        instructor.instructor_id,
		(
			COALESCE(COUNT(DISTINCT individual_lesson.lesson_id), 0) + 
			COALESCE(COUNT(DISTINCT group_lesson.group_lesson_id), 0) + 
			COALESCE(COUNT(DISTINCT ensemble.ensemble_id), 0)
		) AS total_lessons
		
    FROM
        instructor	
    LEFT JOIN individual_lesson ON individual_lesson.instructor_id = instructor.instructor_id
        AND EXTRACT(MONTH FROM (SELECT time_slot.start_time 
								 FROM time_slot 
								 WHERE time_slot.time_slot_id = individual_lesson.time_slot_id 
								 		AND EXTRACT(YEAR FROM time_slot.start_time) = 
										 	EXTRACT(YEAR FROM CURRENT_TIMESTAMP)))
			 	= EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
		
    LEFT JOIN group_lesson ON group_lesson.instructor_id = instructor.instructor_id
        AND EXTRACT(MONTH FROM (SELECT time_slot.start_time 
								 FROM time_slot 
								 WHERE time_slot.time_slot_id = group_lesson.time_slot_id 
								 		AND EXTRACT(YEAR FROM time_slot.start_time) = 
										 	EXTRACT(YEAR FROM CURRENT_TIMESTAMP))) 
				= EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
				
	LEFT JOIN ensemble ON ensemble.instructor_id = instructor.instructor_id
        AND EXTRACT(MONTH FROM (SELECT time_slot.start_time 
								 FROM time_slot 
								 WHERE time_slot.time_slot_id = ensemble.time_slot_id 
								 		AND EXTRACT(YEAR FROM time_slot.start_time) = 
										 	EXTRACT(YEAR FROM CURRENT_TIMESTAMP))) 
				= EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
		
    GROUP BY instructor.instructor_id
)