CREATE PROCEDURE RegisterFruitArrival
    @ID_������ INT,
    @ID_���������� INT,
    @����������_�� INT,
    @����_����������� DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- ���������� ����� ������ � ������� �����������
    INSERT INTO Receipts (ID_������, ID_����������, ����������, ����_�����������)
    VALUES (@ID_������, @ID_����������, @����������_��, @����_�����������);

    -- ���������� ��������
    IF EXISTS (SELECT * FROM Remains WHERE ID_������ = @ID_������)
    BEGIN
        UPDATE Remains
        SET ���������� = ���������� + @����������_��
        WHERE ID_������ = @ID_������;
    END
    ELSE
    BEGIN
        INSERT INTO Remains(ID_������, ����������)
        VALUES (@ID_������, @����������_��);
    END
END;
