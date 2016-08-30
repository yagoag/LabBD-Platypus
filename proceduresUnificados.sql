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





