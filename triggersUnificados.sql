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
    
    -- Não são utilizados, porém são necessários para a seleção
    DECLARE @nome varchar(64);
    DECLARE @numCreditosPraticos int;
    DECLARE @numCreditosTeoricos int;
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT sigla, nome, numCreditosPraticos, numCreditosTeoricos, semestre, ano, siglaTurma, valida, vagas, inscricaoMin, inscricaoMax FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @sigla, @nome, @numCreditosPraticos, @numCreditosTeoricos, @semestre, @ano, @siglaTurma, @valida, @vagas, @inscricaoMin, @inscricaoMax;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaTurma @semestre, @ano, @siglaTurma, @sigla , @valida, @vagas, @inscricaoMin, @inscricaoMax;
              FETCH NEXT FROM cur INTO @sigla, @nome, @numCreditosPraticos, @numCreditosTeoricos, @semestre, @ano, @siglaTurma, @valida, @vagas, @inscricaoMin, @inscricaoMax;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT sigla, nome, numCreditosPraticos, numCreditosTeoricos, semestre, ano, siglaTurma, valida, vagas, inscricaoMin, inscricaoMax FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @sigla, @nome, @numCreditosPraticos, @numCreditosTeoricos, @semestre, @ano, @siglaTurma, @valida, @vagas, @inscricaoMin, @inscricaoMax;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaTurma @semestre, @ano, @siglaTurma, @sigla, @valida, @vagas, @inscricaoMin, @inscricaoMax;
              FETCH NEXT FROM cur INTO @sigla, @nome, @numCreditosPraticos, @numCreditosTeoricos, @semestre, @ano, @siglaTurma, @valida, @vagas, @inscricaoMin, @inscricaoMax;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT sigla, semestre, ano, siglaTurma FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @sigla, @semestre, @ano, @siglaTurma;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaTurma @semestre, @ano, @siglaTurma, @sigla;
          FETCH NEXT FROM cur INTO @sigla, @semestre, @ano, @siglaTurma;
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

CREATE TRIGGER tPlanoDeEnsino
ON PlanoEnsinoDocente
INSTEAD OF UPDATE
AS
BEGIN
  IF @@ROWCOUNT = 0
    BEGIN
      RETURN
    END

    DECLARE @semestre       tinyint
    DECLARE @ano          INT
    DECLARE @siglaTurma       VARCHAR(5)
    DECLARE @siglaDisciplina    VARCHAR(5)
    DECLARE @siape          CHAR(9)
    DECLARE @ementa         VARCHAR(max)
    DECLARE @estrategia       VARCHAR(max)
    DECLARE @objetivosEspecificos VARCHAR(max)
    DECLARE @objetivosGerais    VARCHAR(max)

    DECLARE @preNome        VARCHAR(30)
    DECLARE @sobreNome        VARCHAR(30)

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM DELETED)
      BEGIN
        DECLARE cur CURSOR FOR SELECT 
                        semestre        ,
                        ano           ,
                        siglaTurma      ,
                        siglaDisciplina   ,
                        siape         ,
                        ementa        ,
                        estrategia      ,
                        objetivosEspecificos  ,
                        objetivosGerais   ,
                        preNome       ,
                        sobreNome       
        FROM inserted
        OPEN cur
        FETCH NEXT FROM cur INTO  
                      @semestre       ,
                      @ano          ,
                      @siglaTurma       ,
                      @siglaDisciplina    ,
                      @siape          ,
                      @ementa         ,
                      @estrategia       ,
                      @objetivosEspecificos ,
                      @objetivosGerais    ,
                      @preNome        ,
                      @sobreNome        
        WHILE @@FETCH_STATUS = 0
        BEGIN
          EXEC atualizaPlanoDeEnsino  @semestre       ,
                        @ano          ,
                        @siglaTurma       ,
                        @siglaDisciplina    ,
                        @siape          ,
                        @ementa         ,
                        @estrategia       ,
                        @objetivosEspecificos   ,
                        @objetivosGerais    

        FETCH NEXT FROM cur INTO    
                        @semestre       ,
                        @ano          ,
                        @siglaTurma       ,
                        @siglaDisciplina    ,
                        @siape          ,
                        @ementa         ,
                        @estrategia       ,
                        @objetivosEspecificos ,
                        @objetivosGerais    ,
                        @preNome        ,
                        @sobreNome        

        END
        CLOSE cur
      END
    END
END
GO

-- Aquino
CREATE TRIGGER tIntervencaoDocente
ON vIntervencaoDocente
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;
	DECLARE	@siape  CHAR(9); 
	DECLARE	@siglaCurso VARCHAR(5);
	DECLARE	@idIP  int;
	DECLARE	@dataHora datetime;
	DECLARE	@idPINDE int;
	DECLARE	@propostaIntervencao VARCHAR(MAX);
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT siape, siglaCurso, idIP, dataHora, idPINDE, propostaIntervencao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC pAtualizaIntervencaoDocente @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;
              FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT siape, siglaCurso, idIP, dataHora, idPINDE, propostaIntervencao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC pAdicionaIntervencaoDocente @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;
              FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT siape, siglaCurso, idIP, dataHora, idPINDE FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC pRemoveIntervencaoDocente  @siape, @siglaCurso, @idIP, @dataHora, @idPINDE;
          FETCH NEXT FROM cur INTO @siape, @siglaCurso, @idIP, @dataHora, @idPINDE;
      END

      CLOSE cur;
    END;
    
	
END
GO

CREATE TRIGGER tComunicadoDocente
ON vComunicadoDocente
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;
	DECLARE	@siapeDocente  CHAR(9); 
	DECLARE @siglaCurso VARCHAR(5); 
	DECLARE	@idIP  int;
	DECLARE	@dataHora datetime;
	DECLARE	@idCNDE int;
	DECLARE	@comunicado VARCHAR(MAX);
    
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT siapeDocente, siglaCurso, idIP, dataHora, idCNDE, comunicado FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC pAtualizaComunicado @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;
              FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT siapeDocente, siglaCurso, idIP, dataHora, idCNDE, comunicado FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC pAdicionaComunicado @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;
              FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT siapeDocente, siglaCurso, idIP, dataHora, idCNDE FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC pRemoveComunicado  @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE;
          FETCH NEXT FROM cur INTO @siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE;
      END

      CLOSE cur;
    END;
    
	
END
GO

-- Lucas
CREATE TRIGGER tRegimentoConselhoCoordenacao
ON vRegimentoConselhoCoordenacao
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;

    DECLARE @siglaCurso varchar(5);
    DECLARE @regimento varchar(max);
	DECLARE @dataCriacao date;

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT siglaCurso, dataCriacao, regimento  FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siglaCurso, @dataCriacao, @regimento;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaRegimento @siglaCurso, @dataCriacao, @regimento;

              FETCH NEXT FROM cur INTO @siglaCurso, @dataCriacao, @regimento;
          END

          CLOSE cur;
      END
		END
END
GO

CREATE TRIGGER tProjetoPoliticoPedagogico_CoordCurso
ON vProjetoPoliticoPedagogico_CoordCurso
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;

    DECLARE @siglaCurso varchar(5);
    DECLARE @inicioVigencia date;
    DECLARE @projeto varchar(max)
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT siglaCurso, inicioVigencia, projeto FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siglaCurso, @inicioVigencia, @projeto;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaPPP @siglaCurso, @inicioVigencia, @projeto;

              FETCH NEXT FROM cur INTO @siglaCurso, @inicioVigencia, @projeto;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT siglaCurso, inicioVigencia, projeto FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @siglaCurso, @inicioVigencia, @projeto;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaPPP @siglaCurso, @inicioVigencia, @projeto;
              FETCH NEXT FROM cur INTO @siglaCurso, @inicioVigencia, @projeto;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT inicioVigencia FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @inicioVigencia;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaPPP @inicioVigencia;
          FETCH NEXT FROM cur INTO @inicioVigencia;
      END

      CLOSE cur;
    END;


END
GO

CREATE TRIGGER tPropostaReuniaoConselhoCurso_CoordCurso
ON vPropostaReuniaoConselhoCurso_CoordCurso
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;

    DECLARE @cpf char(11);
	DECLARE @preNome varchar(30);
	DECLARE @sobreNome varchar(30);
    DECLARE @siglaCurso varchar(5);
    DECLARE @dataHora datetime;
    DECLARE @idPICC int;
	DECLARE @dataCriacao date;
    DECLARE @propostaIntervencao varchar(max);

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT cpf, preNome, sobreNome, siglaCurso,  dataHora, idPICC, propostaIntervencao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @cpf, @siglaCurso, @dataHora, @idPICC, @propostaIntervencao;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaPropostaIntervencaoCC @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @dataCriacao, @propostaIntervencao;
              FETCH NEXT FROM cur INTO @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @propostaIntervencao;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT cpf, preNome, sobreNome, siglaCurso,  dataHora, idPICC, propostaIntervencao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @cpf, @preNome, @sobreNome, @siglaCurso, @dataHora, @idPICC, @propostaIntervencao;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionaPropostaIntervencaoCC @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @propostaIntervencao;
              FETCH NEXT FROM cur INTO @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @propostaIntervencao;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT cpf, preNome, sobreNome, siglaCurso, dataHora, idPICC, propostaIntervencao FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @cpf, @preNome, @sobreNome, @siglaCurso, @dataHora, @idPICC, @propostaIntervencao

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaPropostaIntervencaoCC @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @propostaIntervencao;
          FETCH NEXT FROM cur INTO @idPICC, @dataHora, @cpf, @preNome, @sobreNome, @siglaCurso, @propostaIntervencao;
      END

      CLOSE cur;
    END;
END
GO

CREATE TRIGGER tItemDePautaConselhoCurso_CoordCurso
ON vItemDePautaConselhoCurso_CoordCurso
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;

		DECLARE @idIP int;
    DECLARE @cpf char(11);
		DECLARE @preNome varchar(30);
		DECLARE @sobrenome varchar(30);
    DECLARE @siglaCurso varchar(5);
    DECLARE @dataHora datetime;
    DECLARE @descricao varchar(max);
	DECLARE @dataCriacao date;

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
      IF EXISTS(SELECT * FROM deleted)
      BEGIN
          -- Update
          DECLARE cur CURSOR FOR SELECT cpf, preNome, sobrenome, siglaCurso, idIP, dataHora, descricao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @cpf, @preNome, @sobrenome, @siglaCurso, @idIP, @dataHora, @descricao;

          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC atualizaItemdePautaRCC @idIP, @dataHora, @descricao, @cpf, @preNome, @sobrenome, @siglaCurso;
              FETCH NEXT FROM cur INTO @idIP, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao;
          END

          CLOSE cur;
      END
      ELSE
      BEGIN
         -- Insert
         DECLARE cur CURSOR FOR SELECT idIP, dataCriacao, cpf, preNome, sobrenome, siglaCurso, dataHora, descricao FROM inserted;

          OPEN cur;
          FETCH NEXT FROM cur INTO @idIP, @dataCriacao, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao;
          WHILE @@FETCH_STATUS = 0
          BEGIN
              EXEC adicionarItemdePautaRCC @idIP, @dataCriacao, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao;
              FETCH NEXT FROM cur INTO @idIP, @dataCriacao, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao;
          END

          CLOSE cur;
      END
    END
    ELSE
    BEGIN
      -- Delete
      DECLARE cur CURSOR FOR SELECT idIP, cpf, preNome, sobrenome, siglaCurso, dataHora, descricao, dataCriacao FROM deleted;

      OPEN cur;
      FETCH NEXT FROM cur INTO @idIP, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao, @dataCriacao;

      WHILE @@FETCH_STATUS = 0
      BEGIN
          EXEC apagaItemdePautaRCC @idIP, @dataHora, @descricao, @cpf, @preNome, @sobrenome, @siglaCurso, @dataCriacao;
		  
          FETCH NEXT FROM cur INTO @idIP, @cpf, @preNome, @sobrenome, @siglaCurso, @dataHora, @descricao, @dataCriacao;
      END

      CLOSE cur;
    END;


END
GO

-- Wilton
CREATE TRIGGER tTecnicoView
ON TecnicoView INSTEAD OF INSERT, DELETE, UPDATE
AS
BEGIN

    IF @@ROWCOUNT = 0 -- sair se não houver linhas a atualizar
    BEGIN
       RETURN;
    END;

    DECLARE @siape VARCHAR(9);
    DECLARE @cpf VARCHAR(11);
    DECLARE @nroGabinete INT;
    DECLARE @local VARCHAR(30);

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
		IF EXISTS(SELECT * FROM deleted)
		BEGIN
		  -- Atualizacao
			  DECLARE cur CURSOR FOR SELECT siape, cpf, nroGabinete, local  FROM inserted;

		  OPEN cur;
			  FETCH NEXT FROM cur INTO @siape, @cpf, @nroGabinete, @local;
	
		  WHILE @@FETCH_STATUS = 0
			  BEGIN
				  EXEC AtualizaTecnico @siape, @cpf, @nroGabinete, @local;

				  FETCH NEXT FROM cur INTO @siape, @cpf, @nroGabinete, @local;
			  END
	  
		  CLOSE cur;

		END
	END
END
GO

-- Alexandre
-- Trigger Informações pessoais

CREATE TRIGGER tInfoPessoalAluno
ON vInfoPessoalAluno
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
     -- Informacoes como Aluno                 
    DECLARE @ra                INT 
    DECLARE @sexoDoc           VARCHAR(max)
    DECLARE @sexoDesc          varchar(max) 
    DECLARE @sexoNome          varchar(20)
    DECLARE @maePrenome        VARCHAR(30) 
    DECLARE @maeSobrenome      VARCHAR(30)
    DECLARE @paiPrenome        VARCHAR(30) 
    DECLARE @paiSobrenome      VARCHAR(30) 
    DECLARE @nascData          date 
    DECLARE @nascLocal         varchar(30)
    DECLARE @nascUF            char(2) 
    DECLARE @emailProvedor     varchar(30) 
    DECLARE @emailEndereco     varchar(20) 
    DECLARE @ensMedAnoTermino  int 
    DECLARE @ensMedInstituicao varchar(30)
    
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
                                      ra               ,
                                      sexoDoc          ,
                                      sexoDesc         ,
                                      sexoNome         ,
                                      maePrenome       ,
                                      maeSobrenome     ,
                                      paiPrenome       ,
                                      paiSobrenome     ,
                                      nascData         ,
                                      nascLocal        ,
                                      nascUF           ,
                                      emailProvedor    ,
                                      emailEndereco    ,
                                      ensMedAnoTermino ,
                                      ensMedInstituicao
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
                                 @ra               ,
                                 @sexoDoc          ,
                                 @sexoDesc         ,
                                 @sexoNome         ,
                                 @maePrenome       ,
                                 @maeSobrenome     ,
                                 @paiPrenome       ,
                                 @paiSobrenome     ,
                                 @nascData         ,
                                 @nascLocal        ,
                                 @nascUF           ,
                                 @emailProvedor    ,
                                 @emailEndereco    ,
                                 @ensMedAnoTermino ,
                                 @ensMedInstituicao   
        WHILE @@FETCH_STATUS = 0
        BEGIN
          EXEC pAtualizaInfoPessoalAluno @cpf               ,    
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
                                         @ra                ,   
                                         @sexoDoc           ,   
                                         @sexoDesc          ,   
                                         @sexoNome          ,   
                                         @maePrenome        ,   
                                         @maeSobrenome      ,   
                                         @paiPrenome        ,   
                                         @paiSobrenome      ,   
                                         @nascData          ,   
                                         @nascLocal         ,   
                                         @nascUF            ,   
                                         @emailProvedor     ,   
                                         @emailEndereco     ,   
                                         @ensMedAnoTermino  , 
                                         @ensMedInstituicao   
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
                                  @ra               ,
                                  @sexoDoc          ,
                                  @sexoDesc         ,
                                  @sexoNome         ,
                                  @maePrenome       ,
                                  @maeSobrenome     ,
                                  @paiPrenome       ,
                                  @paiSobrenome     ,
                                  @nascData         ,
                                  @nascLocal        ,
                                  @nascUF           ,
                                  @emailProvedor    ,
                                  @emailEndereco    ,
                                  @ensMedAnoTermino ,
                                  @ensMedInstituicao
        END
        CLOSE cur
      END
    END
END    
GO

-- Trigger Inscrições em turmas
CREATE TRIGGER tInscricoesEmTurma
ON vInscriçõesEmTurma
INSTEAD OF INSERT, DELETE
AS
BEGIN
  IF @@ROWCOUNT = 0 
    BEGIN
      RETURN
    END
    
  DECLARE @ra                  int         
  DECLARE @nomeDisciplina      varchar(64)
  DECLARE @siglaDisciplina     varchar(5)
  DECLARE @numCreditosPraticos int        
  DECLARE @numCreditosTeoricos int          
  DECLARE @siglaTurma          varchar(5)  
  DECLARE @ano                 int         
  DECLARE @semestre            tinyint    
  DECLARE @vagas               int        
  DECLARE @inscricaoMin        int        
  DECLARE @inscricaoMax        int         
  DECLARE @situacao            varchar(30) 
  DECLARE @motivo              varchar(30)

  IF EXISTS(SELECT * FROM inserted)
  BEGIN  
    DECLARE cur CURSOR FOR SELECT ra                  ,                 
                                  Disciplina          ,
                                  siglaDisciplina     ,
                                  numCreditosPraticos ,
                                  numCreditosTeoricos ,
                                  siglaTurma          ,
                                  ano                 ,
                                  semestre            , 
                                  vagas               ,
                                  inscricaoMin        ,
                                  inscricaoMax        ,
                                  situacao            ,
                                  motivo              
                          FROM inserted        
    OPEN cur
    FETCH NEXT FROM cur INTO @ra                   ,
                             @nomeDisciplina       ,
                             @siglaDisciplina      , 
                             @numCreditosPraticos  ,
                             @numCreditosTeoricos  ,
                             @siglaTurma           ,
                             @ano                  ,
                             @semestre             ,
                             @vagas                ,
                             @inscricaoMin         ,
                             @inscricaoMax         ,
                             @situacao             ,
                             @motivo       
    WHILE @@FETCH_STATUS = 0
    BEGIN
      EXEC  pInsereInscriçõesEmTurma @ra                   ,
                                     @nomeDisciplina       ,
                                     @siglaDisciplina      ,                                        
                                     @numCreditosPraticos  ,
                                     @numCreditosTeoricos  ,
                                     @siglaTurma           ,
                                     @ano                  ,
                                     @semestre             ,
                                     @vagas                ,
                                     @inscricaoMin         ,
                                     @inscricaoMax         ,
                                     @situacao             ,
                                     @motivo
      FETCH NEXT FROM cur INTO @ra                   ,
                               @nomeDisciplina       ,
                               @siglaDisciplina      ,
                               @numCreditosPraticos  ,
                               @numCreditosTeoricos  ,
                               @siglaTurma           ,
                               @ano                  ,
                               @semestre             ,
                               @vagas                ,
                               @inscricaoMin         ,
                               @inscricaoMax         ,
                               @situacao             ,
                               @motivo
    END
    CLOSE cur
  END
  ELSE
  BEGIN -- Delete
    DECLARE cur CURSOR FOR SELECT ra                 ,                 
                                  siglaDisciplina    ,
                                  siglaTurma         ,
                                  ano                ,
                                  semestre            
                           FROM deleted    
    OPEN cur
    FETCH NEXT FROM cur INTO @ra                   ,
                             @siglaDisciplina      , 
                             @siglaTurma           ,
                             @ano                  ,
                             @semestre             
    WHILE @@FETCH_STATUS = 0
    BEGIN
      EXEC pRemoveInscriçõesEmTurma @ra                   ,
                                    @siglaDisciplina      ,
                                    @siglaTurma           ,
                                    @ano                  ,
                                    @semestre             
      FETCH NEXT FROM cur INTO @ra                   ,
                               @siglaDisciplina      ,
                               @siglaTurma           ,
                               @ano                  ,
                               @semestre             
    END
    CLOSE cur
  END  
END
GO

-- Marcos
CREATE TRIGGER tPlanoDeEnsino
ON PlanoEnsinoDocente
INSTEAD OF UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0
		BEGIN
			RETURN
		END

		DECLARE @semestre				tinyint
		DECLARE @ano					INT
		DECLARE @siglaTurma				VARCHAR(5)
		DECLARE @siglaDisciplina		VARCHAR(5)
		DECLARE @siape					CHAR(9)
		DECLARE @ementa					VARCHAR(max)
		DECLARE @estrategia				VARCHAR(max)
		DECLARE @objetivosEspecificos	VARCHAR(max)
		DECLARE @objetivosGerais		VARCHAR(max)

		DECLARE @preNome				VARCHAR(30)
		DECLARE @sobreNome				VARCHAR(30)

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			IF EXISTS(SELECT * FROM DELETED)
			BEGIN
				DECLARE cur CURSOR FOR SELECT preNome				,
											  sobreNome				,
											  semestre				,
											  siglaTurma			,
											  siglaDisciplina		,
											  siape					,
											  ementa				,
											  estrategia			,
											  objetivosEspecificos	,
											  objetivosGerais
				FROM inserted
				OPEN cur
				FETCH NEXT FROM cur INTO 	@preNome				,
											@sobreNome				,
											@semestre				,
											@siglaTurma				,
											@siglaDisciplina		,
											@siape					,
											@ementa					,
											@estrategia				,
											@objetivosEspecificos	,
											@objetivosGerais		
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC atualizaPlanoDeEnsino	@semestre				,
												@ano 					,
												@siglaTurma				,
												@siglaDisciplina		,
												@siape					,
												@ementa					,
												@objetivosEspecificos 	,
												@objetivosGerais 		

				FETCH NEXT FROM cur INTO 		@preNome				,
												@sobreNome				,
												@semestre				,
												@siglaTurma				,
												@siglaDisciplina		,
												@siape					,
												@ementa					,
												@estrategia				,
												@objetivosEspecificos	,
												@objetivosGerais		

				END
				CLOSE cur
			END
		END
END
GO

/*CREATE TRIGGER tRegimento
ON RegimentoDocente
INSTEAD OF UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0
		BEGIN
			RETURN
		END

		DECLARE @siglaCurso		VARCHAR(5)
		DECLARE @dataCriacao	DATE
		DECLARE @regimento 		VARCHAR(MAX)

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			IF EXISTS(SELECT * FROM deleted)
			BEGIN
				DECLARE cur CURSOR FOR SELECT siglaCurso	,
											  dataCriacao	,
											  regimento
				FROM inserted
				OPEN cur
				FETCH NEXT FROM cur INTO @siglaCurso	,
										 @dataCriacao	,
										 @regimento 	

				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC atualizaRegimentoNDE @siglaCurso	,
											  @dataCriacao	,
											  @regimento

					FETCH NEXT FROM cur INTO @siglaCurso	,
											 @dataCriacao	,
											 @regimento
				END
				CLOSE cur
			END
		END
END
GO*/

CREATE TRIGGER tPrioridade
ON TemPrioridadeDocente
INSTEAD OF UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0
		BEGIN
			RETURN
		END

		DECLARE @siglaDisciplina		VARCHAR(5)
		DECLARE @siape					CHAR(9)
		DECLARE @grau					TINYINT

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			IF EXISTS(SELECT * FROM deleted)
			BEGIN
				DECLARE cur CURSOR FOR SELECT siglaDisciplina	,
											  siape				,
											  grau				
				FROM inserted
				OPEN cur
				FETCH NEXT FROM cur INTO @siglaDisciplina 		,
										 @siape 				,
										 @grau
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC atualizaPrioridade @siglaDisciplina 	,
											@siape 				,
											@grau
					FETCH NEXT FROM cur INTO @siglaDisciplina 	,
										 @siape 				,
										 @grau
				END
				CLOSE cur
			END
		END
END
GO

/*CREATE TRIGGER tProposta
ON PropoeItemReuniaoNucleoDocenteEstruturante
INSTEAD OF UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0
		BEGIN
			RETURN
		END

		DECLARE @siapeDocente		CHAR(9)		
		DECLARE @siglaCurso			VARCHAR(5)	
		DECLARE @idIP				INT 		
		DECLARE @dataHora 			DATETIME 	

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			IF EXISTS(SELECT * FROM deleted)
			BEGIN
				DECLARE cur CURSOR FOR SELECT siglaDisciplina	,
											  siglaCurso 		,
											  idIP				,
											  dataHora
				FROM inserted
				OPEN cur
				FETCH NEXT FROM cur INTO 	  @siglaDisciplina  ,
											  @siape 			,
											  @grau
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC atualizaDescricaoItemNDE @siapeDocente		,
												  @siglaCurso		,
												  @idIP 			,
												  @dataHora	
					FETCH NEXT FROM cur INTO 	  @siapeDocente		,
												  @siglaCurso		,
												  @idIP 			,
												  @dataHora
				END
				CLOSE cur
			END
		END
END
GO*/
