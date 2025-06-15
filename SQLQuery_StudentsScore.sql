SELECT * FROM student_scores

-- Average scores each subject
SELECT
  AVG(GPA) AS avg_gpa,
  AVG(Algebra) AS avg_algebra,
  AVG(Calculus1) AS avg_calculus1,
  AVG(Calculus2) AS avg_calculus2,
  AVG(Stat) AS avg_statistics,
  AVG(Probability) AS avg_probability
FROM student_scores;

-- Average score by Gender
SELECT 
    gender,
    COUNT(*) AS total_students,
    AVG(GPA) AS avg_GPA,
    AVG(Algebra) AS avg_Algebra,
    AVG(Calculus1) AS avg_Calculus1,
    AVG(Calculus2) AS avg_Calculus2,
    AVG(Stat) AS avg_Statistics,
    AVG(Probability) AS avg_Probability
FROM student_scores
GROUP BY gender
ORDER BY avg_GPA DESC;

-- Average score by Race
SELECT 
    race,
    COUNT(*) AS total_students,
    AVG(GPA) AS avg_GPA,
    AVG(Algebra) AS avg_Algebra,
    AVG(Calculus1) AS avg_Calculus1,
    AVG(Calculus2) AS avg_Calculus2,
    AVG(Stat) AS avg_Statistics,
    AVG(Probability) AS avg_Probability
FROM student_scores
GROUP BY race
ORDER BY avg_GPA DESC;

-- Average score by Class
SELECT 
    class,
    COUNT(*) AS total_students,
    AVG(GPA) AS avg_GPA,
    AVG(Algebra) AS avg_Algebra,
    AVG(Calculus1) AS avg_Calculus1,
    AVG(Calculus2) AS avg_Calculus2,
    AVG(Stat) AS avg_Statistics,
    AVG(Probability) AS avg_Probability
FROM student_scores
GROUP BY class
ORDER BY avg_GPA DESC;

-- Top 5 students with highest GPA
SELECT 
    TOP 5 ID AS Best_Student_ID, GPA, Algebra, Calculus1, Calculus2, Stat, Probability
FROM student_scores 
ORDER BY GPA DESC

-- Bottom 5 students with lowest GPA
SELECT 
    TOP 5 ID AS Student_ID, GPA, Algebra, Calculus1, Calculus2, Stat, Probability
FROM student_scores 
ORDER BY GPA ASC

-- Bottom 5 students with lowest Algebra Score
SELECT 
    TOP 5 ID AS Student_ID, GPA, Algebra
FROM student_scores 
ORDER BY Algebra ASC

-- Bottom 5 students with lowest Calclulus1 Score
SELECT 
    TOP 5 ID AS Student_ID, GPA, Calculus1
FROM student_scores 
ORDER BY Calculus1 ASC

-- Bottom 5 students with lowest Calclulus2 Score
SELECT 
    TOP 5 ID AS Student_ID, GPA, Calculus2
FROM student_scores 
ORDER BY Calculus2 ASC

-- Bottom 5 students with lowest Stat Score
SELECT 
    TOP 5 ID AS Student_ID, GPA, Stat
FROM student_scores 
ORDER BY Stat ASC

-- Bottom 5 students with lowest Probability Score
SELECT 
    TOP 5 ID AS Student_ID, GPA, Probability
FROM student_scores 
ORDER BY Probability ASC

-- Number of students with scores < 70 and ≥ 70
SELECT 
  'GPA' AS Subject,
  SUM(CASE WHEN GPA < 70 THEN 1 ELSE 0 END) AS Below_70,
  SUM(CASE WHEN GPA >= 70 THEN 1 ELSE 0 END) AS Above_Or_Equal_70
FROM student_scores

UNION ALL

SELECT 
  'Algebra' AS Subject,
  SUM(CASE WHEN Algebra < 70 THEN 1 ELSE 0 END) AS Below_70,
  SUM(CASE WHEN Algebra >= 70 THEN 1 ELSE 0 END) AS Above_Or_Equal_70
FROM student_scores

UNION ALL

SELECT 
  'Calculus1',
  SUM(CASE WHEN Calculus1 < 70 THEN 1 ELSE 0 END),
  SUM(CASE WHEN Calculus1 >= 70 THEN 1 ELSE 0 END)
FROM student_scores

UNION ALL

SELECT 
  'Calculus2',
  SUM(CASE WHEN Calculus2 < 70 THEN 1 ELSE 0 END),
  SUM(CASE WHEN Calculus2 >= 70 THEN 1 ELSE 0 END)
FROM student_scores

UNION ALL

SELECT 
  'Statistics',
  SUM(CASE WHEN Stat < 70 THEN 1 ELSE 0 END),
  SUM(CASE WHEN Stat >= 70 THEN 1 ELSE 0 END)
FROM student_scores

UNION ALL

SELECT 
  'Probability',
  SUM(CASE WHEN Probability < 70 THEN 1 ELSE 0 END),
  SUM(CASE WHEN Probability >= 70 THEN 1 ELSE 0 END)
FROM student_scores;
