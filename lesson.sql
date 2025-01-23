CREATE TABLE reports (
report_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
person_id INT UNSIGNED NOT NULL,
content TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO reports (person_id, content)
    VALUES
    (1, 'AAAAA'),
    (1, 'BBBBB'),
    (2, 'CCCCC'),
    (2, 'DDDDD'),
    (3, 'EEEEE'),
    (3, 'FFFFF'),
    (4, 'GGGGG'),
    (4, 'HHHHH'),
    (5, 'IIIII'),
    (6, 'JJJJJ');

==========================================================================================================================================

-- Q1
CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

-- Q3
INSERT INTO departments (name)
    VALUES
    ('Sales'),
    ('Development'),
    ('Accounting'),
    ('Human Resources'),
    ('Information Systems');

-- Q3
INSERT INTO people (name, email, department_id, age, gender)
    VALUES
    ('山田一郎', 'itirou@gizumo.jp', 1, 1, 1),
    ('山田二郎', 'nirou@gizumo.jp', 1, 2, 1),
    ('山田三郎', 'sanrou@gizumo.jp', 1, 3, 1),
    ('山田四郎', 'sirou@gizumo.jp', 2, 4, 1),
    ('山田五郎', 'gorou@gizumo.jp', 2, 5, 1),
    ('山田六郎', 'rokurou@gizumo.jp', 2, 6, 2),
    ('山田七郎', 'nanarou@gizumo.jp', 2, 7, 2),
    ('山田八郎', 'hatirou@gizumo.jp', 3, 8, 2),
    ('山田九郎', 'kyurou@gizumo.jp', 4, 9, 2),
    ('山田十郎', 'jurou@gizumo.jp', 5, 10, 2);

-- Q3
INSERT INTO reports (person_id, content)
    VALUES
    (7, 'KKKKKKKKKKK'),
    (8, 'LLLLLLLLLLL'),
    (9, 'MMMMMMMMMMM'),
    (10, 'NNNNNNNNNNN'),
    (11, 'OOOOOOOOOOO'),
    (12, 'PPPPPPPPPPP'),
    (13, 'QQQQQQQQQQQ'),
    (14, 'RRRRRRRRRRR'),
    (15, 'SSSSSSSSSSS'),
    (16, 'TTTTTTTTTTT');

-- Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 5 WHERE person_id = 6;

-- Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
SELECT name, email, age FROM people WHERE department_id = 1 ORDER BY created_at;

peopleテーブルから、レコードを取得。 要件ははdepartment_id（部署ID）が1であるレコードを選択。
選択したレコードの中から、カラム名「name」,「email」,「age」のデータを取得。 
「created_at」 作成日時の昇順で全体を並び替えます。

-- Q7
SELECT name,age FROM people  WHERE gender = 2 AND age >= 20 AND age <=29 OR gender = 1 AND age >= 40 AND age <=49;

-- Q8
SELECT department_id,age FROM people WHERE department_id = 1 ORDER BY age ASC;

-- Q9
SELECT AVG(age) average_age FROM people WHERE gender = 2 AND department_id = 2;

-- Q10
SELECT p.name, p.department_id, r.content FROM people p JOIN reports r USING(person_id);

-- Q11
SELECT p.name, p.department_id, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);

