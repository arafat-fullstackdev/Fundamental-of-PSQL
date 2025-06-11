-- Active: 1748169122316@@127.0.0.1@8006@base_cmd
-- Active: 1748169122316@@127.0.0.1@8006@base_cmd
CREATE TABLE "user"(

    id SERIAL ,
    user_name VARCHAR(30),
    user_id INTEGER PRIMARY key
); 

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
   
    title TEXT NOT NULL
);


DROP TABLE posts;
SELECT * FROM posts;
SELECT * FROM "user";
ALTER TABLE posts
 ADD COLUMN user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE;
--  ADD COLUMN user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL;
DROP TABLE posts;

 --Insert
 SELECT * FROM  "user";
 DROP TABLE "user";
 ALTER TABLE "user" 
 ADD COLUMN user_id INTEGER;
 INSERT  INTO "user" (user_name, user_id) VALUES
 ('Alex', 1),
 ('Blex', 2),
 ('Clex', 3),
 ('Dlex', 4),
 ('Elex',5),
 ('Flex',6)

--Delete

--DELETE FROM "user";
INSERT INTO "user" (user_name, user_id) VALUES
('Alex', 1),
('Blex', 2),
('Clex', 3),
('Dlex', 4),
('Elex', 5),
('Flex', 6);


SELECT * FROM posts;
 INSERT INTO posts (title)
 VALUES 
('Exploring the mountains 🏔️'),
('Delicious ramen night 🍜'),
('Coding all day 💻'),
('Chilling with my cat 😺'),
('Workout complete 💪'),
('Dreaming of space 🚀');
ALTER TABLE posts
 ADD COLUMN user_id INTEGER;
ALTER TABLE posts
 ADD CONSTRAINT fk_user
 FOREIGN  KEY(user_id)
  REFERENCES "user"(user_id);
SELECT * FROM posts;
SELECT * FROM "user";

SELECT * FROM  "user"
  JOIN posts ON posts.user_id= "user".id;

SELECT * FROM posts as P
  JOIN "user" u  ON p.user_id= u.id;
