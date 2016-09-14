-- Yago
CREATE PROCEDURE adicionaLicenca (@dataInicio date, @dataTermino date, @siape char(9), @documento varchar(500), @indicacao varchar(200), @motivo varchar(200))
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

CREATE PROCEDURE apagaLicenca (@dataInicio date, @dataTermino date, @siape char(9))
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

CREATE PROCEDURE atualizaLicenca (@dataInicio date, @dataTermino date, @siape char(9), @documento varchar(500), @indicacao varchar(200), @motivo varchar(200))
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

CREATE PROCEDURE adicionaTurma (@semestre tinyint, @ano int, @siglaTurma varchar(5), @siglaDisciplina varchar(5), @valida bit, @vagas int, @inscricaoMin int, @inscricaoMax int)
AS
BEGIN
    DECLARE @discExiste varchar(5);

    IF @inscricaoMin <= @inscricaoMax
    BEGIN
        SELECT @discExiste = sigla FROM Disciplina WHERE sigla = @siglaDisciplina;
        IF @discExiste IS NOT NULL
        BEGIN
            INSERT INTO Turma VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @valida, @vagas, @inscricaoMin, @inscricaoMax);
        END
    END
END
GO

CREATE PROCEDURE apagaTurma (@semestre tinyint, @ano int, @siglaTurma varchar(5), @siglaDisciplina varchar(5))
AS
BEGIN
    DECLARE @turmaExiste tinyint;
    
	SELECT @turmaExiste = semestre FROM Turma WHERE semestre = @semestre AND ano = @ano AND siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
	IF @turmaExiste IS NOT NULL
    BEGIN
        DELETE FROM Turma WHERE semestre = @semestre AND ano = @ano AND siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    END
END
GO

CREATE PROCEDURE atualizaTurma (@semestre tinyint, @ano int, @siglaTurma varchar(5), @siglaDisciplina varchar(5), @valida bit, @vagas int, @inscricaoMin int, @inscricaoMax int)
AS
BEGIN
    DECLARE @turmaExiste tinyint;
    
	SELECT @turmaExiste = semestre FROM Turma WHERE semestre = @semestre AND ano = @ano AND siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
	IF @turmaExiste IS NOT NULL
	BEGIN
		IF @inscricaoMin <= @inscricaoMax
		BEGIN
			UPDATE Turma
				SET valida = @valida, vagas = @vagas, inscricaoMin = @inscricaoMin, inscricaoMax = @inscricaoMax
				WHERE semestre = @semestre AND ano = @ano AND siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
		END
	END
END
GO


-- Guilhermo

CREATE PROCEDURE adicionaPessoa (
    @cpf char(11),
    @senha varchar(30),
    @sobreNome varchar(30),
    @preNome varchar(30),
    @rgCod varchar(10),
    @rgOrg varchar(7),
    @endLog varchar(40),
    @endNum int,
    @endCid varchar(30),
    @endBai varchar(30),
    @endCEP char(8))
AS
BEGIN
    DECLARE @pessoaExiste varchar(11);

    SELECT @pessoaExiste = cpf FROM Pessoa WHERE cpf = @cpf;
    IF @pessoaExiste IS NULL
    BEGIN
        INSERT INTO Pessoa VALUES (@cpf, @senha, @sobreNome, @preNome, @rgCod, @rgOrg, @endLog, @endNum, @endCid, @endBai, @endCEP);
    END
END
GO

CREATE PROCEDURE apagaPessoa (@cpf CHAR(11))
AS
BEGIN
    DECLARE @pessoaExiste varchar(11);

    SELECT @pessoaExiste = cpf FROM Pessoa WHERE cpf = @cpf;
    IF @pessoaExiste IS NOT NULL
    BEGIN
        DELETE FROM Pessoa WHERE cpf = @cpf;
    END
END
GO

CREATE PROCEDURE atualizaPessoa (
	@cpf       CHAR(11),
    @senha     VARCHAR(30),
    @sobreNome VARCHAR(30),
    @preNome   VARCHAR(30),
    @rgCod     VARCHAR(10),
    @rgOrg     VARCHAR(7),
    @endLog    VARCHAR(40),
    @endNum    INT,
    @endCid    VARCHAR(30),
    @endBai    VARCHAR(30),
    @endCEP    CHAR(8))
AS
BEGIN
    DECLARE @pessoaExiste tinyint;
    
	SELECT @pessoaExiste = cpf FROM Pessoa WHERE cpf = @cpf;
	IF @pessoaExiste IS NOT NULL
	BEGIN
		UPDATE Pessoa
			SET senha = @senha, sobreNome = @sobreNome, preNome = @preNome, rgCod = @rgCod, rgOrg = @rgOrg, endLog = @endLog, endNum = @endNum, endCid = @endCid, endBai = @endBai, endCEP = @endCEP
			WHERE cpf = @cpf;
	END
END
GO

CREATE PROCEDURE adicionaFuncionario (
    @siape char(9),
	@cpf   char(11))
AS
BEGIN
    DECLARE @FuncionarioExiste varchar(11);

    SELECT @FuncionarioExiste = cpf FROM Funcionario WHERE cpf = @cpf;
    IF @FuncionarioExiste IS NULL
    BEGIN
    	SELECT @FuncionarioExiste = cpf FROM Pessoa WHERE cpf = @cpf;
    	IF @FuncionarioExiste IS NOT NULL
    	BEGIN
        	INSERT INTO Funcionario VALUES (@siape, @cpf);
        END
    END
END
GO

CREATE PROCEDURE apagaFuncionario (@siape CHAR(9))
AS
BEGIN
    DECLARE @FuncionarioExiste varchar(9);

    SELECT @FuncionarioExiste = siape FROM Funcionario WHERE siape = @siape;
    IF @FuncionarioExiste IS NOT NULL
    BEGIN
        DELETE FROM Funcionario WHERE siape = @siape;
    END
END
GO

CREATE PROCEDURE adicionaDocente (
    @siape	char(9),
    @gabineteLocal	varchar(30),
    @gabineteTelDDD char(2),
    @gabineteTelSufixo char(4),
    @gabineteTelPrefixo varchar(5))
AS
BEGIN
    DECLARE @DocenteExiste varchar(9);


    SELECT @DocenteExiste = siape FROM Docente WHERE siape = @siape;
    IF @DocenteExiste IS NULL
    BEGIN
    	SELECT @DocenteExiste = siape FROM Funcionario WHERE siape = @siape;
    	IF @DocenteExiste IS NOT NULL
    	BEGIN
        	INSERT INTO Docente VALUES (@siape, @gabineteLocal, @gabineteTelDDD, @gabineteTelSufixo, @gabineteTelPrefixo);
        END
    END
END
GO

CREATE PROCEDURE apagaDocente (@siape CHAR(11))
AS
BEGIN
    DECLARE @DocenteExiste varchar(11);

    SELECT @DocenteExiste = siape FROM Docente WHERE siape = @siape;
    IF @DocenteExiste IS NOT NULL
    BEGIN
        DELETE FROM Docente WHERE siape = @siape;
    END
END
GO

CREATE PROCEDURE atualizaDocente (
    @siape	char(9),
    @gabineteLocal	varchar(30),
    @gabineteTelDDD char(2),
    @gabineteTelSufixo char(4),
    @gabineteTelPrefixo varchar(5)
    )
AS
BEGIN
    DECLARE @DocenteExiste char(9);
    
	SELECT @DocenteExiste = siape FROM Docente WHERE siape = @siape;
	IF @DocenteExiste IS NOT NULL
	BEGIN
		UPDATE Docente
			SET @gabineteLocal = gabineteLocal, @gabineteTelDDD = gabineteTelDDD, @gabineteTelSufixo = gabineteTelSufixo, @gabineteTelSufixo = gabineteTelSufixo
			WHERE siape = @siape;
	END
END
GO


CREATE PROCEDURE pAtualizaInfoPessoalDocente 
	(-- Informacoes como Pessoa
	@cpf               CHAR(11), 
	@senha             VARCHAR(30), 
	@sobreNome         VARCHAR(30),
	@preNome           VARCHAR(30), 
	@rgCod             VARCHAR(10),
	@rgOrg             VARCHAR(7),
	@endLog            VARCHAR(40),
	@endNum            INT,
	@endCid            VARCHAR(30),
	@endBai            VARCHAR(30),
	@endCEP            CHAR(8),
	-- Informacoes como Docente                 
	@siape	CHAR(9),
	@gabineteLocal varchar(30),
	@gabineteTelDDD char(2),
	@gabineteTelSufixo char(4),
	@gabineteTelPrefixo varchar(5))

AS
	BEGIN
		UPDATE Pessoa
		SET
			cpf       = @cpf      , 
			senha     = @senha    , 
			sobreNome = @sobreNome, 
			preNome   = @preNome  , 
			rgCod     = @rgCod    ,
			endLog    = @endLog   ,
			endNum    = @endNum   , 
			endCid    = @endCid   ,
			endBai    = @endBai   ,
			endCEP    = @endCEP    
		WHERE cpf = @cpf;

		UPDATE Funcionario
		SET
			cpf = @cpf,
			siape = @siape
		WHERE cpf = @cpf;

		UPDATE Docente
		SET
			siape = @siape,
			gabineteLocal = @gabineteLocal,
			gabineteTelDDD = @gabineteTelDDD,
			gabineteTelSufixo = @gabineteTelSufixo,
			gabineteTelPrefixo = @gabineteTelPrefixo
		WHERE siape = @siape;
	END
GO

CREATE PROCEDURE adicionaPlanoDeEnsino (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @siape                CHAR(9),
    @ementa               varchar(max),
    @estrategia           varchar(max),
    @objetivosEspecificos varchar(max),
    @objetivosGerais      varchar(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @siape, @ementa, @estrategia, @objetivosEspecificos, @objetivosGerais);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsino (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @siape                CHAR(9),
    @ementa               varchar(max),
    @estrategia           varchar(max),
    @objetivosEspecificos varchar(max),
    @objetivosGerais      varchar(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino 
            SET siape = @siape, ementa = @ementa, estrategia = @estrategia, objetivosEspecificos = @objetivosEspecificos, objetivosGerais = @objetivosGerais
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsino (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoRecurso (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @recurso         VARCHAR(500))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Recurso WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND recurso = @recurso;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_Recurso VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @recurso);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoRecurso (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @recurso         VARCHAR(500))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Recurso WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina  AND recurso = @recurso;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_Recurso 
            SET recurso = @recurso
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoRecurso (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @recurso varchar(500))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Recurso WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND recurso = @recurso;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_Recurso  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina  AND recurso = @recurso;
    END
END
GO


CREATE PROCEDURE adicionaPlanoDeEnsinoAtividades (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @id                int,
    @atividade         VARCHAR(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Atividades WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_Atividades VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @horas, @id, @atividade);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoAtividades (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @id                int,
    @atividade         VARCHAR(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Atividades WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_Atividades 
            SET horas = @horas, id = @id, atividade = @atividade
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoAtividades (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas INT,
    @id INT)
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Atividades WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_Atividades  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoEAD (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @atividade         VARCHAR(200))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_EAD WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_EAD VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @horas, @atividade);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoEAD (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @atividade         VARCHAR(200))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_EAD WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_EAD 
            SET horas = @horas, atividade = @atividade
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoEAD (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas INT,
    @atividade INT)
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_EAD WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_EAD  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoDistribHoras (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @atividade         VARCHAR(200))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_DistribHoras WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_DistribHoras VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @horas, @atividade);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoDistribHoras (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @atividade         VARCHAR(200))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_DistribHoras WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_DistribHoras 
            SET horas = @horas, atividade = @atividade
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoDistribHoras (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas INT,
    @atividade INT)
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_DistribHoras WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_DistribHoras  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND atividade = @atividade;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoBibliografiaBasica (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaBasica WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @titulo, @editor, @bibAno, @autor);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoBibliografiaBasica (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaBasica WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_BibliografiaBasica 
            SET  titulo = @titulo, editor = @editor, bibAno = @bibAno, autor = @autor
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND  titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoBibliografiaBasica (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaBasica WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_BibliografiaBasica  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND  titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoBibliografiaComplementar (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaComplementar WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS  NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @titulo, @editor, @bibAno, @autor);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoBibliografiaComplementar (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaComplementar WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_BibliografiaComplementar 
            SET  titulo = @titulo, editor = @editor, bibAno = @bibAno, autor = @autor
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND  titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoBibliografiaComplementar (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @titulo          VARCHAR(100),
    @editor          VARCHAR(50),
    @bibAno          INT,
    @autor           VARCHAR(50))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_BibliografiaComplementar WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_BibliografiaComplementar  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND  titulo = @titulo AND editor = @editor AND bibAno = @bibAno AND autor = @autor;
    END
END
GO

CREATE PROCEDURE adicionaPlanoDeEnsinoTopico (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @id                int,
    @topico         VARCHAR(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Topico WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NULL
    BEGIN
        INSERT INTO PlanoDeEnsino_Topico VALUES (@semestre, @ano, @siglaTurma, @siglaDisciplina, @horas, @id, @topico);
    END
END
GO

CREATE PROCEDURE atualizaPlanoDeEnsinoTopico (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas            INT,
    @id                int,
    @topico         VARCHAR(max))
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Topico WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NOT NULL
    BEGIN
        UPDATE PlanoDeEnsino_Topico 
            SET horas = @horas, id = @id, topico = @topico
            WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    END
END
GO

CREATE PROCEDURE apagaPlanoDeEnsinoTopico (
    @semestre             tinyint,
    @ano                  INT,
    @siglaTurma           VARCHAR(5),
    @siglaDisciplina      VARCHAR(5),
    @horas INT,
    @id INT)
AS
BEGIN
    DECLARE @planoExiste varchar(5);

    SELECT @planoExiste = siglaTurma FROM PlanoDeEnsino_Topico WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    IF @planoExiste IS NOT NULL
    BEGIN
        DELETE FROM PlanoDeEnsino_Topico  WHERE semestre = @semestre AND ano = @ano AND  siglaTurma = @siglaTurma AND siglaDisciplina = @siglaDisciplina AND horas = @horas AND id = @id;
    END
END
GO

-- Aquino
CREATE PROCEDURE pAdicionaComunicado	(@siapeDocente  CHAR(9), 
				      @siglaCurso VARCHAR(5), 
				      @idIP  int, 
				      @dataHora datetime,
                      			@idCNDE int, 
				      @comunicado VARCHAR(MAX))
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	IF (@siapeDocente IS NOT NULL AND 
	   @siglaCurso IS NOT NULL AND 
	   @idIP IS NOT NULL AND 
	   @dataHora IS NOT NULL AND 
	   @idCNDE IS NOT NULL AND 
	   @comunicado IS NOT NULL  )
        BEGIN

        -- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;

	-- Verifica se o siape passado é um siape válido para Docente
	SELECT @docenteExiste = siape FROM Docente D WHERE D.siape = @siapeDocente



        IF 	@docenteExiste IS NOT NULL AND
		@siglaCursoExiste IS NOT NULL AND 
		@idIPExiste  IS NOT NULL AND
		@dataHoraExiste IS NOT NULL 
	BEGIN
			INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES (@siapeDocente, @siglaCurso, @idIP, @dataHora, @idCNDE, @comunicado);
	END
	END
END
GO

CREATE PROCEDURE pAtualizaComunicado	(@siapeDocente  CHAR(9), 
				      @siglaCurso VARCHAR(5), 
				      @idIP  int, 
				      @dataHora datetime,
                      @idCNDE int, 
				      @comunicado VARCHAR(MAX))
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	IF (@siapeDocente IS NOT NULL AND 
	   @siglaCurso IS NOT NULL AND 
	   @idIP IS NOT NULL AND 
	   @dataHora IS NOT NULL AND 
	   @idCNDE IS NOT NULL AND 
	   @comunicado IS NOT NULL  )
        BEGIN

        -- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;

	-- Verifica se o siape passado é um siape válido para Docente
	SELECT @docenteExiste = siape FROM Docente D WHERE D.siape = @siapeDocente



        IF 	@docenteExiste IS NOT NULL AND
		@siglaCursoExiste IS NOT NULL AND 
		@idIPExiste  IS NOT NULL AND
		@dataHoraExiste IS NOT NULL 
	BEGIN
			UPDATE ComunicadoNucleoDocenteEstruturante 
				SET 	
					comunicado = @comunicado
				WHERE 	
					siapeDocente = @siapeDocente AND 
					siglaCurso = @siglaCurso AND 
					idIP = @idIP AND 
					dataHora = @dataHora AND 
					idCNDE = @idCNDE;
	END
	END
END
GO

CREATE PROCEDURE pRemoveComunicado (@siapeDocente  CHAR(9), 
				      @siglaCurso VARCHAR(5), 
				      @idIP  int, 
				      @dataHora datetime,
                      @idCNDE int)
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	-- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;


        IF 	@docenteExiste IS NOT NULL AND
		@siglaCursoExiste IS NOT NULL AND 
		@idIPExiste  IS NOT NULL AND
		@dataHoraExiste IS NOT NULL 
		BEGIN
			DELETE FROM ComunicadoNucleoDocenteEstruturante 
			WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora 
			AND idCNDE = @idCNDE;
		END
    
END
GO

CREATE PROCEDURE pAdicionaIntervencaoDocente	(
				@siape  CHAR(9), 
				@siglaCurso VARCHAR(5), 
				@idIP  int, 
				@dataHora datetime,
				@idPINDE int, 
				@propostaIntervencao VARCHAR(MAX)
			)
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	IF 
		@siape IS NOT NULL AND 
		@siglaCurso IS NOT NULL AND 
		@idIP IS NOT NULL AND 
		@dataHora IS NOT NULL AND 
		@idPINDE IS NOT NULL AND 
		@propostaIntervencao IS NOT NULL  
	BEGIN

        -- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siape AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;

	-- Verifica se o siape passado é um siape válido para Docente
	SELECT @docenteExiste = siape FROM Docente D WHERE D.siape = @siape



		IF 	
			@docenteExiste IS NOT NULL AND
			@siglaCursoExiste IS NOT NULL AND 
			@idIPExiste  IS NOT NULL AND
			@dataHoraExiste IS NOT NULL 
		BEGIN
			INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES (@siape, @siglaCurso, @idIP, @dataHora, @idPINDE, @propostaIntervencao);
	END
	END
END
GO

CREATE PROCEDURE pAtualizaIntervencaoDocente	(
				@siape  CHAR(9), 
				@siglaCurso VARCHAR(5), 
				@idIP  int, 
				@dataHora datetime,
				@idPINDE int, 
				@propostaIntervencao VARCHAR(MAX)
			)
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	IF 
		@siape IS NOT NULL AND 
		@siglaCurso IS NOT NULL AND 
		@idIP IS NOT NULL AND 
		@dataHora IS NOT NULL AND 
		@idPINDE IS NOT NULL AND 
		@propostaIntervencao IS NOT NULL  
	BEGIN

        -- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siape AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;

	-- Verifica se o siape passado é um siape válido para Docente
	SELECT @docenteExiste = siape FROM Docente D WHERE D.siape = @siape



	IF 	
		@docenteExiste IS NOT NULL AND
		@siglaCursoExiste IS NOT NULL AND 
		@idIPExiste  IS NOT NULL AND
		@dataHoraExiste IS NOT NULL 
	BEGIN
		UPDATE PropostaIntervencaoNucleoDocenteEstruturante 
				SET 	
					propostaIntervencao = @propostaIntervencao
				WHERE 	
					siape = @siape AND 
					siglaCurso = @siglaCurso AND 
					idIP = @idIP AND 
					dataHora = @dataHora AND 
					idPINDE = @idPINDE;
	END
	END
END
GO

CREATE PROCEDURE pRemoveIntervencaoDocente (
				@siape  CHAR(9), 
				@siglaCurso VARCHAR(5), 
				@idIP  int, 
				@dataHora datetime,
				@idPINDE int
			)
AS
BEGIN
    	DECLARE @docenteExiste CHAR(9);
		DECLARE @siglaCursoExiste VARCHAR(5);
		DECLARE @idIPExiste INT;
		DECLARE @dataHoraExiste DATETIME;

	IF 
		@siape IS NOT NULL AND 
		@siglaCurso IS NOT NULL AND 
		@idIP IS NOT NULL AND 
		@dataHora IS NOT NULL AND 
		@idPINDE IS NOT NULL 
	BEGIN

        -- Verifica se o os dados conferem com os dados de quem propos a Reunião
 	SELECT @docenteExiste = siapeDocente, @siglaCursoExiste = siglaCurso,  @idIPExiste = idIP, @dataHoraExiste = dataHora 
	FROM PropoeItemReuniaoNucleoDocenteEstruturante 
	WHERE siapeDocente = @siape AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora;


        IF 	@docenteExiste IS NOT NULL AND
		@siglaCursoExiste IS NOT NULL AND 
		@idIPExiste  IS NOT NULL AND
		@dataHoraExiste IS NOT NULL 
		BEGIN
			DELETE FROM PropostaIntervencaoNucleoDocenteEstruturante 
			WHERE siape = @siape AND siglaCurso = @siglaCurso AND idIP = @idIP AND dataHora = @dataHora 
			AND idPINDE = @idPINDE;
		END
	END
    
END
GO

-- Marcos
CREATE PROCEDURE adicionaPrioridade (
    @siglaDisciplina    varchar(5),
    @siape              char(9),
    @grau               tinyint)
AS
BEGIN
    DECLARE @disciplinaExiste varchar(5);

    SELECT @disciplinaExiste = siglaDisciplina FROM TemPrioridadeDocente WHERE siape = @siape AND grau = @grau;
    IF @disciplinaExiste IS NULL
    BEGIN
        INSERT INTO TemPrioridadeDocente VALUES (@siglaDisciplina, @siape, @grau);
    END
END
GO

CREATE PROCEDURE apagaPrioridade(
    @siglaDisciplina    varchar(5),
    @siape              char(9))
AS
BEGIN
    DECLARE @planoExiste varchar(5);
	DECLARE @disciplinaExiste varchar(5);

    SELECT @disciplinaExiste = siglaDisciplina FROM TemPrioridadeDocente WHERE siape = @siape AND siglaDisciplina = @siglaDisciplina;
    IF @disciplinaExiste IS NOT NULL
    BEGIN
        DELETE FROM TemPrioridadeDocente WHERE @siglaDisciplina = siglaDisciplina AND @siape = siape;
    END
END
GO

CREATE PROCEDURE atualizaPrioridade(
    @siglaDisciplina    varchar(5),
    @siape              char(9),
    @grau               tinyint)
AS
BEGIN
    DECLARE @disciplinaExiste varchar(5);

    SELECT @disciplinaExiste = siglaDisciplina FROM TemPrioridadeDocente WHERE siape = @siape AND grau = @grau;
    IF @disciplinaExiste IS NOT NULL
    BEGIN
        UPDATE TemPrioridadeDocente
        SET grau = @grau
        WHERE @siglaDisciplina = siglaDisciplina AND @siape = siape;
    END
END
GO

-- Propostas da reunião do núcleoDocenteEstruturante (apenas se for membro do núcleo)
CREATE PROCEDURE adicionaItemNDE (
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@idIP			int,
	@dataHora		datetime,
	@descricao		nvarchar(200))
AS
BEGIN
	DECLARE @itemExiste int;
	SELECT @itemExiste = idIP FROM PropoeItemReuniaoNucleoDocenteEstruturante WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND dataHora = @dataHora;
	IF @itemExiste IS NULL
	BEGIN
		INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES (@siapeDocente, @siglaCurso, @idIP, @dataHora);
		INSERT INTO ItemDePauta VALUES (@idIP, @dataHora, @descricao);
	END
END
GO

CREATE PROCEDURE removeItemNDE (
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@idIP			int,
	@dataHora		datetime)
AS
BEGIN
	DECLARE @itemExiste int;
	SELECT @itemExiste = idIP FROM PropoeItemReuniaoNucleoDocenteEstruturante WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND dataHora = @dataHora;
	IF @itemExiste IS NOT NULL
	BEGIN
		DELETE FROM PropoeItemReuniaoNucleoDocenteEstruturante WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND dataHora = @dataHora AND @idIP = idIP;
		DELETE FROM ItemDePauta WHERE @idIP = idIP;
	END
END
GO

CREATE PROCEDURE atualizaDescricaoItemNDE (
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@idIP			int,
	@dataHora		datetime)
AS
BEGIN
	DECLARE @itemExiste int;
	DECLARE @descricao nvarchar(200);
	SELECT @itemExiste = idIP FROM PropoeItemReuniaoNucleoDocenteEstruturante WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND dataHora = @dataHora;
	IF @itemExiste IS NOT NULL
	BEGIN
	UPDATE ItemDePauta
		SET descricao = @descricao
		WHERE idIP = @idIP AND dataHora = @dataHora;
	END
END
GO


CREATE PROCEDURE atualizaDataItemNDE (
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@idIP			int,
	@dataHora		datetime)
AS
BEGIN
	DECLARE @itemExiste int;
	SELECT @itemExiste = idIP FROM PropoeItemReuniaoNucleoDocenteEstruturante WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso AND dataHora = @dataHora;
	IF @itemExiste IS NOT NULL
	BEGIN
	UPDATE PropoeItemReuniaoNucleoDocenteEstruturante
		SET dataHora = @dataHora
		WHERE siapeDocente = @siapeDocente AND siglaCurso = @siglaCurso;
	END
END
GO

-- Editar regimento e membros do nucleoDocenteEstruturante (apenas se for líder do núcleo)
CREATE PROCEDURE atualizaRegimentoNDE (
	@siglaCurso		varchar(5),
	@dataCriacao	date,
	@regimento 		text)

AS
BEGIN
	DECLARE @NDEExiste	varchar(5);
	SELECT @NDEExiste = siglaCurso FROM NucleoDocenteEstruturante WHERE @dataCriacao = dataCriacao;
	IF @NDEExiste IS NOT NULL
	BEGIN
	UPDATE NucleoDocenteEstruturante
		SET regimento = @regimento
		WHERE @siglaCurso = siglaCurso;
	END
END
GO

CREATE PROCEDURE atualizaSiapeMembrosNDE(
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@dataPosse		date,
	@portaria		varchar(max))
AS
BEGIN
	DECLARE @membroExiste char(9);
	SELECT @membroExiste = siapeDocente FROM MembroNucleoDocenteEstruturante WHERE @siglaCurso = siglaCurso AND dataPosse = @dataPosse;
	IF @membroExiste IS NOT NULL
	BEGIN
		UPDATE MembroNucleoDocenteEstruturante
		SET siapeDocente = @siapeDocente
		WHERE @siglaCurso = siglaCurso;
	END
END
GO

CREATE PROCEDURE atualizaSiglaCursoMembrosNDE(
	@siapeDocente	char(9),
	@siglaCurso		varchar(5),
	@dataPosse		date,
	@portaria		varchar(max))
AS
BEGIN
	DECLARE @membroExiste char(9);
	SELECT @membroExiste = siapeDocente FROM MembroNucleoDocenteEstruturante WHERE @siglaCurso = siglaCurso AND dataPosse = @dataPosse;
	IF @membroExiste IS NOT NULL
	BEGIN
		UPDATE MembroNucleoDocenteEstruturante
		SET siglaCurso = @siglaCurso
		WHERE @siapeDocente = siapeDocente;
	END
END
GO

-- Wilton
/* Insere tecnico em tabela Tecnico caso exista CPF na tabela Pessoa */
CREATE PROCEDURE InserirTecnico (
	@siape CHAR(9),
	@cpf   CHAR(11),
	@nroGabinete INT,
	@local VARCHAR(30)
	)
AS
BEGIN
	DECLARE @cpfExiste VARCHAR(11);
	SELECT @cpfExiste = cpf FROM Pessoa WHERE cpf = @cpf;

	IF @cpfExiste IS NOT NULL
	BEGIN	
		INSERT INTO Tecnico VALUES (@siape, @nroGabinete, @local);

	END
END
GO

/* Delete tecnico da tabela Tecnico */
CREATE PROCEDURE DeletaTecnico (
	@siape VARCHAR(9)
	)
AS
BEGIN
	DECLARE @siapeExiste VARCHAR(9);
	
	SELECT @siapeExiste = siape FROM Tecnico WHERE siape = @siape;

	IF @siapeExiste IS NOT NULL
	BEGIN
		DELETE FROM Tecnico WHERE siape = @siape;
	END

END
GO


/* Atualiza informações na tabela tecnico */
CREATE PROCEDURE AtualizaTecnico (
	@siape VARCHAR(9),
	@cpf   VARCHAR(11),
	@nroGabinete INT,
	@local VARCHAR(30)
	)
AS
BEGIN
	DECLARE @siapeExiste VARCHAR(9);
	
	SELECT @siapeExiste = siape FROM Tecnico WHERE siape = @siape;

	IF @siapeExiste IS NOT NULL
	BEGIN
		UPDATE Tecnico SET siape = @siape, nroGabinete = @nroGabinete , local = @local WHERE siape = @siape;
	END

END
GO

-- Alexandre
CREATE PROCEDURE pAtualizaInfoPessoalAluno 
		(-- Informacoes como Pessoa
                 @cpf               CHAR(11), 
		 @senha             VARCHAR(30), 
                 @sobreNome         VARCHAR(30),
                 @preNome           VARCHAR(30), 
                 @rgCod             VARCHAR(10),
		 @rgOrg             VARCHAR(7),
		 @endLog            VARCHAR(40),
		 @endNum            INT,
		 @endCid            VARCHAR(30),
		 @endBai            VARCHAR(30),
		 @endCEP            CHAR(8),
                 -- Informacoes como Aluno                 
                 @ra                INT, 
                 @sexoDoc           VARCHAR(max),
                 @sexoDesc          varchar(max), 
                 @sexoNome          varchar(20),
                 @maePrenome        VARCHAR(30), 
                 @maeSobrenome      VARCHAR(30),
                 @paiPrenome        VARCHAR(30), 
                 @paiSobrenome      VARCHAR(30), 
                 @nascData          date, 
                 @nascLocal         varchar(30),
                 @nascUF            char(2), 
                 @emailProvedor     varchar(30), 
                 @emailEndereco     varchar(20), 
                 @ensMedAnoTermino  int, 
                 @ensMedInstituicao varchar(30))

AS
	BEGIN
		UPDATE Pessoa
		SET cpf       = @cpf      , 
         	    senha     = @senha    , 
		    sobreNome = @sobreNome, 
		    preNome   = @preNome  , 
		    rgCod     = @rgCod    ,
		    endLog    = @endLog   ,
		    endNum    = @endNum   , 
		    endCid    = @endCid   ,
		    endBai    = @endBai   ,
		    endCEP    = @endCEP    
		WHERE cpf = @cpf;

		UPDATE Aluno
		SET     cpf               = @cpf               , 
			sexoDoc           = @sexoDoc           , 
			sexoDesc          = @sexoDesc          , 
			sexoNome          = @sexoNome          , 
			maePrenome        = @maePrenome        ,
			maeSobrenome      = @maeSobrenome      ,
			paiPrenome        = @paiPrenome        , 
			paiSobrenome      = @paiSobrenome      ,
			nascData          = @nascData          ,
			nascLocal         = @nascLocal         , 
			nascUF            = @nascUF            , 
			emailProvedor     = @emailProvedor     , 
			emailEndereco     = @emailEndereco     , 
			ensMedAnoTermino  = @ensMedAnoTermino  , 
			ensMedInstituicao = @ensMedInstituicao  
		WHERE cpf = @cpf;
	END
GO

--  Inscrições em turmas
--Insert
CREATE PROCEDURE pInsereInscriçõesEmTurma 
                (@ra                  int        , 
		 @nomeDisciplina      varchar(64),
		 @siglaDisciplina	  varchar(5) , 
		 @numCreditosPraticos int        ,
		 @numCreditosTeoricos int        ,	
		 @siglaTurma          varchar(5) , 
		 @ano                 int        , 
	         @semestre            tinyint    ,
                 @vagas               int        ,
                 @inscricaoMin        int        ,
   	         @inscricaoMax        int        , 
		 @situacao            varchar(30), 
		 @motivo              varchar(30))
AS
	BEGIN
		DECLARE @alunoExiste int
		BEGIN
        	SELECT @alunoExiste = ra 
        	FROM Aluno 
        	WHERE ra = @ra
        	IF @alunoExiste IS NOT NULL
        	BEGIN
        		DECLARE @turmaExiste varchar(5)
        		BEGIN
	        		SELECT @turmaExiste = siglaTurma 
	        		FROM Turma 
	        		WHERE @semestre        = semestre   AND 
	        		      @ano             = ano        AND 
						  @siglaTurma      = siglaTurma AND 
						  @siglaDisciplina = siglaDisciplina
			 		IF @turmaExiste IS NOT NULL
				 		INSERT INTO  AlunoInscreveTurma
						VALUES (@ra, @semestre, @ano,
							    @siglaTurma, @siglaDisciplina, 
							    @situacao, @motivo) 
        		END
        	END	
        END
	END
GO

-- delete
CREATE PROCEDURE pRemoveInscriçõesEmTurma 
                (@ra                  int        , 
				 @siglaDisciplina	  varchar(5) , 
 	   		     @siglaTurma          varchar(5) , 
			     @ano                 int        , 
			     @semestre            tinyint    )
AS
	BEGIN
		DELETE FROM AlunoInscreveTurma
		WHERE ra = @ra and semestre = @semestre and ano = @ano
			  and siglaTurma = @siglaTurma and siglaDisciplina = @siglaDisciplina
	END	  
GO

-- Lucas
/*Atualiza o regimento de um conselho de coordenação de curso*/
CREATE PROCEDURE atualizaRegimento (@siglaCurso varchar(5), @dataCriacao date, @regimento TEXT)
AS
BEGIN
    DECLARE @ConselhoCoordenacaoExiste varchar(5);

	SELECT @ConselhoCoordenacaoExiste = siglaCurso FROM ConselhoCoordenacao WHERE siglaCurso = @siglaCurso;
	IF @ConselhoCoordenacaoExiste IS NOT NULL
	BEGIN
		UPDATE ConselhoCoordenacao
		SET regimento = @regimento WHERE siglaCurso = @siglaCurso AND dataCriacao = @dataCriacao;
	END
END
GO

/*Adiciona projeto político pedagógico*/
CREATE PROCEDURE adicionaPPP (@siglaCurso varchar(5), @inicioVigencia date, @projeto varchar(max))
AS
BEGIN
  DECLARE @cursoExiste varchar(5);

  SELECT @cursoExiste = sigla
  FROM Curso
  WHERE sigla = @siglaCurso

  IF @cursoExiste IS NOT NULL
  BEGIN
      INSERT INTO ProjetoPoliticoPedagogico VALUES (@siglaCurso, @inicioVigencia, @projeto);
  END
END
GO

/*Deleta projeto político pedagógico*/
CREATE PROCEDURE apagaPPP (@inicioVigencia date)
AS
BEGIN
  DECLARE @PPPExiste DATE;

  SELECT @PPPExiste = inicioVigencia
  FROM ProjetoPoliticoPedagogico
  WHERE inicioVigencia = @inicioVigencia

  IF @PPPExiste IS NOT NULL
  BEGIN
      DELETE FROM ProjetoPoliticoPedagogico WHERE inicioVigencia = @inicioVigencia;
  END
END
GO

/*Atualiza projeto político pedagógico*/
CREATE PROCEDURE atualizaPPP (@siglaCurso varchar(5), @inicioVigencia date, @projeto varchar(max))
AS
BEGIN
  DECLARE @PPPExiste DATE;

  SELECT @PPPExiste = inicioVigencia
  FROM ProjetoPoliticoPedagogico
  WHERE inicioVigencia = @inicioVigencia

  IF @PPPExiste IS NOT NULL
  BEGIN
      UPDATE ProjetoPoliticoPedagogico
      SET projeto = @projeto
      WHERE siglaCurso = @siglaCurso AND inicioVigencia = @inicioVigencia;
  END
END
GO

/*Adiciona Proposta de Intervenca das Reuniões do Conselho de Coordenacao de Curso*/
CREATE PROCEDURE adicionaPropostaIntervencaoCC(@idPICC INT, @idIP int, @dataCriacao date, @dataHora datetime, @cpf CHAR(11), @preNome varchar(30), @sobreNome varchar(30), @siglaCurso varchar(5), @propostaIntervencao varchar(max))
AS
BEGIN
  DECLARE @ItemDePautaExiste INT;
  DECLARE @MembroConsehoCoordenacaoExiste CHAR(11);

  SELECT @ItemDePautaExiste = idIP
  FROM ItemDePauta
  WHERE idIP = @idIP;

  SELECT @MembroConsehoCoordenacaoExiste = cpf
  FROM MembroConsehoCoordenacao
  WHERE cpf = @cpf;

  IF @ItemDePautaExiste IS NOT NULL AND @MembroConsehoCoordenacaoExiste IS NOT NULL
  BEGIN
    INSERT INTO PropostaIntervencaoConselhoDeCoordenacao VALUES (@cpf, @siglaCurso, @idIP, @dataHora, @dataCriacao, @idPICC, @propostaIntervencao);
  END
END
GO

/*Deleta Proposta de Intervenca das Reuniões do Conselho de Coordenacao de Curso*/
CREATE PROCEDURE apagaPropostaIntervencaoCC(@idPICC INT, @idIP int, @dataHora datetime, @cpf CHAR(11), @preNome varchar(30), @sobreNome varchar(30), @siglaCurso varchar(5), @propostaIntervencao varchar(max))
AS
BEGIN
  DECLARE @propostaIntervencaoExiste INT;

  SELECT @propostaIntervencaoExiste = idPICC
  FROM PropostaIntervencaoConselhoDeCoordenacao
  WHERE idPICC = @idPICC;

  IF @propostaIntervencaoExiste IS NOT NULL
  BEGIN
    DELETE FROM PropostaIntervencaoConselhoDeCoordenacao WHERE idPICC = @idPICC;
  END
END
GO

/*Atualiza Proposta de Intervenca das Reuniões do Conselho de Coordenacao de Curso*/
CREATE PROCEDURE atualizaPropostaIntervencaoCC(@idPICC INT, @idIP int, @dataHora datetime, @cpf CHAR(11), @preNome varchar(30), @sobreNome varchar(30), @siglaCurso varchar(5), @propostaIntervencao varchar(max))
AS
BEGIN
  DECLARE @propostaIntervencaoExiste INT;

  SELECT @propostaIntervencaoExiste = idPICC
  FROM PropostaIntervencaoConselhoDeCoordenacao
  WHERE idPICC = @idPICC;

  IF @propostaIntervencaoExiste IS NOT NULL
  BEGIN
    UPDATE PropostaIntervencaoConselhoDeCoordenacao
    SET propostaIntervencao = @propostaIntervencao
    WHERE idPICC = @idPICC;
  END
END
GO

/*Adiciona item de pauta à reuniões do conselho de ConselhoCoordenacao*/
CREATE PROCEDURE adicionarItemdePautaRCC(@idIP INT, @dataCriacao date,  @cpf CHAR(11), @preNome varchar(30), @sobreNome varchar(30), @siglaCurso varchar(5), @dataHora datetime, @descricao nvarchar)
AS
BEGIN
  DECLARE @ItemDePautaExiste INT;
  DECLARE @MembroConsehoCoordenacaoExiste CHAR(11);

  SELECT @ItemDePautaExiste = idIP
  FROM ItemDePauta
  WHERE idIP = @idIP;

  SELECT @MembroConsehoCoordenacaoExiste = cpf
  FROM MembroConsehoCoordenacao
  WHERE cpf = @cpf;

  IF @ItemDePautaExiste IS NOT NULL AND @MembroConsehoCoordenacaoExiste IS NOT NULL
  BEGIN
    INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES(@cpf, @siglaCurso, @dataCriacao, @idIP, @dataHora);
  END
  ELSE
  BEGIN
    INSERT INTO ItemDePauta
    VALUES(@idIP, @dataHora, @descricao);
    
    INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES(@cpf, @siglaCurso, @dataCriacao, @idIP, @dataHora);
  END
END
GO

/*Deleta item de pauta à reuniões do conselho de ConselhoCoordenacao*/
CREATE PROCEDURE apagaItemdePautaRCC(@idIP INT, @dataHora datetime, @descricao nvarchar, @cpf CHAR(11), @preNome varchar(30), @sobrenome varchar(30), @siglaCurso varchar(5), @dataCriacao DATE)
AS
BEGIN
  DECLARE @ItemDePautaExiste INT;

  SELECT @ItemDePautaExiste = idIP
  FROM PropoeItemReuniaoConselhoDeCoordenacao
  WHERE idIP = @idIP;

  IF @ItemDePautaExiste IS NOT NULL
  BEGIN
    DELETE FROM PropoeItemReuniaoConselhoDeCoordenacao WHERE cpf = @cpf AND idIP = @idIP;
    DELETE FROM ItemDePauta WHERE idIP = @idIP;
  END
END
GO

/*Atualiza item de pauta à reuniões do conselho de ConselhoCoordenacao*/
CREATE PROCEDURE atualizaItemdePautaRCC(@idIP INT, @dataHora datetime, @descricao nvarchar, @cpf CHAR(11), @preNome varchar(30), @sobrenome varchar(30), @siglaCurso varchar(5))
AS
BEGIN
  DECLARE @ItemDePautaExiste INT;
  DECLARE @MembroConsehoCoordenacaoExiste CHAR(11);

  SELECT @ItemDePautaExiste = idIP
  FROM ItemDePauta
  WHERE idIP = @idIP;

  SELECT @MembroConsehoCoordenacaoExiste = cpf
  FROM MembroConsehoCoordenacao
  WHERE cpf = @cpf;

  IF @ItemDePautaExiste IS NOT NULL AND @MembroConsehoCoordenacaoExiste IS NOT NULL
  BEGIN
    UPDATE ItemDePauta
    SET descricao = @descricao
    WHERE idIP = @idIP;
  END
END
GO
