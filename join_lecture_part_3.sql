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









