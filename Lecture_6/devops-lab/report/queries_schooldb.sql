USE SchoolDB;

-- 1. Діти, заклад і напрям
SELECT 
  c.first_name AS child_first_name,
  c.last_name AS child_last_name,
  i.institution_name,
  cl.class_name,
  cl.direction
FROM Children c
JOIN Institutions i ON c.institution_id = i.institution_id
JOIN Classes cl ON c.class_id = cl.class_id;

-- ------------------------------------------------------

-- 2. Батьки, діти та вартість навчання
SELECT 
  p.first_name AS parent_first_name,
  p.last_name AS parent_last_name,
  c.first_name AS child_first_name,
  c.last_name AS child_last_name,
  p.tuition_fee
FROM Parents p
JOIN Children c ON p.child_id = c.child_id;

-- ------------------------------------------------------

-- 3. Кількість дітей у кожному закладі
SELECT 
  i.institution_name,
  i.address,
  COUNT(c.child_id) AS number_of_children
FROM Institutions i
LEFT JOIN Children c ON i.institution_id = c.institution_id
GROUP BY i.institution_id;
