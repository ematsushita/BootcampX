const { Pool } = require('pg');
const arguments = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`, [arguments[0]])
.then(res => {
  console.log('connected')
  res.rows.forEach(teacher => {
    console.log(`${arguments[0]}: ${teacher.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));