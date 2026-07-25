-- Active: 1783948992845@@127.0.0.1@5432@conservation_db
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);


CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULl,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(30)
    CHECK(conservation_status in ('Endangered', 'Vulnerable', 'Historic'))
);



CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    
    species_id INT NOT NULL,
    ranger_id int not null ,


    sighting_time TIMESTAMP NOT NULL,

    location VARCHAR (150) NOT NULL,

    notes TEXT,


    FOREIGN key (species_id)
    REFERENCES species(species_id),
    
    
    FOREIGN key (ranger_id)
    REFERENCES rangers(ranger_id)
);


DROP TABLE sightings;

DROP TABLE species;

DROP TABLE rangers;

select * FROM species;



INSERT INTO rangers(name, region)
VALUES
('Meera Das', 'Northern Hills'),
('John Carter', 'River Delta'),
('Sophia Khan', 'Eastern Forest'),
('David Roy', 'Mountain Range'),
('Emily Watson', 'Coastal Plains'),
('Liam Scott', 'Western Valley'),
('Noah Ahmed', 'Southern Wetlands');


INSERT INTO species
(common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Shadow Leopard', 'Panthera obscura', '1815-06-12', 'Endangered'),
('Blue Horn Deer', 'Cervus caeruleus', '1832-09-18', 'Vulnerable'),
('Golden Eagle', 'Aquila chrysaetos', '1766-01-01', 'Endangered'),
('Forest Fox', 'Vulpes sylvestris', '1902-04-21', 'Vulnerable'),
('Wild Yak', 'Bos mutus', '1776-03-15', 'Endangered'),
('Silver Wolf', 'Canis argenteus', '1854-07-30', 'Vulnerable'),
('Striped Hyena', 'Hyaena hyaena', '1758-01-01', 'Endangered');


INSERT INTO sightings
(species_id, ranger_id, location, sighting_time, notes)
VALUES
(1,1,'Hidden Pass','2024-06-01 08:30:00','Fresh footprints found'),
(2,2,'River Bend','2024-06-03 14:15:00','Grazing near water'),
(3,3,'Eagle Peak','2024-06-05 17:45:00','Flying above cliffs'),
(1,4,'Shadow Pass','2024-06-07 18:20:00','Camera trap captured image'),
(5,5,'Highland Meadow','2024-06-09 10:40:00','Small herd observed'),
(6,6,'Western Valley','2024-06-11 16:00:00','Howling heard nearby'),
(3,1,'Rocky Pass','2024-06-13 09:10:00','Nest located'),
(2,7,'Marsh Edge','2024-06-15 13:30:00','Juvenile spotted'),
(1,2,'Hidden Cave','2024-06-18 19:00:00','Night vision camera'),
(5,4,'Snow Ridge','2024-06-20 11:25:00','Tracks discovered');



-- solve Question : 01

INSERT INTO rangers(name, region)
VALUES
('Derek Fox', 'Coastal Plains')

SELECT * FROM rangers;

-- solve Question : 02

SELECT COUNT(DISTINCT species_id)
AS unique_species_count
FROM sightings;


-- solve Question : 03

SELECT * FROM sightings
WHERE LOCATION LIKE '%Pass%'


-- solve Question : 04


SELECT r.name,
count (s.sighting_id) as total_sightings

FROM rangers r
 JOIN sightings s 

 ON r.ranger_id =s.ranger_id

 GROUP BY r.name;


 -- solve Question : 05

SELECT
    sp.common_name,
    s.sighting_id
FROM species sp
LEFT JOIN sightings s
ON sp.species_id = s.species_id
WHERE s.sighting_id IS NULL;


 -- solve Question : 05


select

sp.common_name,

s.sighting_time,


r.NAME

FROM sightings s 

JOIN species sp

ON s.species_id=sp.species_id

JOIN rangers r 

on s.ranger_id=r.ranger_id

ORDER BY s.sighting_time DESC

LIMIT 2;



 -- solve Question : 07
update species
 SET conservation_status = 'Historic'
 WHERE discovery_date <'1800-01-01';



 SELECT

 sighting_id,
 

 CASE 
    WHEN EXTRACT(HOUR from sighting_time)<12
    THEN 'Morning' 
     WHEN EXTRACT(HOUR from sighting_time)
     BETWEEN 12 AND 17
     THEN  'Afternoon'
    ELSE   'Evening'
 END AS time_of_day

 FROM sightings;


 DELETE FROM rangers

WHERE ranger_id NOT IN

(
SELECT DISTINCT ranger_id
FROM sightings
);


SELECT * FROM rangers;