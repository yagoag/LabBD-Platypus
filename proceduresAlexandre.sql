/*
Criar procedures para executar as ações de insert, update e delete para:

+ Informações pessoais do Aluno
+ Inscrições em turmas


CREATE PROCEDURE adicionaInfoPessoalAluno -> nao eh posssivel
	Acredito que um aluno não possa ser capaz de adicionar um novo aluno no banco

CREATE PROCEDURE removerInfoPessoalAluno -> nao eh posssivel
	Acredito que um aluno não possa ser capaz de remover suas Informacoes pessoais do banco

 */

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
		SET cpf               = @cpf               , 
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

EXEC pAtualizaInfoPessoalAluno

		-- Informacoes como Pessoa
		@cpf               = '11100000002'       , 
		@senha             = 1                   ,  
		@sobreNome         = 'Silva'             ,
		@preNome           = 'Maria__XXX'        , -- Campo atualizado
		@rgCod             = '20000000'          ,
		@rgOrg             = 'SSP/RJ'            ,
		@endLog            = 'Rua dos Alunos'    ,
		@endNum            = 30                  ,
		@endCid            = 'São Carlos'        ,
		@endBai            = 'Bairro dos Alunos' ,
		@endCEP            = '13560001'          ,
		-- Informacoes como Aluno 
 		@ra                = 2                   , 
		@sexoDoc           = ''                  ,
		@sexoDesc          = ''                  , 
		@sexoNome          = 'Masculino_ZZZZ'    , -- Campo atualizado
		@maePrenome        = 'Maria'             , 
		@maeSobrenome      = 'Silva'             ,
		@paiPrenome        = 'João'              , 
		@paiSobrenome      = 'Silva'             , 
		@nascData          = '19920203'          , 
		@nascLocal         = 'São Paulo'         ,
		@nascUF            = 'SP'                , 
		@emailProvedor     = 'gmail.com'         , 
        @emailEndereco     = 'msilva'            , 
        @ensMedAnoTermino  = 2009                , 
        @ensMedInstituicao = 'Colégio 2'

-- Teste
select * from Aluno
WHERE cpf = '11100000002'          




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

-- Teste do insert
EXEC pInsereInscriçõesEmTurma
	@ra                  = 6                            ,  
	@nomeDisciplina      = 'Programação de Computadores',
	@siglaDisciplina	 = 'PC'                         ,
	@numCreditosPraticos = 2                            ,
	@numCreditosTeoricos = 2                            ,
	@siglaTurma          = 'A'                          ,
	@ano                 = 2013                         ,	
	@semestre            = 2                            ,
	@vagas               = 40                           ,
	@inscricaoMin        = 5                            ,
	@inscricaoMax        = 40                           ,
	@situacao            = 'Aceito'                     ,
	@motivo              = 'Vagas Suficientes'  



/*
-- update
-- O aluno não deve ser capaz de realizar update

CREATE PROCEDURE pAtualizaInscriçõesEmTurma 
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
	UPDATE AlunoInscreveTurma
		SET ra              = @ra        , 
			semestre        = @semestre  , 
			ano             = @ano       , 
			siglaTurma      = @siglaTurma, 
			siglaDisciplina = @siglaTurma,
			situacao        = @situacao  ,
			motivo          = @motivo 
		WHERE ra = @ra and semestre = @semestre and ano = @ano
		      and siglaTurma = @siglaTurma and siglaDisciplina = @siglaDisciplina
	END
GO


-- Teste do Update
EXEC pAtualizaInscriçõesEmTurma
	@ra                  = 6                            ,  
	@nomeDisciplina      = 'Programação de Computadores',
	@siglaDisciplina	 = 'PC'                         ,
	@numCreditosPraticos = 4                            ,
	@numCreditosTeoricos = 2                            ,
	@siglaTurma          = 'A'                          ,
	@ano                 = 2013                         ,	
	@semestre            = 2                            ,
	@vagas               = 40                           ,
	@inscricaoMin        = 12                            ,
	@inscricaoMax        = 40                           ,
	@situacao            = 'Aceito'                     ,
	@motivo              = 'Vagas Suficientes'  

*/

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

-- Teste do Delete
EXEC pRemoveInscriçõesEmTurma
	@ra                  = 6                            ,  
	@nomeDisciplina      = 'Programação de Computadores',
	@siglaDisciplina	 = 'PC'                         ,
	@numCreditosPraticos = 4                            ,
	@numCreditosTeoricos = 2                            ,
	@siglaTurma          = 'A'                          ,
	@ano                 = 2013                         ,	
	@semestre            = 2                            ,
	@vagas               = 40                           ,
	@inscricaoMin        = 12                            ,
	@inscricaoMax        = 40                           ,
	@situacao            = 'Aceito'                     ,
	@motivo              = 'Vagas Suficientes'  
GO

select * from AlunoInscreveTurma
GO