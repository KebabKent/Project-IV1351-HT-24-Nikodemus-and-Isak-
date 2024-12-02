SELECT
	CASE 
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 0 THEN 'sun'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 1 THEN 'mon'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 2 THEN 'tue'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 3 THEN 'wed'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 4 THEN 'thu'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 5 THEN 'fri'
		WHEN EXTRACT(DOW FROM time_slot.start_time) = 6 THEN 'sat'
	END AS Day,
	ensemble.genre,
	CASE 
		WHEN (ensemble.maximum_students - COUNT(students.student_id)) = 0 THEN 'No Seats'
		WHEN (ensemble.maximum_students - COUNT(students.student_id)) = 1 THEN '1 or 2 Seats'
		WHEN (ensemble.maximum_students - COUNT(students.student_id)) = 2 THEN '1 or 2 Seats'
		ELSE 'Many'
	END AS No_of_Free_Seats
	


FROM time_slot, ensemble, students


WHERE ensemble.time_slot_id = time_slot.time_slot_id 
	  AND ensemble.ensemble_id = students.ensemble_id 
	  AND EXTRACT(WEEK FROM time_slot.start_time) = MOD(EXTRACT(WEEK FROM CURRENT_TIMESTAMP), 52) + 1

GROUP BY time_slot.start_time, ensemble.ensemble_id
;