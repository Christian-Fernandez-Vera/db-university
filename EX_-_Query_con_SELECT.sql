-- ========================================================
-- Base de Datos: db_university
-- ========================================================

-- 1. Selezionare tutti gli studenti nati nel 1990 (Resultado esperado: 160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- SELECT * FROM `students` WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1990-12-31';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (Resultado esperado: 479)
SELECT *
FROM `courses`
WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

-- SELECT * FROM `students` WHERE `date_of_birth` < DATE_SUB(CURDATE(), INTERVAL 30 YEAR);


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (Resultado esperado: 286)
SELECT *
FROM `courses`
WHERE `period` = 'I semestre'
  AND `year` = 1;


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (Resultado esperado: 21)
SELECT *
FROM `exams`
WHERE `date` = '2020-06-20'
  AND `hour` > '14:00:00';


-- 6. Selezionare tutti i corsi di laurea magistrale (Resultado esperado: 38)
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (Resultado esperado: 12)
SELECT COUNT(*) AS `total_departments`
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (Resultado esperado: 50)
SELECT COUNT(*) AS `teachers_without_phone`
FROM `teachers`
WHERE `phone` IS NULL;