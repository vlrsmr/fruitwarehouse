--1 ������
SELECT ��������, ���������
FROM Fruit
WHERE ��������� = '������'

--2 ������
INSERT INTO Client (ID_�������, ���, ����������_����, �������, �����)
VALUES ('5', '��������', '��������� ������', '89083946356', '������')

--3 ������
UPDATE Shipment
SET ���������� = 80
WHERE ID_�������� = 3

--4 ������
SELECT Fruit.��������,
Remains.����������
FROM Remains
JOIN Fruit ON Remains.ID_������ = Fruit.ID_������

--5 ������
SELECT Warehouse.ID_������, Fruit.��������, Warehouse.����������, Warehouse.����_����������
FROM Warehouse
JOIN Fruit ON Warehouse.ID_������ = Fruit.ID_������
ORDER BY Warehouse.����_���������� DESC;

