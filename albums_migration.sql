CREATE DATABASE IF NOT EXISTS code_test_db;
-- pluralizing the name of the table
USE code_test_db;

-- 3. Write some SQL to drop a table named albums if it exists.
DROP TABLE IF EXISTS albums;

# Create an albums table with the following columns:
CREATE TABLE IF NOT EXISTS albums  (
#       unsigned,NOT SIGNED , no negative values!
                                      PRIMARY KEY (id),
                                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                      artist VARCHAR(100) NOT NULL,
                                      name VARCHAR(100),
                                      release_date INT,
                                      sales FLOAT,
                                      GENRE VARCHAR(100)
);

# INSERT RECORDS
INSERT INTO albums (artist, name, release_date, sales, genre)
    VALUES ('Michael Jackson', 'Thriller', 1982, 49.2, 'Pop, post-disco, funk, rock');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('AC/DC', 'Back in Black', 1980, 29.5, 'Hard rock');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Whitney Houston', 'The Bodyguard', 1992, 32.4, 'R&B, soul, pop, soundtrack');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Meat Loaf', 'Bat Out of Hell', 1977, 21.7, 'Hard rock, glam rock, progressive rock');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Eagles', 'Their Greatest Hits', 1976, 41.2, 'Country rock, soft rock, folk rock');

INSERT INTO albums (artist, name, release_date, sales, genre)
    VALUES ('Pink Floyd', 'The Dark Side of the Moon', 1973, 24.4, 'Progressive rock'),
           ('Eagles', 'Hotel California', 1976, 31.5, 'Soft rock'),
           ('Bee Gees', 'Saturday Night Fever', 1977, 21.6, 'Disco'),
           ('Fleetwood Mac', 'Rumours', 1977, 27.9, 'Soft rock'),
           ('Shania Twain', 'Come On Over', 1997, 29.6, 'Country, pop'),
            ('Led Zeppelin', 'Led Zeppelin IV',	1971, 'Hard rock, heavy metal, folk rock', 29.0),
            ('Michael Jackson',	'Bad',	1987,	'Pop', 21.1),
            ('Alanis Morissette',	'Jagged Little Pill',	1995,	'Alternative rock',	24.),
            ('Michael Jackson',	',Dangerous',	1991,	'New jack swing, R&B and pop',	17.0),
            ('Celine Dion',	'Falling into You',	1996,	'Pop, soft rock',	21.1),
            ('The Beatles',	'Sgt. Pepper''s Lonely Hearts Club Band',	1967,	'Rock',	18.2),
            ('Various artists',	'Dirty Dancing',	1987,	'Pop, rock, R&B',	17.9),
            ('Adele',	'21',	2011,	'Pop, soul',	26.4),
            ('Celine Dion', 'Let''s Talk About Love',	1997,	'Pop, soft rock',	19.3),
            ('Metallica',	'Metallica',	1991,	'Heavy metal',	25.2),
            ('The Beatles',	'1',	2000,	'Rock',	23.5),
            ('The Beatles',	'Abbey Road',	1969,	'Rock',	14.4),
            ('ABBA',	'Gold: Greatest Hits',	1992,	'Pop, disco',	23.0),
            ('Bruce Springsteen',	'Born in the U.S.A.',	1984,	'Heartland rock',	19.6),
            ('Madonna',	'The Immaculate Collection',	1990,	'Pop, dance',	19.5),
            ('Pink Floyd',	'The Wall',	1979,	'Progressive rock',	18.7),
            ('James Horner',	'Titanic: Music from the Motion Picture',	1997,	'Film score',	18.1),
            ('Dire Straits',	'Brothers in Arms',	1985,	'Roots rock, blues rock, soft rock',	17.7),
            ('Nirvana',	'Nevermind',	1991,	'Grunge, alternative rock',	16.7),
            ('Santana',	'Supernatural',	1999,	'Latin rock',	20.5),
            ('Guns N'' Roses',	'Appetite for Destruction',	1987,	'Hard rock',	21.9);

DESC albums;

SHOW CREATE TABLE albums;

UPDATE albums
    SET artist = 'Nickelback'
    WHERE name = 'name 01';

SELECT * FROM albums;