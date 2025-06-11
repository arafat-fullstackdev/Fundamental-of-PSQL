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

SELECT  s.sighting_id,
 r.region AS ranger_place
   FROM sightings s
 JOIN rangers r
  ON s.ranger_id= r.ranger_id;


SELECT 
    s.sighting_id, 
    r.region AS ranger_place
FROM sightings s
JOIN rangers r ON s.ranger_id = r.ranger_id;
