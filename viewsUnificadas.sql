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

-- Lucas
CREATE VIEW vRegimentoConselhoCoordenacao as
    SELECT CC.siglaCurso, CC.regimento, CC.dataCriacao
    FROM ConselhoCoordenacao CC, MembroConsehoCoordenacao MCC, Pessoa P
    WHERE P.cpf = MCC.cpf
    AND MCC.siglaCurso = CC.siglaCurso
GO

CREATE VIEW vProjetoPoliticoPedagogico_CoordCurso as
    SELECT PPP.siglaCurso, PPP.inicioVigencia, PPP.projeto
    FROM ProjetoPoliticoPedagogico PPP
GO

CREATE VIEW vPropostaReuniaoConselhoCurso_CoordCurso as
    SELECT PICC.idPICC, IP.idIP, PICC.cpf, P.preNome, P.sobreNome, PICC.siglaCurso, PICC.dataHora, PICC.propostaIntervencao
    FROM ReuniaoConselhoCoordenacaoCurso RCC,  PropostaIntervencaoConselhoDeCoordenacao PICC, ItemDePauta IP, Pessoa P
    WHERE RCC.siglaCurso = PICC.siglaCurso AND PICC.cpf = P.cpf

GO

CREATE VIEW vItemDePautaConselhoCurso_CoordCurso as
    SELECT PIRCC.idIP, PIRCC.cpf, P.preNome, P.sobreNome, PIRCC.siglaCurso, PIRCC.dataHora, IP.descricao
    FROM PropoeItemReuniaoConselhoDeCoordenacao PIRCC, ItemDePauta IP, ReuniaoConselhoCoordenacaoCurso RCC, Pessoa P
    WHERE RCC.siglaCurso = PIRCC.siglaCurso AND PIRCC.idIP = IP.idIP AND P.cpf = PIRCC.cpf;

GO

CREATE VIEW vAlunosEnade as
    SELECT A.ra, A.cpf, ARE.status, P.preNome, P.sobreNome
    FROM aluno A, AlunoRealizaEnade ARE, Pessoa P
    WHERE P.cpf = A.cpf
    AND A.ra = ARE.ra
GO

-- Alexandre
/*
View Aluno editar informações pessoais:
- Mostra todas as informações do aluno,
  tanto como pessoa e aluno
*/
CREATE VIEW vInfoPessoalAluno AS
SELECT	  
		  P.preNome        ,
		  P.sobreNome      ,
		  P.cpf            ,
		  P.rgCod          ,
		  P.rgOrg          ,
		  P.endLog         ,
		  P.endNum         ,
		  P.endCid         ,
		  P.endBai         ,
		  P.endCEP         ,
		  P.senha          ,
		  ra  		   ,
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
		  
FROM Aluno A, Pessoa P
WHERE A.cpf = P.cpf

GO

/*
View Aluno editar Inscrições em turmas:
- Dado o RA de um aluno, essa view mostra
  as turmas em qual o mesmo esta inscrevendo,
  as disciplinas correspondentes a essa turma
  e a situação da inscrição.

*/

CREATE VIEW vInscriçõesEmTurma AS
SELECT
			I.ra                  ,
			D.nome as 'Disciplina',
			I.siglaDisciplina     , 
			D.numCreditosPraticos ,
			D.numCreditosTeoricos ,
    			I.siglaTurma          , 
			I.ano                 , 
			I.semestre            ,
			T.vagas               ,
			T.inscricaoMin        ,
			T.inscricaoMax        , 
			I.situacao            , 
			I.motivo

FROM AlunoInscreveTurma I, Aluno A, Turma T, Disciplina D 
WHERE I.ra = A.ra AND I.siglaDisciplina = D.sigla 
	  AND (T.semestre        	= I.semestre     AND
	  	   T.ano             = I.ano             AND 
	  	   T.siglaTurma      = I.siglaTurma      AND
	  	   T.siglaDisciplina = I.siglaDisciplina) 

GO

/*
View: Aluno visualizar lista com todas as disciplinas
- Essa view mostra todas as disciplinas já ofertadas, 
  com suas respectivas turmas e seus respectivos locais, além
  de informações do plano de ensino de cada disciplina. 

*/

CREATE VIEW vlistaDeDisciplinas AS
	SELECT  	D.sigla               ,
  			D.nome                ,
			Pe.preNome            ,
			Pe.sobreNome          ,
			Dc.gabineteLocal      ,
  			T.semestre            ,
  			T.ano                 ,
  			D.numCreditosPraticos ,
  			D.numCreditosTeoricos ,
  			P.ementa              ,
  			P.estrategia          ,
  			P.objetivosEspecificos,
  			P.objetivosGerais     

	FROM Disciplina D, Turma T, TurmaAtribuicaoLocal L, 
	PlanoDeEnsino P, Docente Dc, Funcionario F, Pessoa Pe
	    
	WHERE D.sigla = T.siglaDisciplina -- Turma(s) da disciplina
		  AND (
		  		T.semestre        = L.semestre   AND 
		  		T.ano             = L.ano        AND 
		  		T.siglaTurma      = L.siglaTurma AND 
		  		T.siglaDisciplina = L.siglaDisciplina) -- Local(is) da(s) Turma(s)
		  AND (
		  		T.semestre        = P.semestre   AND 
		  		T.ano             = P.ano        AND 
		  		T.siglaTurma      = P.siglaTurma AND 
		  		T.siglaDisciplina = P.siglaDisciplina) -- Plano de ensino da Turma
		  AND ( 
				P.siape           = Dc.siape     AND
		        	Dc.siape          = F.siape      AND
				F.cpf             = Pe.cpf           ) -- Professor que ofertou a Turma  

GO

/*
View: Aluno visualizar seu historico
- Essa view, a partir do RA de um aluno, mostra
  todas as disciplinas que o mesmo ja cursou, 
  englobando informações de frequencia e media final
  na disciplina, o ano em que a mesma foi cursada e ira
  atual do aluno. 

*/

CREATE VIEW vHistorico AS
	SELECT		A.ra                  , 
 			D.nome                ,
  			D.numCreditosTeoricos ,
  			D.numCreditosPraticos ,
  			T.ano                 ,
  			T.semestre            ,
  			T.frequencia          ,
  			T.mediaFinal          ,
  			T.aprovado            ,
  			T.ira                 
 
	FROM Disciplina D, AlunoCursaTurma T, Aluno A
	WHERE D.sigla = T.siglaDisciplina AND A.ra = T.ra 

GO

/*
View: Aluno visualizar um plano de Ensino
- Essa view exibe o plano de ensino de cada
  disciplina. A diferença para table PlanoDeEnsino
  eh que na view também se exibe o nome da disciplina.
*/

CREATE VIEW vPlanoDeEnsino AS
	SELECT 	    nome                 , 
		    ementa               ,
		    estrategia           ,
		    objetivosEspecificos ,
		    objetivosGerais      

	FROM PlanoDeEnsino, Disciplina
	WHERE sigla = siglaDisciplina

GO

/*
View: Aluno visualizar seus deferimentos
- Essa view contém os deferimentos de todos 
  os alunos.
*/
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
	       WHERE TABLE_NAME = 'vDeferimento')
    DROP VIEW vDeferimento
GO

CREATE VIEW vDeferimento AS
	SELECT      A.ra              ,
		    D.nome            ,
		    D.sigla           ,
		    I.siglaTurma      ,
		    I.semestre        ,
		    I.ano             ,
		    I.situacao        ,
		    I.motivo          ,
		    T.inscricaoMin    ,
		    T.inscricaoMax    

	FROM AlunoInscreveTurma I, Aluno A, Turma T, Disciplina D
	WHERE D.sigla = I.siglaDisciplina 
	      AND I.ra = A.ra
	      AND ( T.semestre        = I.semestre   AND
	      	    T.ano             = I.ano        AND
	      	    T.siglaTurma      = I.siglaTurma AND
	      	    T.siglaDisciplina = I.siglaDisciplina)

GO
