--1 ������
SELECT ID_������, ��������, ���, ����_��_��, �������_���������
FROM Fruit;

--2 ������
SELECT 
    f.��������,
    COALESCE(SUM(p.����������_��), 0) AS ���������_��,
    COALESCE(SUM(o.����������_��), 0) AS ���������_��
FROM Fruit f
LEFT JOIN Receipt p ON f.ID_������ = p.ID_������
LEFT JOIN Shipment o ON f.ID_������ = o.ID_������
GROUP BY f.��������;


--3 ������
SELECT f.��������, o.����������_��
FROM Remains o
JOIN Fruit f ON o.ID_������ = f.ID_������;

--4 ������
SELECT o.ID_��������, f.��������, o.����������_��, o.����_��������
FROM Shipment o
JOIN Fruit f ON o.ID_������ = f.ID_������
WHERE o.ID_������� = 1;  

--5 ������
SELECT f.ID_������, f.��������
FROM Fruit f
LEFT JOIN Shipment o ON f.ID_������ = o.ID_������
WHERE o.ID_������ IS NULL;









