DROP DATABASE IF EXISTS hw6;
CREATE DATABASE hw6;
USE hw6;

# 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
# Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION date_fonc(seconds INT) -- Функция принимает 1 параметр секунды
    RETURNS TEXT -- Возвращаем текст
    DETERMINISTIC -- Для кеширования (без него почему то не работает)
BEGIN
    DECLARE days INT; -- Локальные переменные дни, часы, минуты
    DECLARE hours INT;
    DECLARE minutes INT;
    SET days = seconds DIV 86400;
    SET seconds = seconds - days * 86400;
    SET hours = seconds DIV 3600;
    SET seconds = seconds - hours * 3600;
    SET minutes = seconds DIV 60;
    SET seconds = seconds - minutes * 60;
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, " minutes ", seconds, " seconds");
END$$
DELIMITER ;
SELECT date_fonc(123456);


# 2. Выведите только четные числа от 1 до 10.
# Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER //
CREATE PROCEDURE print_numbers
(
IN inp_number INT, -- от
IN to_number INT -- До
)
BEGIN
DECLARE n INT; 
DECLARE y INT;
DECLARE result VARCHAR(45) DEFAULT "";
SET n = inp_number;
SET y = to_number;

REPEAT
SET result = CONCAT(result, n, ","); 
SET n = n + 2;
UNTIL n > 10 
END REPEAT;
SELECT result; -- Печать строчки с результатом
END //

CALL print_numbers(0, 10)

