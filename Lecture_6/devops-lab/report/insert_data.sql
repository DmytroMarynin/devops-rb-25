USE SchoolDB;

-- Institutions
INSERT INTO Institutions (institution_name, institution_type, address) VALUES
  ('Kyiv High School #12', 'School', 'Kyiv, Volodymyrska 45'),
  ('Sunshine Kindergarten', 'Kindergarten', 'Lviv, Franka 7'),
  ('Dnipro Gymnasium', 'School', 'Dnipro, Shevchenka 101');

-- Classes
INSERT INTO Classes (class_name, institution_id, direction) VALUES
  ('10-A', 1, 'Mathematics'),
  ('11-B', 3, 'Biology and Chemistry'),
  ('Group 1', 2, 'Language Studies');

-- Children
INSERT INTO Children (first_name, last_name, birth_date, year_of_entry, age, institution_id, class_id) VALUES
  ('Andrii', 'Kovalchuk', '2010-05-15', 2020, 14, 1, 1),
  ('Olha', 'Shevchenko', '2009-09-10', 2019, 15, 3, 2),
  ('Maksym', 'Tkachenko', '2019-02-20', 2023, 6, 2, 3);

-- Parents
INSERT INTO Parents (first_name, last_name, child_id, tuition_fee) VALUES
  ('Oksana', 'Kovalchuk', 1, 1500.00),
  ('Volodymyr', 'Shevchenko', 2, 1600.00),
  ('Iryna', 'Tkachenko', 3, 1200.00);
