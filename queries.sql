
-- update the animals table by setting the species column to unspecified
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals WHERE species = 'unspecified';

ROLLBACK;
SELECT * FROM animals FROM species = 'unspecified';


-- update the species field to be digimon and pokemon
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon' where name LIKE '%mon%';

UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;

SELECT * FROM animals;
COMMIT;


-- 
BEGIN TRANSACTION;
DELETE FROM animals;

select * from animals;

ROLLBACK;

select * from animals;

-- a transaction to delete, create a savepoint and update
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT svpt_1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK to svpt_1;

UPDATE animals SET weight_kg = ABS(weight_kg) WHERE weight_kg < 0;

COMMIT;

select * from animals;



-- query to count the number of animals
SELECT count(*) FROM animals;

-- calculate the average weith of animals
select avg(weight_kg) from animals

-- calculate the number of animals that never tried escaping
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- the average weight of animals
SELECT AVG(weight_kg) FROM animals;

-- who escaped the most, neutered or not neutered animals;
SELECT neutered, AVG(escape_attempts) AS avg_escape_attemps
FROM animals
GROUP BY neutered 
ORDER BY avg_escape_attemps DESC;

-- the min and max weight of each type of animal
SELECT 
    species, 
    MIN(weight_kg) as min_weight, 
    MAX(weight_kg) as max_weight
FROM animals
GROUP BY species;

-- the average number of escape attempt per animal type or
-- those born between 1990 and 2000;
SELECT 
    species,
    AVG(escape_attempts) as avg_escape_attemps
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


-- WRITE QUERIES USING JOIN TO ANSWER THE FOLLOWING QUESTIONS:
-- What animals belong to Melody Pond?
SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';


-- List of all animals that are pokeman (their type is pokemon)
SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

-- List of owners and their animals
SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a on o.id = a.owner_id;

-- How many animals are there per species
SELECT s.name, COUNT(a.name) as count
FROM species s 
JOIN animals a ON s.id = a.species_id
GROUP BY s.name

-- List all Digimon owned by Jennifer Orwell
SELECT a.name
FROM animals a 
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id 
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

-- Who owns the most animal
SELECT o.full_name, COUNT(a.name) as count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY count DESC
LIMIT 1;
