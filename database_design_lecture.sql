USE code_test_db;

TRUNCATE quotes;
DROP TABLE IF EXISTS quotes;

CREATE TABLE `quotes` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `content` varchar(240) NOT NULL,
                          `author` varchar(50) NOT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO quotes (content, author) VALUES
                                         ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.', 'Marcel Proust'),
                                         ('My destination is no longer a place, rather a new way of seeing.', 'Marcel Proust'),
                                         ('Reading is that fruitful miracle of a communication in the midst of solitude.', 'Marcel Proust'),
                                         ('Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.', 'Neil Gaiman'),
                                         ('I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.', 'Neil Gaiman'),
                                         ('I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it', 'Neil Gaiman');

TRUNCATE authors;
DROP TABLE IF EXISTS authors;


CREATE TABLE authors (
    id INT Unsigned NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
INSERT INTO authors (author_name) VALUES ('Marcel Proust'),('Neil Gaiman');


UPDATE quotes
SET author_id = (SELECT id
                FROM authors
                WHERE author_name = 'Marcel Proust')
WHERE author = 'Marcel Proust';

UPDATE quotes
SET author_id = (SELECT id
                 FROM authors
                 WHERE author_name = 'Neil Gaiman')
WHERE author = 'Neil Gaiman';

ALTER TABLE quotes DROP COLUMN author;

# # SET @neil_gaiman_id := (SELECT id FROM authors WHERE author_name = 'Neil Gaiman');
# # UPDATE quotes
# # SET author_id = @neil_gaiman_id
# # WHERE author = 'Neil Gaiman';

ALTER TABLE quotes
    ADD CONSTRAINT quotes_author_id_fk
        FOREIGN KEY (author_id)
            REFERENCES authors (id);

CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        topic VARCHAR(50),
                        PRIMARY KEY (id)
);

INSERT INTO topics (topic) VALUES
                               ('literature'),
                               ('philosophy'),
                               ('inspiration'),
                               ('hope');


CREATE TABLE quote_topics (
                              quote_id INT NOT NULL,
                              topic_id INT UNSIGNED NOT NULL,
                              CONSTRAINT quote_topics_quote_id_fk FOREIGN KEY (quote_id) REFERENCES quotes (id),
                              CONSTRAINT quote_topics_topic_id_fk FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topics  (quote_id, topic_id) VALUES
                                                   (11, 2),
                                                   (11, 3),
                                                   (12, 2),
                                                   (12, 3),
                                                   (13, 1),
                                                   (13, 2),
                                                   (14, 1),
                                                   (14, 3),
                                                   (15, 3),
                                                   (15, 4),
                                                   (16, 3),
                                                   (16, 4);

SELECT content AS "Quote",
       author_name AS "Author"
FROM authors a
    JOIN quotes q ON a.id = q.author_id
    JOIN quote_topics qt ON q.id = qt.quote_id
    JOIN topics t on qt.topic_id = t.id
WHERE topic = 'literature';
