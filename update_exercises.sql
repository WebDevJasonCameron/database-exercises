USE code_test_db;

-- Write SELECT statements to output each of the following with a caption:
# All albums in your table.
SELECT artist AS 'Rock Group',
    name AS 'Album Title',
    release_date AS 'Date Released',
    sales AS 'Total Sales',
    genre
    FROM albums;

# After each SELECT add an UPDATE statement to:
# Make all the albums 10 times more popular (sales * 10)

# All albums released before 1980
SELECT artist AS 'Rock Group',
       name AS 'Album Title',
       release_date AS 'Date Released',
       sales AS 'Total Sales',
       genre
    FROM albums
    WHERE release_date < 1980;

UPDATE albums
    SET sales = sales * 10
    WHERE release_date < 1980;

SELECT * FROM albums;

#  All albums by Michael Jackson
SELECT artist AS 'Rock Group',
       name AS 'Album Title',
       release_date AS 'Date Released',
       sales AS 'Total Sales',
       genre
    FROM albums
    WHERE artist = 'Michael Jackson';



UPDATE albums
    SET sales = sales * 10
    WHERE artist = 'Michael Jackson';

SELECT * FROM albums
    WHERE artist = 'Michael Jackson';

UPDATE albums
    SET release_date = release_date - 100
    WHERE release_date < 1980;

SELECT * FROM albums
    WHERE release_date < 1980;

UPDATE albums
    SET name = 'Peter Jackson'
    WHERE name = 'Michael Jackson';

SELECT * FROM albums
    WHERE name = 'Michael Jackson';
