--Active: 1748169122316@@127.0.0.1@8006@student_data
-- SELECT * FROM multiple_data;
-- -- ALTER TABLE multiple_data
-- -- ADD COLUMN EX_email VARCHAR(50) DEFAULT 'default@yahoo.com' NOT NULL;
-- ALTER TABLE multiple_data
-- ADD COLUMN designations VARCHAR(50) DEFAULT 'Developer' NOT NULL;

-- -- ALTER TABLE multiple_data
-- --    ADD id  set UNIQUE; 
-- -- ALTER TABLE multiple_data
-- --   ADD COLUMN user_code VARCHAR(50); 
-- ALTER TABLE multiple_data
-- ADD CONSTRAINT user_code_uni UNIQUE(user_code); 

-- Mak new DataBase

