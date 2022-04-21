USE code_test_db;

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `persons` (
                           `id` int unsigned NOT NULL AUTO_INCREMENT,
                           `first_name` varchar(25) NOT NULL,
                           `album_id` int unsigned NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `album_id` (`album_id`),
                           CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `persons` VALUES (1,'Olivia',29),(2,'Santiago',27),(3,'Tareq',15),(4,'Anaya',28);

SHOW INDEXES FROM persons;
# SELECT * FROM information_schema.TABLE_PRIVILEGES WHERE CONSTRAINT_SCHEMA = 'codeup_test_db';

SELECT p.first_name, a.name
FROM persons p JOIN albums a ON p.album_id = a.id;

SELECT p.first_name, a.name
FROM persons p
    LEFT JOIN albums a ON a.ID = p.album_id;

SELECT p.first_name, a.name
FROM albums a
    LEFT JOIN persons p ON p.album_id = a.ID;

SELECT p.first_name, a. name
FROM persons p
    RIGHT JOIN albums a ON a.id = p.album_id;


# Create the preferences table
CREATE TABLE preferences (
                             person_id INT UNSIGNED NOT NULL,
                             album_id INT UNSIGNED NOT NULL,
                             CONSTRAINT preferences_person_id_fk FOREIGN KEY (person_id) REFERENCES persons (id),
                             CONSTRAINT preferences_album_id_fk FOREIGN KEY (album_id) REFERENCES albums (id)
);

# Inserting data into the preferences table
INSERT INTO preferences (person_id, album_id)
VALUES (1, 12), (1, 5), (1, 22), (1, 29), (2, 1), (2, 31), (2, 30), (3, 11), (3, 26), (3, 25);

TRUNCATE preferences;

SELECT p.first_name AS First_Name,
       a.name AS Favorite_Album
FROM persons p
    JOIN preferences pf on p.id = pf.person_id
    JOIN albums a on pf.album_id = a.id
WHERE p.first_name = 'Olivia';

SELECT p.first_name AS First_Name,
       a.name AS Favorite_Album
FROM persons p
         JOIN preferences pf on p.id = pf.person_id
         JOIN albums a on pf.album_id = a.id;