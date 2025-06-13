-- Active: 1748169122316@@127.0.0.1@8006@base_cmd
-- rangers
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);
DROP TABLE rangers;
SELECT * FROM rangers;
INSERT INTO rangers(name, region)
VALUES 
('Alex Helt', 'Western hell'),
('Blex Helt', 'Northern hell'),
('Clex Helt', 'Southern hell'),
('Elex Helt', 'Middle hell'),
('Dlex Helt', 'River side');
SELECT * FROM rangers WHERE region = 'Northern hell';

--? species
CREATE TABLE species(
    species_id SERIAL UNIQUE,
    common_name VARCHAR(50),
    scientific_name VARCHAR(60),
    discovery_date DATE ,
    conservation_status VARCHAR(50)
);
SELECT * FROM species;
INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status)
VALUES 
('Blue Rock Lizard', 'Lacerta caeruleus', '2003-05-15', 'Least Concern'),
('Golden Tree Frog', 'Phyllomedusa auratus', '1998-09-21', 'Vulnerable'),
('Crimson Marsh Snake', 'Natrix rubriventris', '2010-07-11', 'Endangered'),
('Dusky Mountain Cat', 'Felis montanus', '1985-11-03', 'Critically Endangered'),
('Spotted River Turtle', 'Trachemys maculata', '2015-02-28', 'Near Threatened');

INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status)
VALUES
('Giant Panda', 'Ailuropoda melanoleuca', '1789-01-01', 'Vulnerable'),
('Tasmanian Tiger', 'Thylacinus cynocephalus', '1792-06-20', 'Extinct'),
('Quagga', 'Equus quagga', '1778-03-10', 'Extinct');

-- and sightings
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE SET NULL,
    species_id INT REFERENCES species(species_id) ON DELETE SET NULL,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT
);

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes)
VALUES
(1, 3, '2025-05-15 08:30:00', 'Marshland East', 'Snake was basking on a rock'),
(2, 1, '2025-05-16 10:45:00', 'Rocky Ridge', 'Lizard appeared active and alert'),
(3, 2, '2025-05-17 19:20:00', 'Tree Hollow', 'Frog was seen near a small pond'),
(4, 5, '2025-05-18 14:10:00', 'River Bend', 'Turtle spotted near riverbank'),
(5, 4, '2025-05-19 06:50:00', 'Mountain Base', 'Cat tracks also visible nearby');

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes)
VALUES
(2, 2, '2025-05-20 09:15:00', 'Forest Pass', 'Frog seen under wet leaves'),
(3, 3, '2025-05-21 12:05:00', 'Eagle Pass', 'Snake coiled near a tree stump'),
(1, 5, '2025-05-22 17:30:00', 'River Crossing', 'Turtle slowly moving toward water'),
(4, 1, '2025-05-23 07:40:00', 'Cliff Edge', 'Lizard sunbathing on warm rock');


SELECT  s.sighting_id,
 r.region AS ranger_place
   FROM sightings s
 JOIN rangers r
  ON s.ranger_id= r.ranger_id;


--join
SELECT 
    s.sighting_id, 
    r.region AS ranger_place
FROM sightings s
JOIN rangers r ON s.ranger_id = r.ranger_id;
--insert 
INSERT INTO rangers(name,region)
VALUES ('Derek Fox','Coastal Plains');
SELECT * FROM rangers;
SELECT * FROM species;
-- unique
SELECT COUNT(DISTINCT species) AS unique_species_count
 FROM species;
 -- location 'pass'
 SELECT * FROM sightings;
SELECT * FROM sightings
  WHERE location LIKE '%Pass%';
  -- total sightings
  SELECT r.name, COUNT(s.sighting_id) AS total_sightings
     FROM rangers r 
     LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
     GROUP BY r.name 
     ORDER BY r.name; 

 --common name
 SELECT common_name
 FROM species
 WHERE species_id NOT IN (SELECT species_id FROM sightings);    
 --s
 SELECT sp.common_name,s.sighting_time, r.name  
 FROM sightings s  
 JOIN species sp ON s.species_id = sp.species_id
 JOIN rangers r ON s.ranger_id = r.ranger_id
 ORDER BY s.sighting_time DESC LIMIT 2;
 --update
 UPDATE species
 SET conservation_status= 'Historic'
 WHERE discovery_date <'1800-01-01';

 -- morning/ evening
 SELECT sighting_id,
    CASE 
        WHEN CAST(sighting_time AS TIME) < '12:00:00' THEN 'Morning'  
        WHEN CAST(sighting_time AS TIME) >= '12:00:00'AND CAST(sighting_time AS TIME) <= '17:00:00' THEN 'Afternoon'  
        ELSE 'Evening' 
    END AS time_of_day
     FROM sightings; 

     --delete 
     DELETE FROM rangers
      WHERE ranger_id NOT IN (
        SELECT ranger_id
         FROM sightings
      );
      