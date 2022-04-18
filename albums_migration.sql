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
    VALUES ('Artist 01', 'Name 01', 2022, 1000000000, 'No Way Out');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Artist 02', 'Name 02', 2022, 1000000000, 'No Way Out');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Artist 03', 'Name 03', 2022, 1000000000, 'No Way Out');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Artist 04', 'Name 04', 2022, 1000000000, 'No Way Out');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Artist 05', 'Name 05', 2022, 1000000000, 'No Way Out');

INSERT INTO albums (artist, name, release_date, sales, genre)
    VALUES ('Artist 06', 'Name 06', 2022, 1000000000, 'No Way Out'),
           ('Artist 07', 'Name 07', 2022, 1000000000, 'No Way Out'),
           ('Artist 08', 'Name 08', 2022, 1000000000, 'No Way Out'),
           ('Artist 09', 'Name 09', 2022, 1000000000, 'No Way Out'),
           ('Artist 10', 'Name 10', 2022, 1000000000, 'No Way Out');

DESC albums;

SHOW CREATE TABLE albums;

UPDATE albums
    SET artist = 'Nickelback'
    WHERE name = 'name 01';

SELECT * FROM albums;