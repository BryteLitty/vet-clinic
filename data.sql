/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2022-02-03', 0, true, 10.2);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gaumon', '2021-01-07', 2, true, 8.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, true, 11.0);

-- new data
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, false, -11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Plantom', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon', '2005-06-12', 1, true, -45.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom', '1998-10-13', 3, true, 17.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Ditto', '2022-05-14', 4, true, 22.0);

-- insert data into the owners table
INSERT INTO owners(full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners(full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners(full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners(full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners(full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners(full_name, age)
VALUES ('Jodie Whittaker', 38);

-- Insert Data into the Species Table
INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO species (name) VALUES ('Digimon'); 


-- Modify the animals table to include species_id value
UPDATE animals 
SET species_id = 
    CASE 
        WHEN name like '%mon%' THEN
            (SELECT id FROM species WHERE name = 'Digimon')
        ELSE
            (SELECT id FROM species WHERE name = 'Pokemon')
    END;


-- assign owners to each animal using owner_id
UPDATE animals 
SET owner_id = (
    CASE 
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name = 'Gabumon' THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name = 'Pikachu' THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name = 'Devimon' THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name = 'Plantom' THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name = 'Charmander' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name = 'Squirtle' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name = 'Blossom' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name = 'Angemon' THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
        WHEN name = 'Boarmon' THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
        WHEN name = 'Ditto' THEN NULL
    END
);