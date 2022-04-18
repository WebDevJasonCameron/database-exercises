CREATE DATABASE IF NOT EXISTS blog_app;
-- pluralizing the name of the table
USE blog_app;
# Creating a table

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users  (
#       unsigned,NOT SIGNED , no negative values!
                                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                      name VARCHAR(50) NOT NULL,
                                      email VARCHAR(100),
                                      job_title VARCHAR(100),
                                      address VARCHAR(200),
                                      creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
                                      PRIMARY KEY (id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
                                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                     user_id INT UNSIGNED NOT NULL,
                                     title VARCHAR(100),
                                     body TEXT,
                                     PRIMARY KEY (id)
);


DROP TABLE IF EXISTS posts_label;
CREATE TABLE IF NOT EXISTS posts_label (
                                           post_id INT UNSIGNED NOT NULL, -- relates to table post.id
                                           label_id INT UNSIGNED NOT NULL -- relates to table labels.id
);

DROP TABLE IF EXISTS labels;
CREATE TABLE IF NOT EXISTS labels (
                                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    # only characters 25 max, not to be empty, or null
                                      name CHAR(25) NOT NULL,
                                      primary key (id)
);


INSERT INTO users (name, email, job_title, address)
VALUES ('Dane Miller', 'dane.miller@codeup.com','Web Developer and Instructor', '1234 my place');

INSERT INTO posts (user_id, title, body)
VALUES (1,'My first post', 'lots of text and stuff here');

INSERT INTO labels (name) VALUES ('Awesome');
INSERT INTO labels (name) VALUES ('The worst');
INSERT INTO labels (name) VALUES ('Ok');


INSERT INTO posts_label (post_id, label_id)  VALUES (1,1), (1,2), (1,3);


SELECT  p.id, l.name as label_name  FROM posts p
                                             INNER JOIN posts_label pl ON (pl.post_id = p.id)
                                             INNER JOIN labels l ON (l.id = pl.label_id)
WHERE p.id = 1;

# describing tables
# desc only works in mysql, other sql servers use SHOW
DESC users;


# shows all the tables in a database.
SHOW tables;

# Dropping Tables
DROP TABLE users;