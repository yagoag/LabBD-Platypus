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
		  ra  			   ,
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
	  AND (T.semestre        = I.semestre        AND
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
	SELECT  D.sigla               ,
  			D.nome                ,
  			D.numCreditosPraticos ,
  			D.numCreditosTeoricos ,
  			T.siglaTurma          ,
  			T.semestre            ,
  			L.predio              ,
  			L.nroSala             ,
  			P.ementa              ,
  			P.estrategia          ,
  			P.objetivosEspecificos,
  			P.objetivosGerais     

	FROM Disciplina D, Turma T, TurmaAtribuicaoLocal L, PlanoDeEnsino P
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
	SELECT  A.ra                  , 
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
	SELECT 	semestre             ,
		    ano                  ,
		    nome                 , 
		    siglaTurma           ,
		    siape                ,
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
	SELECT  A.ra              ,
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

/*
select * from vInfoPessoal_Aluno
select * from vInscriçõesEmTurma
select * from vlistaDeDisciplinas
select * from vHistorico
select * from vPlanoDeEnsino
select * from vDeferimento

drop view vInfoPessoal_Aluno
drop view vInscriçõesEmTurma
drop view vlistaDeDisciplinas
drop view vHistorico
drop view vPlanoDeEnsino
drop view vDeferimento
*/
