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
