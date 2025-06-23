--1 запрос
SELECT ID_фрукта, Название, Тип, Цена_за_кг, Единица_измерения
FROM Fruit;

--2 запрос
SELECT 
    f.Название,
    COALESCE(SUM(p.Количество_кг), 0) AS Поступило_кг,
    COALESCE(SUM(o.Количество_кг), 0) AS Отгружено_кг
FROM Fruit f
LEFT JOIN Receipt p ON f.ID_фрукта = p.ID_фрукта
LEFT JOIN Shipment o ON f.ID_фрукта = o.ID_фрукта
GROUP BY f.Название;


--3 запрос
SELECT f.Название, o.Количество_кг
FROM Remains o
JOIN Fruit f ON o.ID_фрукта = f.ID_фрукта;

--4 запрос
SELECT o.ID_отгрузки, f.Название, o.Количество_кг, o.Дата_отгрузки
FROM Shipment o
JOIN Fruit f ON o.ID_фрукта = f.ID_фрукта
WHERE o.ID_клиента = 1;  

--5 запрос
SELECT f.ID_фрукта, f.Название
FROM Fruit f
LEFT JOIN Shipment o ON f.ID_фрукта = o.ID_фрукта
WHERE o.ID_фрукта IS NULL;









