-- Yago
CREATE TRIGGER licencas_ChefeDepto_T
ON licencas_ChefeDepto
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;
    
    DECLARE @siape char(9);
    DECLARE @dataInicio date;
    DECLARE @dataTermino date;
    DECLARE @documento varchar(500);
    DECLARE @indicacao varchar(200);
    DECLARE @motivo varchar(200);
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT siape, dataInicio, dataTermino, documento, indicacao, motivo FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaLicenca @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;
              FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT siape, dataInicio, dataTermino, documento, indicacao, motivo FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaLicenca @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;
              FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino, @documento, @indicacao, @motivo;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT siape, dataInicio, dataTermino FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaLicenca @siape, @dataInicio, @dataTermino;
          FETCH NEXT FROM cur INTO @siape, @dataInicio, @dataTermino;
      END

      CLOSE cur;
    END;
    
	
END
GO

CREATE TRIGGER turmas_ChefeDepto_T
ON turmas_ChefeDepto
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;
    
    DECLARE @sigla varchar(5); -- siglaDisciplina
	DECLARE @semestre tinyint;
    DECLARE @ano int;
    DECLARE @siglaTurma varchar(5);
    
    DECLARE @valida bit;
    DECLARE @vagas int;
    DECLARE @inscricaoMin int;
    DECLARE @inscricaoMax int;
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT semestre, ano, siglaTurma, sigla, valida, vagas, inscricaoMin, inscricaoMax FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaTurma @semestre, @ano, @siglaTurma, @sigla , @valida, @vagas, @inscricaoMin, @inscricaoMax;
              FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT semestre, ano, siglaTurma, sigla, valida, vagas, inscricaoMin, inscricaoMax FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaTurma @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;
              FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT semestre, ano, siglaTurma, sigla FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaTurma @semestre, @ano, @siglaTurma, @sigla;
          FETCH NEXT FROM cur INTO @semestre, @ano, @siglaTurma, @sigla;
      END

      CLOSE cur;
    END;
    
	
END
GO
