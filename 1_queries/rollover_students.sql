SELECT students.name, cohorts.name, cohort.start_date as cohort_start_date, student.start_date as student_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date;