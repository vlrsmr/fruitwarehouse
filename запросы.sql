--1 запрос
SELECT название, категория
FROM Fruit
WHERE категория = 'фрукты'

--2 запрос
INSERT INTO Client (ID_клиента, имя, контактное_лицо, телефон, адрес)
VALUES ('5', 'фруктики', 'дмитреева ульяна', '89083946356', 'Москва')

--3 запрос
UPDATE Shipment
SET количество = 80
WHERE ID_отгрузки = 3

--4 запрос
SELECT Fruit.название,
Remains.количество
FROM Remains
JOIN Fruit ON Remains.ID_фрукта = Fruit.ID_фрукта

--5 запрос
SELECT Warehouse.ID_склада, Fruit.название, Warehouse.количество, Warehouse.дата_обновления
FROM Warehouse
JOIN Fruit ON Warehouse.ID_фрукта = Fruit.ID_фрукта
ORDER BY Warehouse.дата_обновления DESC;

