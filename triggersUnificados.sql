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
          DECLARE cur CURSOR FOR SELECT dataInicio, dataTermino, siape, documento, indicacao, motivo FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaLicenca @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;
              FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT dataInicio, dataTermino, siape, documento, indicacao, motivo FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaLicenca @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;
              FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape, @documento, @indicacao, @motivo;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT dataInicio, dataTermino, siape FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaLicenca @dataInicio, @dataTermino, @siape;
          FETCH NEXT FROM cur INTO @dataInicio, @dataTermino, @siape;
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


-- Guilhermo

CREATE TRIGGER tInfoPessoalDocente
ON vInfoPessoalDocente
INSTEAD OF UPDATE
AS
BEGIN
  IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
      RETURN
    END
 
    -- Informacoes como Pessoa
    DECLARE @cpf               CHAR(11) 
    DECLARE @senha             VARCHAR(30) 
    DECLARE @sobreNome         VARCHAR(30)
    DECLARE @preNome           VARCHAR(30) 
    DECLARE @rgCod             VARCHAR(10)
    DECLARE @rgOrg             VARCHAR(7)
    DECLARE @endLog            VARCHAR(40)
    DECLARE @endNum            INT
    DECLARE @endCid            VARCHAR(30)
    DECLARE @endBai            VARCHAR(30)
    DECLARE @endCEP            CHAR(8)
     -- Informacoes como Docente                 
    DECLARE @siape	CHAR(9)
	DECLARE @gabineteLocal varchar(30)
	DECLARE @gabineteTelDDD char(2)
	DECLARE @gabineteTelSufixo char(4)
	DECLARE @gabineteTelPrefixo varchar(5)
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN -- Update
        DECLARE cur CURSOR FOR SELECT preNome          ,
                                      sobreNome        ,
                                      cpf              ,
                                      rgCod            ,
                                      rgOrg            ,
                                      endLog           ,
                                      endNum           ,
                                      endCid           ,
                                      endBai           ,
                                      endCEP           ,
                                      senha            ,
                                      siape	,
                                      gabineteLocal,
                                      gabineteTelDDD,
                                      gabineteTelSufixo,
                                      gabineteTelPrefixo
                              FROM inserted
        OPEN cur
        FETCH NEXT FROM cur INTO @preNome          ,
                                 @sobreNome        ,
                                 @cpf              ,
                                 @rgCod            ,
                                 @rgOrg            ,
                                 @endLog           ,
                                 @endNum           ,
                                 @endCid           ,
                                 @endBai           ,
                                 @endCEP           ,
                                 @senha            ,
                                 @siape,
                                 @gabineteLocal,
                                 @gabineteTelDDD,
                                 @gabineteTelSufixo,
                                 @gabineteTelPrefixo   
        WHILE @@FETCH_STATUS = 0
        BEGIN
          EXEC pAtualizaInfoPessoalDocente @cpf               ,    
                                         @senha             ,            
                                         @sobreNome         ,   
                                         @preNome           ,  
                                         @rgCod             ,   
                                         @rgOrg             ,  
                                         @endLog            ,    
                                         @endNum            ,   
                                         @endCid            ,   
                                         @endBai            ,   
                                         @endCEP            ,   
                                         @siape,
			                             @gabineteLocal,
			                             @gabineteTelDDD,
			                             @gabineteTelSufixo,
			                             @gabineteTelPrefixo     
        FETCH NEXT FROM cur INTO @preNome           ,
                                  @sobreNome        ,
                                  @cpf              ,
                                  @rgCod            ,
                                  @rgOrg            ,
                                  @endLog           ,
                                  @endNum           ,
                                  @endCid           ,
                                  @endBai           ,
                                  @endCEP           ,
                                  @senha            ,
                                  @siape,
                                 @gabineteLocal,
                                 @gabineteTelDDD,
                                 @gabineteTelSufixo,
                                 @gabineteTelPrefixo   
        END
        CLOSE cur
      END
    END
END    
GO
