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

-- Teste

UPDATE vInfoPessoalAluno
SET cpf               = '11100000002'       , 
    senha             = 1313                , -- Campo atualizado 
    sobreNome         = 'Silva'             ,
    preNome           = 'Maria'             , -- Campo atualizado 
    rgCod             = '20000000'          ,
    rgOrg             = 'SSP/RJ'            ,
    endLog            = 'Rua dos Alunos'    ,
    endNum            = 30                  ,
    endCid            = 'São Carlos'        , 
    endBai            = 'Aracy'             , -- Campo atualizado
    endCEP            = '13560001'          ,
    ra                = 2                   , 
    sexoDoc           = ''                  ,
    sexoDesc          = ''                  , 
    sexoNome          = 'Masculino'         , -- Campo atualizado 
    maePrenome        = 'Maria'             , 
    maeSobrenome      = 'Silva'             ,
    paiPrenome        = 'João'              , 
    paiSobrenome      = 'Silva'             , 
    nascData          = '19920203'          , 
    nascLocal         = 'São Paulo'         ,
    nascUF            = 'SP'                , 
    emailProvedor     = 'YAHOO.com'         , -- Campo atualizado
    emailEndereco     = 'msilva'            , 
    ensMedAnoTermino  = 2009                , 
    ensMedInstituicao = 'Colégio 2'
WHERE cpf = '11100000002'



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

-- Teste

INSERT INTO vInscriçõesEmTurma values (6, 'Programação de Computadores',
                                      'PC', 4, 2, 'A', 2013, 2, 40, 12, 40,
                                      'Aceito', 'Vagas Suficientes')

DELETE vInscriçõesEmTurma WHERE ra = 6 and siglaDisciplina = 'PC' and siglaTurma = 'A'
                                and ano = 2013 and semestre = 2

