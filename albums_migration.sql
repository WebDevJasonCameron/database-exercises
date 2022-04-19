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
            ('Led Zeppelin', 'Led Zeppelin IV',	1971, 29.0, 'Hard rock, heavy metal, folk rock'),
            ('Michael Jackson',	'Bad',	1987,	 21.1, 'Pop'),
            ('Alanis Morissette',	'Jagged Little Pill',	1995,	24.0,	'Alternative rock'),
            ('Michael Jackson',	',Dangerous',	1991,	17.0,	'New jack swing, R&B and pop'),
            ('Celine Dion',	'Falling into You',	1996,	21.1,	'Pop, soft rock'),
            ('The Beatles',	'Sgt. Pepper''s Lonely Hearts Club Band',	1967,	18.2,	'Rock'),
            ('Various artists',	'Dirty Dancing',	1987,	17.9,	'Pop, rock, R&B'),
            ('Adele',	'21',	2011,	26.4,	'Pop, soul'),
            ('Celine Dion', 'Let''s Talk About Love',	1997,	19.3,	'Pop, soft rock'),
            ('Metallica',	'Metallica',	1991,	25.2,	'Heavy metal'),
            ('The Beatles',	'1',	2000,	23.5,	'Rock'),
            ('The Beatles',	'Abbey Road',	1969,	14.4,	'Rock'),
            ('ABBA',	'Gold: Greatest Hits',	1992,	23.0,	'Pop, disco'),
            ('Bruce Springsteen',	'Born in the U.S.A.',	1984,	19.6,	'Heartland rock'),
            ('Madonna',	'The Immaculate Collection',	1990,	19.5,	'Pop, dance'),
            ('Pink Floyd',	'The Wall',	1979,	18.7,	'Progressive rock'),
            ('James Horner',	'Titanic: Music from the Motion Picture',	1997,	18.1,	'Film score'),
            ('Dire Straits',	'Brothers in Arms',	1985,	17.7,	'Roots rock, blues rock, soft rock'),
            ('Nirvana',	'Nevermind',	1991,	16.7,	'Grunge, alternative rock'),
            ('Santana',	'Supernatural',	1999,	20.5,	'Latin rock'),
            ('Guns N'' Roses',	'Appetite for Destruction',	1987,	21.9,	'Hard rock');

DESC albums;

SHOW CREATE TABLE albums;

UPDATE albums
    SET artist = 'Nickelback'
    WHERE name = 'name 01';

SELECT * FROM albums;