/* 1. Заповнити таблиці вашої БД в режимі одиночного і групового доповнення */
INSERT INTO authors
	VALUES (1, "Айн", "Ренд", NULL, NULL, CURRENT_TIMESTAMP);

INSERT INTO authors
	VALUES (NULL, "Олександр", "Авраменко", NULL, NULL, CURRENT_TIMESTAMP),
			(NULL, "Алла", "Клименко", NULL, NULL, CURRENT_TIMESTAMP),
			(NULL, "Андрій", "Оністрат", NULL, NULL, CURRENT_TIMESTAMP);

/* 2. Створити файли з даними (будь-якого сумісного типу) і заповнити ними решту таблиць баз даних шляхом імпорту */
LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/authors.txt"
INTO TABLE authors
FIELDS TERMINATED BY ','
(name, surname);

LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/books.txt"
INTO TABLE books
FIELDS TERMINATED BY ','
(id_book, book_title, image, link);

LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/books_authors.txt"
INTO TABLE books_authors
FIELDS TERMINATED BY ',';

LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/sites.txt"
INTO TABLE sites
FIELDS TERMINATED BY ','
(name, link);

LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/sites_genres.txt"
INTO TABLE sites_genres
FIELDS TERMINATED BY ';'
(id_site , genre);

LOAD DATA INFILE "D:/OpenServer/userdata/temp/upload/books_genres.txt"
INTO TABLE books_genres
FIELDS TERMINATED BY ';'
(id_book, id_genre);

/* 3. Виконати модифікацію значень у будь-яких таблицях БД для одного поля та групи полів за певною умовою */
UPDATE authors SET image = "foto001.png"
WHERE name = "Алла" AND surname = "Клименко";

UPDATE authors SET image = "default.png"
WHERE image IS NULL;

/* 4. Видалити записи з таблиць вашої БД */
DELETE FROM authors
WHERE (info_update_date = "2022-03-27 19:20:00" AND id_author != 3);