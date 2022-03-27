/* Завдання 1 */
ALTER TABLE aobu.characteristics
	DROP FOREIGN KEY characteristics_ibfk_1

/* Завдання 2 */
ALTER TABLE characteristics
	DROP COLUMN price,
	MODIFY COLUMN written int(22) NULL;

/* Завдання 3 */
ALTER TABLE characteristics
	MODIFY COLUMN rating CHAR(60) NOT NULL;
	
/* Завдання 4 */
ALTER TABLE characteristics
	ADD COLUMN versionID TINYINT(8) UNSIGNED NOT NULL
	AFTER written, ADD CONSTRAINT UNIQUE UQ_Message_version (written, versionID);

/* Завдання 5 */
ALTER TABLE sites_genres
    DROP FOREIGN KEY sites_genres_ibfk_1;
ALTER TABLE sites_genres
    ADD CONSTRAINT sites_genres_ibfk_1 FOREIGN KEY (id_site)
    REFERENCES sites(id_site) ON DELETE CASCADE ON UPDATE CASCADE;