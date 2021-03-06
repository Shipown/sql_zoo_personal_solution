-- 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question = 'Q01'
   AND institution = 'Edinburgh Napier University'
   AND subject = '(8) Computer Science';

-- 2
SELECT institution, subject
  FROM nss
 WHERE question = 'Q15'
   AND score >= 100;

-- 3
SELECT institution, score
  FROM nss
 WHERE subject = '(8) Computer Science'
   AND question = 'Q15'
   AND score < 50;

-- 4
SELECT subject, SUM(response)
  FROM nss
 WHERE subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
   AND question = 'Q22'
 GROUP BY subject;

-- 5
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
 WHERE subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
   AND question = 'Q22'
 GROUP BY subject;

-- 6
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response))
  FROM nss
 WHERE subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
   AND question = 'Q22'
 GROUP BY subject;

-- 7
SELECT institution, ROUND(SUM(response * score) / SUM(response))
  FROM nss
 WHERE question = 'Q22'
   AND institution LIKE '%Manchester%'
 GROUP BY institution;

-- 8
SELECT institution, SUM(sample), SUM(CASE WHEN subject LIKE '(8) %' THEN sample ELSE 0 END)
  FROM nss
 WHERE question = 'Q01'
   AND institution LIKE '%Manchester%'
 GROUP BY institution;
