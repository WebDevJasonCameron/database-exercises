USE code_test_db;


SELECT 'Albums released after 1991' AS caption
    FROM albums
    WHERE release_date > 1991;

DELETE FROM albums
    WHERE release_date > 1991;

SELECT 'Disco Albums' AS caption
    FROM albums
    WHERE genre = 'disco';

DELETE FROM albums
    WHERE genre = 'disco';

SELECT 'Albums by Whitney Houston' AS caption
    FROM albums
    WHERE artist LIKE '%Whitney Houston%';

DELETE FROM albums
    WHERE artist LIKE '%Whitney Houston%';