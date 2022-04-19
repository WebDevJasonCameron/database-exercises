# The name of all albums by Pink Floyd.
SELECT name FROM albums
    WHERE artist = 'Pink Floyd';

# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums
    WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

# The genre for Nevermind
SELECT * FROM albums
    WHERE genre = 'Nevermind';

SELECT 'genre for Nevermind' as caption, genre
    FROM albums
    WHERE name = 'Nevermind';

# Which albums were released in the 1990s
SELECT * FROM albums
    WHERE release_date > 1989 AND albums.release_date < 2000;

SELECT 'Albums were released in the 1990s' as caption, a.*
    FROM albums a
    WHERE release_date BETWEEN 1990 AND 1999;

# Which albums had less than 20 million certified sales
SELECT * FROM albums
    WHERE sales > 20;

SELECT 'less than 20 mil certified sales' AS caption, name
    FROM albums
    WHERE sales > 20;

# All the albums with a genre of "Rock". Why do these query results not
# include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums
    WHERE genre LIKE '%rock%'
    OR genre LIKE '%Rock%';

SELECT 'rock albums'
    FROM albums
    WHERE genre LIKE '%Rock%';