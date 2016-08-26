/*
View Aluno editar informações pessoais:

*/
CREATE VIEW InfoPessoal_Aluno AS
SELECT	  
		  P.preNome        ,
		  P.sobreNome      ,
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

*/

CREATE VIEW InscriçõesEmTurma AS
SELECT
			I.ra           ,
			semestre       , 
			ano            , 
    		siglaTurma     , 
    		siglaDisciplina, 
			situacao       , 
			motivo

FROM AlunoInscreveTurma I, Aluno A 
WHERE I.ra = A.ra

GO

/*
View: Aluno visualizar lista com todas as disciplinas
 (selecionar semestre, mostrar as turmas e locais, link p/ plano de ensino) 

*/

CREATE VIEW listaDeDisciplinas AS
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

*/

CREATE VIEW Historico AS
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

*/

CREATE VIEW Deferimento AS
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
select * from InfoPessoal_Aluno
select * from InscriçõesEmTurma
select * from listaDeDisciplinas
select * from Historico
select * from vPlanoDeEnsino
select * from Deferimento

drop view InfoPessoal_Aluno
drop view InscriçõesEmTurma
drop view listaDeDisciplinas
drop view Historico
drop view vPlanoDeEnsino
drop view Deferimento
*/
