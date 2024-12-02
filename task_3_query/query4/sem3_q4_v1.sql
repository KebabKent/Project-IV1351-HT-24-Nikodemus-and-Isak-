CREATE MATERIALIZED VIEW students AS (
	SELECT student_ensemble.student_id, student_ensemble.ensemble_id
	FROM student_ensemble, ensemble
	WHERE student_ensemble.ensemble_id = ensemble.ensemble_id
)
