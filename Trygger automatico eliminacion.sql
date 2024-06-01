DELIMITER //
CREATE TRIGGER AfterDeleteLlamada
AFTER DELETE ON Llamadas
FOR EACH ROW
BEGIN
    UPDATE LineasTelefonicas
    SET NumLlamadas = NumLlamadas - 1,
        DuracionTotalMinutos = DuracionTotalMinutos - OLD.DuracionMinutos,
        CostoTotalPesos = CostoTotalPesos - OLD.CostoPesos
    WHERE ID = OLD.LineaID;
END//
DELIMITER ;