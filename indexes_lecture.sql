-- ====================================
-- ============================== INDEX
-- ====================================

/*
  A data structure to enable faster table operations

  Multiple Index types (optimizes performance)...

    Primary Key
    Index / Key
    Unique Index

  - typically speeds up searching and slows insertion / updating records
  - the choice of whether or not to include an index on a column(s) should be based on weighing pros cons
  - for our use, it will be a best practice to include a primary key on every table
*/

# ============= PRIMARY KEY

CREATE DATABASE IF NOT EXISTS titan_db;

USE titan_db;

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pet_name   VARCHAR(30)  NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    PRIMARY KEY (id)
);

TRUNCATE TABLE pets;

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Sparkles', 'John Smith', 7),
       ('Snickers', 'Fred Smith', 10),
       ('Spot', 'Cathy Smith', 3),
       ('Barky', 'Alex Smith', 3);

SELECT *
FROM pets;

DESCRIBE pets;

# show indexes

SHOW INDEXES FROM pets;

# ============= INDEX

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pet_name   VARCHAR(30)  NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    INDEX index_owner_name (owner_name) # adding an index to another column
);

SHOW INDEX FROM pets;

# ============= UNIQUE

# In addition to an index, unique creates a constraint that preserves 'referential integrity' of the data

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pet_name   VARCHAR(30)  NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    UNIQUE unique_owner_name (owner_name) # adding an index to another column
);

SHOW INDEX FROM pets;

-- test unique constraint

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Fred', 2);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Snickers', 'Jack Smith', 2);

SELECT *
FROM pets;

# ============= COMPOSITE INDEXES

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pet_name   VARCHAR(30)  NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    UNIQUE unique_owner_name (pet_name, owner_name) # adding an index to another column
);

SHOW INDEX FROM pets;

-- test unique constraint

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Fred', 2);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Snickers', 'Jack Smith', 2);

INSERT INTO pets (pet_name, owner_name, age) -- ERROR
VALUES ('Snickers', 'Jack Smith', 8);

SELECT *
FROM pets;

SHOW INDEX FROM pets;

# ============= ALTER TABLE

        # add name index
ALTER TABLE pets
    ADD INDEX /* or UNIQUE */ pet_name_key (pet_name);

# drop name index
ALTER TABLE pets
DROP INDEX /* or UNIQUE */ pet_name_key;

# show all indices / keys on a table
SHOW INDEX FROM pets;

# ============================== FOREIGN KEYS

/*

  Multiple constraint types (maintains "referential integrity")...

  - Not Null
  - Unique
  - Primary Key (combo of UNIQUE and NOT NULL constraints)
  - Foreign Key
  - Default

  */

/*

pets table...
    id PK
    pet_name
    owner_name
    owner_address
    owner_dob
    owner_account_status
    age

1   'Sparky'  1,  3
2   'Bubbles'  1, 3
3   'Mr. Cheeto'  2, 10
4   'Sparkles'  1, 11

pets table...
    id PK
    pet_name
    age
    owner_id FK
    dog_toy_id FK

owners table...
    id
    owner_name
    owner_address
    owner_dob
    owner_account_status

*/

DROP TABLE IF EXISTS owners;

CREATE TABLE owners
(
    id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(30) NOT NULL,
    address VARCHAR(255) DEFAULT 'Undisclosed'
);

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id       INT UNSIGNED AUTO_INCREMENT,
    pet_name VARCHAR(30) NOT NULL,
    owner_id INT UNSIGNED,
    age      INT,
    PRIMARY KEY (id),
    /* CONSTRAINT fk_owner_id (to give FK a name) */
    FOREIGN KEY (owner_id) REFERENCES owners (id)
);

DESCRIBE pets;
SHOW INDEX FROM pets;

SHOW CREATE TABLE pets;

# ALTER TABLE pets DROP FOREIGN KEY `CONSTRAINT NAME HERE`;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', NULL, 2);

SELECT *
FROM pets;
SELECT *
FROM owners;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Spot', 1, 2); -- error (referential integrity at work!)

INSERT INTO owners (name, address)
VALUES ('Darth Smith', '1138 Death Star Rd.');

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', 1, 2);
-- will run

# If dropping tables, must drop pets, then owners table

-- ============================== OTHER EXAMPLES

-- add primary key after table creation
ALTER TABLE pets
    MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

-- drop primary key after table creation

ALTER TABLE pets -- must drop AUTO_INCREMENT first
    MODIFY id INT;

ALTER TABLE pets
DROP PRIMARY KEY;

SHOW CREATE TABLE pets;

# define primary key for multiple columns

DROP TABLE IF EXISTS pets;

CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    PRIMARY KEY (id, age)
);