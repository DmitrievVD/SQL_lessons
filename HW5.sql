DROP DATABASE hw4;
CREATE DATABASE IF NOT EXISTS hw4;
USE hw4;
CREATE TABLE IF NOT EXISTS cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


#1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW cars1 AS
SELECT *
FROM cars
WHERE cost < 25000;

SELECT *
FROM cars1;

#2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars1 AS
SELECT *
FROM cars
WHERE cost < 30000;

SELECT *
FROM cars1;

#3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW skoda_audi AS
SELECT *
FROM cars
WHERE `name` IN ("Skoda","Audi");

SELECT *
FROM skoda_audi;

# Задание с применением оконной функции

CREATE TABLE IF NOT EXISTS stations
(
	train_id INT NOT NULL,
    station	 VARCHAR(45),
    station_time TIME
);
INSERT stations
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");

SELECT 
	train_id,
    station,
    station_time,
    TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id), station_time) AS time_to_next_station
FROM stations;


