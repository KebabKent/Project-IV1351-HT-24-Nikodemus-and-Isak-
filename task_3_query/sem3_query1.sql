SELECT EXTRACT(MONTH FROM time_slot.start_time) AS month, 
	  (
	  	COUNT(individual_lesson.lesson_id) + 
		COUNT(group_lesson.group_lesson_id) + 
		COUNT(ensemble.ensemble_id)
	  ) AS total,
	  COUNT(individual_lesson.lesson_id) AS individual,
	  COUNT(group_lesson.group_lesson_id) AS group,
	  COUNT(ensemble.ensemble_id) AS ensemble

FROM time_slot
	FULL JOIN individual_lesson ON time_slot.time_slot_id = individual_lesson.time_slot_id
	FULL JOIN group_lesson ON time_slot.time_slot_id = group_lesson.time_slot_id
	FULL JOIN ensemble ON time_slot.time_slot_id = ensemble.time_slot_id

WHERE EXTRACT(YEAR FROM time_slot.start_time) = '2024' 
GROUP BY EXTRACT(MONTH FROM time_slot.start_time)
ORDER BY EXTRACT(MONTH FROM time_slot.start_time) ASC
;
