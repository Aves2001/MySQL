/* 0. Створення таблиць */
CREATE TABLE authors1
AS SELECT id_author, name, info_update_date FROM authors
WHERE info_update_date > "2022-03-27 23:20:00";

CREATE TABLE authors2
AS SELECT id_author, name, info_update_date FROM authors
WHERE info_update_date < "2022-03-27 23:30:00" AND id_author < 6;

/* 1. Створити запит на виконання об’єднання (для будь-яких таблиць вашої БД) */
SELECT * FROM authors1
UNION SELECT * FROM authors2

/* 2. Створити запит на виконання перетину (для будь-яких таблиць вашої БД) */
SELECT * FROM authors1
WHERE id_author IN (SELECT id_author FROM authors2);

/* 3. Виконати запит на побудову різниці (для будь-яких таблиць вашої БД) */
SELECT * FROM authors2
WHERE id_author NOT IN (SELECT id_author FROM authors1);

/* 4. Побудувати запит на виконання декартового добутку двох таблиць (для будь-яких таблиць вашої БД) */
SELECT * FROM authors1, authors2;