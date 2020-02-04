SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id = students.id 
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;

