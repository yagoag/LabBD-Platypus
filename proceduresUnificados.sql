-- Yago
CREATE PROCEDURE adicionaLicenca (@siape char(9), @dataInicio date, @dataTermino date, @documento varchar(500), @indicacao varchar(200), @motivo varchar(200))
AS
BEGIN
    DECLARE @funcionarioExiste char(11);
    
	IF @dataTermino > @dataInicio AND @motivo IS NOT NULL AND @motivo != ''
    BEGIN
        SELECT @funcionarioExiste = cpf FROM Funcionario WHERE siape = @siape;
        IF @funcionarioExiste IS NOT NULL
        BEGIN
            INSERT INTO Licenca VALUES (@siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo);
        END
    END
END
GO

CREATE PROCEDURE apagaLicenca (@siape char(9), @dataInicio date, @dataTermino date)
AS
BEGIN
    DECLARE @licencaExiste char(9);
    
	SELECT @licencaExiste = siape FROM Licenca WHERE siape = @siape AND dataInicio = @dataInicio AND dataTermino = @dataTermino;
	IF @licencaExiste IS NOT NULL
    BEGIN
        DELETE FROM Licenca WHERE siape = @siape AND dataInicio = @dataInicio AND dataTermino = @dataTermino;
    END
END
GO

CREATE PROCEDURE atualizaLicenca (@siape char(9), @dataInicio date, @dataTermino date, @documento varchar(500), @indicacao varchar(200), @motivo varchar(200))
AS
BEGIN
    DECLARE @licencaExiste char(9);
    
	SELECT @licencaExiste = siape FROM Licenca WHERE siape = @siape AND dataInicio = @dataInicio AND dataTermino = @dataTermino;
	IF @licencaExiste IS NOT NULL
	BEGIN
		IF @motivo IS NOT NULL AND @motivo != ''
		BEGIN
			UPDATE Licenca
				SET dataInicio = @dataInicio, dataTermino = @dataTermino, documento = @documento, indicacao = @indicacao, motivo = @motivo
				WHERE siape = @siape AND dataInicio = @dataInicio AND dataTermino = @dataTermino;
		END
	END
END
GO
