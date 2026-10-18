-- ========================================================
-- EJERCICIO: MySQL Queries (Repo: db-university)
-- Base de Datos: db_university
-- ========================================================

-- 1. Selezionare tutti gli studenti nati nel 1990 (Resultado esperado: 160)
-- Nota: La función YEAR() extrae el año de la fecha de nacimiento.
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- Variante Senior optimizada para índices (Sargable):
-- SELECT * FROM `students` WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1990-12-31';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (Resultado esperado: 479)
-- Filtramos la columna 'cfu' evaluando una desigualdad estricta.
SELECT *
FROM `courses`
WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
-- Calculamos la diferencia en años entre la fecha de nacimiento y la fecha actual.
SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

-- Variante alternativa usando sustracción de fecha:
-- SELECT * FROM `students` WHERE `date_of_birth` < DATE_SUB(CURDATE(), INTERVAL 30 YEAR);


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (Resultado esperado: 286)
-- Concatenamos condiciones booleanas con el operador AND.
SELECT *
FROM `courses`
WHERE `period` = 'I semestre'
  AND `year` = 1;


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (Resultado esperado: 21)
-- La fecha se evalúa en formato estándar ISO (YYYY-MM-DD) y la hora con estricta posterioridad a las 14:00:00.
SELECT *
FROM `exams`
WHERE `date` = '2020-06-20'
  AND `hour` > '14:00:00';


-- 6. Selezionare tutti i corsi di laurea magistrale (Resultado esperado: 38)
-- Filtramos por el nivel académico en la tabla 'degrees'.
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (Resultado esperado: 12)
-- Usamos la función de agregación COUNT() y le asignamos un alias descriptivo.
SELECT COUNT(*) AS `total_departments`
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (Resultado esperado: 50)
-- En SQL los valores nulos no se comparan con '= NULL', sino con el predicado 'IS NULL'.
SELECT COUNT(*) AS `teachers_without_phone`
FROM `teachers`
WHERE `phone` IS NULL;