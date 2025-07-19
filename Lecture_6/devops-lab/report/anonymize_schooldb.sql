USE SchoolDB;

-- Анонімізація таблиці Children
UPDATE Children
SET
  first_name = 'Child',
  last_name = 'Anonymous';

-- Анонімізація таблиці Parents
UPDATE Parents
SET
  first_name = CONCAT('Parent', parent_id),
  last_name = 'Anon';

-- Анонімізація таблиці Institutions
UPDATE Institutions
SET
  institution_name = CONCAT('Institution', institution_id);

-- Анонімізація фінансових даних (tuition_fee)
UPDATE Parents
SET
  tuition_fee = ROUND(RAND() * 3000 + 2000); -- значення від 2000 до 5000 грн
