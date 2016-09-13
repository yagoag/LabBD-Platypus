-- Yago
CREATE VIEW turmas_ChefeDepto AS
	SELECT D.sigla, nome, numCreditosPraticos, numCreditosTeoricos, semestre, ano, siglaTurma, valida, vagas, inscricaoMin, inscricaoMax
	FROM Turma T, Disciplina D
	WHERE T.siglaDisciplina = D.sigla;
GO

CREATE VIEW licencas_ChefeDepto AS
	SELECT dataInicio, dataTermino, L.siape, documento, indicacao, motivo
	FROM Licenca L, Funcionario F, Pessoa P
	WHERE L.siape = F.siape AND F.cpf = P.cpf;
GO

-- Marcos
CREATE VIEW vInfoPessoalDocente AS
SELECT	  
	P.preNome,
	P.sobreNome,
	P.cpf,
	P.rgCod,
	P.rgOrg,
	P.endLog,
	P.endNum,
	P.endCid,
	P.endBai,
	P.endCEP,
	P.senha,
	D.siape,
	D.gabineteLocal,
	D.gabineteTelDDD,
	D.gabineteTelSufixo,
	D.gabineteTelPrefixo
FROM Docente D, Funcionario F, Pessoa P
WHERE F.cpf = P.cpf
AND F.siape = D.siape
GO


CREATE VIEW PlanoEnsinoDocente AS
	SELECT p.*, pe.preNome, pe.sobreNome
	FROM PlanoDeEnsino p, Docente d, Pessoa pe, Funcionario f
	WHERE p.siape = d.siape
	AND f.siape = d.siape
	AND pe.cpf = f.cpf
GO

CREATE VIEW PrioridadeDocente AS
	SELECT p.*, pe.preNome, pe.sobreNome
	FROM TemPrioridadeDocente p, Docente d, Pessoa pe, Funcionario f
	WHERE p.siape = d.siape
	AND f.siape = d.siape
	AND pe.cpf = f.cpf
GO

CREATE VIEW PropostasDocente AS
	SELECT p.*
	FROM PropoeItemReuniaoNucleoDocenteEstruturante p, Docente d
	WHERE d.siape = p.siapeDocente
GO

CREATE VIEW RegimentoDocente AS
	SELECT nde.regimento, d.siape
	FROM NucleoDocenteEstruturante nde, Docente d, MembroNucleoDocenteEstruturante mnde
	WHERE d.siape = mnde.siapeDocente
	AND mnde.siglaCurso = nde.siglaCurso
GO

CREATE VIEW TurmaSemestre AS
	SELECT t.siglaTurma, t.siglaDisciplina, pdea.horas, t.semestre, l.predio, l.nroSala, l.diaSemana
	FROM TurmaAtribuicaoLocal l, Turma t, PlanoDeEnsino_Atividades pdea
	WHERE t.siglaTurma = l.siglaTurma
	AND t.semestre = l.semestre
	AND t.siglaTurma = pdea.siglaTurma
GO

-- Wilton
CREATE VIEW 
	TecnicoEquipesApoioView AS SELECT T.siape,E.descricao, E.siglaDisciplina, E.siglaTurma, E.semestre, E.ano FROM Tecnico T, EquipeDeApoio E, PlanoDeEnsino P 
			WHERE (T.siape=E.siape AND E.siglaDisciplina=P.siglaDisciplina AND E.siglaTurma=P.siglaTurma AND E.ano=P.ano
                   AND E.semestre=P.semestre);


CREATE VIEW
	PlanoDeEnsinoView AS SELECT P.siglaDisciplina, P.siglaTurma, P.ano, P.semestre, P.ementa, P.estrategia, P.objetivosEspecificos,
	 	 	P.objetivosGerais FROM PlanoDeEnsino P, Turma T, Disciplina D WHERE (T.siglaTurma=P.siglaTurma AND T.ano=P.ano AND
    T.semestre=P.semestre AND T.siglaDisciplina=D.sigla);

CREATE VIEW
	TecnicoView AS SELECT T.siape, P.cpf, P.sobreNome, P.preNome, P.rgCod, P.rgOrg, P.endLog, P.endNum, P.endCid, P.endBai, P.endCEP,
	T.nroGabinete, T.local FROM Tecnico T, Pessoa P, Funcionario F WHERE (T.siape=F.siape AND F.cpf=P.cpf);


-- Aquino
CREATE VIEW vComunicadoDocente AS
 	SELECT 
		C.siapeDocente,
		P.preNome, 
		P.sobreNome ,
		C.siglaCurso, 
		C.idIP,
		C.dataHora, 
		C.idCNDE,
		C.comunicado
	FROM ComunicadoNucleoDocenteEstruturante C, Pessoa P, Funcionario F, Docente D
	WHERE C.siapeDocente = F.siape AND F.cpf = P.cpf AND D.siape = f.siape
GO

CREATE VIEW vIntervencaoDocente AS
 	SELECT 
		C.siape,
		P.preNome, 
		P.sobreNome ,
		C.siglaCurso, 
		C.idIP,
		C.dataHora, 
		C.idPINDE,
		C.propostaIntervencao
	FROM 
		PropostaIntervencaoNucleoDocenteEstruturante C, 
		Pessoa P, 
		Funcionario F, 
		Docente D
	WHERE 
		C.siape = F.siape AND 
		F.cpf = P.cpf AND 
		D.siape = f.siape
GO

CREATE VIEW vlicencasFuncionarios AS
 	SELECT 
		P.preNome, P.sobreNome, L.dataInicio, 
		L.dataTermino, indicacao, motivo	
	FROM Licenca L, Funcionario F, Pessoa P 
	WHERE L.siape = F.siape and P.cpf = F.cpf

GO
