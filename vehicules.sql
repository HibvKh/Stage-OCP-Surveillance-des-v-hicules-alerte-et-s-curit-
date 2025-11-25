-- Création de la table Véhicules
CREATE TABLE Véhicules (
    ID INT PRIMARY KEY,
    "Nom_du_véhicule" VARCHAR(50),
    "Numéro_d'immatriculation" VARCHAR(20),
    "Nombre_de_pneus" INT,
    "Tension_des_pneus_min" DECIMAL(5,2),
    "Tension_des_pneus_max" DECIMAL(5,2),
    "Température_des_pneus_min" DECIMAL(5,2),
    "Température_des_pneus_max" DECIMAL(5,2),
    "Température_du_véhicule_min" DECIMAL(5,2),
    "Température_du_véhicule_max" DECIMAL(5,2),
    "Niveau_de_carburant_min" DECIMAL(5,2),
    "Niveau_de_carburant_max" DECIMAL(5,2),
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    "Quantité_de_charge_min" DECIMAL(10,2),
    "Quantité_de_charge_max" DECIMAL(10,2),
    "Min_kilométrage_par_trois_heures" DECIMAL(10,2),
    "Max_kilométrage_par_trois_heures" DECIMAL(10,2)
);
INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(1, 'Camion_1', 'ABC1234', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.123456, -7.123456, 1000.00, 15000.00, 50.0, 150.0),
(2, 'Camion_2', 'DEF5678', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.234567, -7.234567, 1000.00, 15000.00, 50.0, 150.0),
(3, 'Camion_3', 'GHI9012', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.345678, -7.345678, 1000.00, 15000.00, 50.0, 150.0),
(4, 'Camion_4', 'JKL3456', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.456789, -7.456789, 1000.00, 15000.00, 50.0, 150.0),
(5, 'Camion_5', 'MNO7890', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.567890, -7.567890, 1000.00, 15000.00, 50.0, 150.0),
(6, 'Camion_6', 'PQR1234', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.678901, -7.678901, 1000.00, 15000.00, 50.0, 150.0),
(7, 'Camion_7', 'STU5678', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.789012, -7.789012, 1000.00, 15000.00, 50.0, 150.0),
(8, 'Camion_8', 'VWX9012', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.890123, -7.890123, 1000.00, 15000.00, 50.0, 150.0),
(9, 'Camion_9', 'YZA3456', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.901234, -7.901234, 1000.00, 15000.00, 50.0, 150.0),
(10, 'Camion_10', 'BCD7890', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.012345, -7.012345, 1000.00, 15000.00, 50.0, 150.0),
(11, 'Camion_11', 'EFG1234', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.123456, -7.123456, 1000.00, 15000.00, 50.0, 150.0),
(12, 'Camion_12', 'HIJ5678', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.234567, -7.234567, 1000.00, 15000.00, 50.0, 150.0),
(13, 'Camion_13', 'KLM9012', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.345678, -7.345678, 1000.00, 15000.00, 50.0, 150.0),
(14, 'Camion_14', 'NOP3456', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.456789, -7.456789, 1000.00, 15000.00, 50.0, 150.0),
(15, 'Camion_15', 'QRS7890', 6, 30.5, 35.0, 75.0, 85.0, 70.0, 90.0, 10.0, 100.0, 32.567890, -7.567890, 1000.00, 15000.00, 50.0, 150.0);

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(16, 'Pelle_Mécanique_1', 'XYZ1234', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.123456, -7.123456, 2000.00, 25000.00, 60.0, 170.0),
(17, 'Pelle_Mécanique_2', 'YZA5678', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.234567, -7.234567, 2000.00, 25000.00, 60.0, 170.0),
(18, 'Pelle_Mécanique_3', 'BCD9012', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.345678, -7.345678, 2000.00, 25000.00, 60.0, 170.0),
(19, 'Pelle_Mécanique_4', 'EFG3456', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.456789, -7.456789, 2000.00, 25000.00, 60.0, 170.0),
(20, 'Pelle_Mécanique_5', 'HIJ7890', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.567890, -7.567890, 2000.00, 25000.00, 60.0, 170.0),
(21, 'Pelle_Mécanique_6', 'KLM1234', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.678901, -7.678901, 2000.00, 25000.00, 60.0, 170.0),
(22, 'Pelle_Mécanique_7', 'NOP5678', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.789012, -7.789012, 2000.00, 25000.00, 60.0, 170.0),
(23, 'Pelle_Mécanique_8', 'QRS9012', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.890123, -7.890123, 2000.00, 25000.00, 60.0, 170.0),
(24, 'Pelle_Mécanique_9', 'TUV3456', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.901234, -7.901234, 2000.00, 25000.00, 60.0, 170.0),
(25, 'Pelle_Mécanique_10', 'WXY7890', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.012345, -7.012345, 2000.00, 25000.00, 60.0, 170.0),
(26, 'Pelle_Mécanique_11', 'ZAB1234', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.123456, -7.123456, 2000.00, 25000.00, 60.0, 170.0),
(27, 'Pelle_Mécanique_12', 'CDE5678', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.234567, -7.234567, 2000.00, 25000.00, 60.0, 170.0),
(28, 'Pelle_Mécanique_13', 'FGH9012', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.345678, -7.345678, 2000.00, 25000.00, 60.0, 170.0),
(29, 'Pelle_Mécanique_14', 'IJK3456', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.456789, -7.456789, 2000.00, 25000.00, 60.0, 170.0),
(30, 'Pelle_Mécanique_15', 'LMN7890', 8, 32.5, 38.0, 78.0, 88.0, 72.0, 92.0, 15.0, 110.0, 32.567890, -7.567890, 2000.00, 25000.00, 60.0, 170.0);

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(31, 'DML_Mécanique_1', 'OPQ1234', 0, NULL, NULL, NULL, NULL, 65.0, 85.0, 20.0, 120.0, 32.654321, -7.654321, 3000.00, 35000.00, 80.0, 200.0),
(32, 'DML_Mécanique_2', 'RST5678', 0, NULL, NULL, NULL, NULL, 65.0, 85.0, 20.0, 120.0, 32.765432, -7.765432, 3000.00, 35000.00, 80.0, 200.0),
(33, 'DML_Mécanique_3', 'UVW9012', 0, NULL, NULL, NULL, NULL, 65.0, 85.0, 20.0, 120.0, 32.876543, -7.876543, 3000.00, 35000.00, 80.0, 200.0),
(34, 'DML_Mécanique_4', 'XYZ3456', 0, NULL, NULL, NULL, NULL, 65.0, 85.0, 20.0, 120.0, 32.987654, -7.987654, 3000.00, 35000.00, 80.0, 200.0),
(35, 'DML_Mécanique_5', 'ABC7890', 0, NULL, NULL, NULL, NULL, 65.0, 85.0, 20.0, 120.0, 32.098765, -7.098765, 3000.00, 35000.00, 80.0, 200.0);

UPDATE Véhicules
SET "Nom_du_véhicule" = 'DML'
WHERE "Nom_du_véhicule" LIKE 'DML_Mécanique_%';

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(36, 'Bulldozer_1', 'DEF1234', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.111111, -7.111111, 4000.00, 45000.00, 90.0, 220.0),
(37, 'Bulldozer_2', 'GHI5678', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.222222, -7.222222, 4000.00, 45000.00, 90.0, 220.0),
(38, 'Bulldozer_3', 'JKL9012', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.333333, -7.333333, 4000.00, 45000.00, 90.0, 220.0),
(39, 'Bulldozer_4', 'MNO3456', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.444444, -7.444444, 4000.00, 45000.00, 90.0, 220.0),
(40, 'Bulldozer_5', 'PQR7890', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.555555, -7.555555, 4000.00, 45000.00, 90.0, 220.0),
(41, 'Bulldozer_6', 'STU1234', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.666666, -7.666666, 4000.00, 45000.00, 90.0, 220.0),
(42, 'Bulldozer_7', 'VWX5678', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.777777, -7.777777, 4000.00, 45000.00, 90.0, 220.0),
(43, 'Bulldozer_8', 'YZA9012', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.888888, -7.888888, 4000.00, 45000.00, 90.0, 220.0),
(44, 'Bulldozer_9', 'BCD3456', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.999999, -7.999999, 4000.00, 45000.00, 90.0, 220.0),
(45, 'Bulldozer_10', 'EFG7890', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.101010, -7.101010, 4000.00, 45000.00, 90.0, 220.0),
(46, 'Bulldozer_11', 'HIJ1234', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.202020, -7.202020, 4000.00, 45000.00, 90.0, 220.0),
(47, 'Bulldozer_12', 'KLM5678', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.303030, -7.303030, 4000.00, 45000.00, 90.0, 220.0),
(48, 'Bulldozer_13', 'NOP9012', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.404040, -7.404040, 4000.00, 45000.00, 90.0, 220.0),
(49, 'Bulldozer_14', 'QRS3456', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.505050, -7.505050, 4000.00, 45000.00, 90.0, 220.0),
(50, 'Bulldozer_15', 'TUV7890', 0, NULL, NULL, NULL, NULL, 68.0, 88.0, 18.0, 115.0, 32.606060, -7.606060, 4000.00, 45000.00, 90.0, 220.0);

ALTER TABLE Véhicules
ALTER COLUMN "Tension_des_pneus_min" TYPE DECIMAL(7,2),
ALTER COLUMN "Tension_des_pneus_max" TYPE DECIMAL(7,2);

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(51, 'Komatsu_730E_1', 'AAA1111', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.111111, -6.111111, 5000.00, 55000.00, 100.0, 250.0),
(52, 'Komatsu_730E_2', 'BBB2222', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.222222, -6.222222, 5000.00, 55000.00, 100.0, 250.0),
(53, 'Komatsu_730E_3', 'CCC3333', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.333333, -6.333333, 5000.00, 55000.00, 100.0, 250.0),
(54, 'Komatsu_730E_4', 'DDD4444', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.444444, -6.444444, 5000.00, 55000.00, 100.0, 250.0),
(55, 'Komatsu_730E_5', 'EEE5555', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.555555, -6.555555, 5000.00, 55000.00, 100.0, 250.0),
(56, 'Komatsu_730E_6', 'FFF6666', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.666666, -6.666666, 5000.00, 55000.00, 100.0, 250.0),
(57, 'Komatsu_730E_7', 'GGG7777', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.777777, -6.777777, 5000.00, 55000.00, 100.0, 250.0),
(58, 'Komatsu_730E_8', 'HHH8888', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.888888, -6.888888, 5000.00, 55000.00, 100.0, 250.0),
(59, 'Komatsu_730E_9', 'III9999', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.999999, -6.999999, 5000.00, 55000.00, 100.0, 250.0),
(60, 'Komatsu_730E_10', 'JJJ1010', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.101010, -6.101010, 5000.00, 55000.00, 100.0, 250.0),
(61, 'Komatsu_730E_11', 'KKK1111', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.202020, -6.202020, 5000.00, 55000.00, 100.0, 250.0),
(62, 'Komatsu_730E_12', 'LLL1212', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.303030, -6.303030, 5000.00, 55000.00, 100.0, 250.0),
(63, 'Komatsu_730E_13', 'MMM1313', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.404040, -6.404040, 5000.00, 55000.00, 100.0, 250.0),
(64, 'Komatsu_730E_14', 'NNN1414', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.505050, -6.505050, 5000.00, 55000.00, 100.0, 250.0),
(65, 'Komatsu_730E_15', 'OOO1515', 4, 800.00, 1000.00, 50.0, 70.0, 70.0, 90.0, 25.0, 130.0, 33.606060, -6.606060, 5000.00, 55000.00, 100.0, 250.0);

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(66, 'Hitachi_EH4000_1', 'PPP1616', 8, 900.00, 1100.00, 55.0, 75.0, 75.0, 95.0, 30.0, 140.0, 34.111111, -7.111111, 6000.00, 65000.00, 120.0, 280.0),
(67, 'Hitachi_EH4000_2', 'QQQ1717', 8, 900.00, 1100.00, 55.0, 75.0, 75.0, 95.0, 30.0, 140.0, 34.222222, -7.222222, 6000.00, 65000.00, 120.0, 280.0),
(68, 'Hitachi_EH4000_3', 'RRR1818', 8, 900.00, 1100.00, 55.0, 75.0, 75.0, 95.0, 30.0, 140.0, 34.333333, -7.333333, 6000.00, 65000.00, 120.0, 280.0);

INSERT INTO Véhicules (
    ID, 
    "Nom_du_véhicule", 
    "Numéro_d'immatriculation", 
    "Nombre_de_pneus", 
    "Tension_des_pneus_min", 
    "Tension_des_pneus_max", 
    "Température_des_pneus_min", 
    "Température_des_pneus_max", 
    "Température_du_véhicule_min", 
    "Température_du_véhicule_max", 
    "Niveau_de_carburant_min", 
    "Niveau_de_carburant_max", 
    Latitude, 
    Longitude, 
    "Quantité_de_charge_min", 
    "Quantité_de_charge_max", 
    "Min_kilométrage_par_trois_heures", 
    "Max_kilométrage_par_trois_heures"
) 
VALUES
(69, 'Dragline_1', '8400', 0, NULL, NULL, NULL, NULL, 150.0, 200.0, 35.0, 150.0, 34.444444, -7.444444, 7000.00, 75000.00, 0.01, 3.00	),
(70, 'Dragline_2', '1570', 0, NULL, NULL, NULL, NULL, 150.0, 200.0, 35.0, 150.0, 34.555555, -7.555555, 7000.00, 75000.00, 0.01, 3.00);
