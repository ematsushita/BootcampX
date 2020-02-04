SELECT cohorts.name as cohort, AVG(completed_at - started_at) as average_assistance_time 
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id 
GROUP BY cohorts.name
ORDER BY average_assistance_time desc 
LIMIT 1;