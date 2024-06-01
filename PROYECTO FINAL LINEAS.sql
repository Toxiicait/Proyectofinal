
CREATE TABLE LineasTelefonicas (
    ID INT PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    NumLlamadas INT DEFAULT 0,
    DuracionTotalMinutos INT DEFAULT 0,
    CostoTotalPesos INT DEFAULT 0
);
INSERT INTO LineasTelefonicas (ID, Tipo) VALUES
(1, 'Local'),
(2, 'Larga Distancia'),
(3, 'Celular');
CREATE TABLE Llamadas (
    ID INT PRIMARY KEY,
    LineaID INT,
    DuracionMinutos INT,
    CostoPesos INT,
    FOREIGN KEY (LineaID) REFERENCES LineasTelefonicas(ID)
);
INSERT INTO Llamadas (ID, LineaID, DuracionMinutos, CostoPesos) VALUES
(1, 1, 10, 350), -- Llamada local de 10 minutos
(2, 2, 5, 1900), -- Llamada de larga distancia de 5 minutos
(3, 3, 8, 7992); -- Llamada a celular de 8 minutos
SELECT ID, Tipo, NumLlamadas, DuracionTotalMinutos, CostoTotalPesos
FROM LineasTelefonicas;
SELECT 
    SUM(CostoTotalPesos) AS CostoTotal,
    SUM(NumLlamadas) AS TotalLlamadas,
    SUM(DuracionTotalMinutos) AS TotalDuracion,
    SUM(CostoTotalPesos) / SUM(DuracionTotalMinutos) AS CostoPromedioPorMinuto
FROM LineasTelefonicas;
UPDATE LineasTelefonicas
SET NumLlamadas = 0,
    DuracionTotalMinutos = 0,
    CostoTotalPesos = 0;
