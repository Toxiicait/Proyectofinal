DELIMITER //
CREATE TRIGGER AfterInsertLlamada
AFTER INSERT ON Llamadas
FOR EACH ROW
BEGIN
    UPDATE LineasTelefonicas
    SET NumLlamadas = NumLlamadas + 1,
        DuracionTotalMinutos = DuracionTotalMinutos + NEW.DuracionMinutos,
        CostoTotalPesos = CostoTotalPesos + NEW.CostoPesos
    WHERE ID = NEW.LineaID;
END//
DELIMITER ;
