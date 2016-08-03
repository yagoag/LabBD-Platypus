CREATE TABLE Pessoa (
    cpf       CHAR(11),
    senha     VARCHAR(30),
    sobreNome VARCHAR(30),
    preNome   VARCHAR(30),
    rgCod     VARCHAR(10),
    rgOrg     VARCHAR(7),
    endLog    VARCHAR(40),
    endNum    INT,
    endCid    VARCHAR(30),
    endBai    VARCHAR(30),
    endCEP    CHAR(8),
    
    PRIMARY KEY (cpf)
);

CREATE TABLE Funcionario (
  siape char(9),
  cpf   char(11),
  
  PRIMARY KEY (siape),
  FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);

CREATE TABLE Docente (
  siape              char(9),
  gabineteLocal      varchar(30),
  gabineteTelDDD     char(2),
  gabineteTelSufixo  char(4),
  gabineteTelPrefixo varchar(5),
  
  PRIMARY KEY (siape),
  FOREIGN KEY (siape) REFERENCES Funcionario (siape)
);

-- Tecnico depende de Gabinete
CREATE TABLE Gabinete (
  nroGabinete int, 
  local       varchar(30),
  
  PRIMARY KEY (nroGabinete, local)
);

CREATE TABLE Tecnico (
  siape       char(9), 
  nroGabinete int,
  local       varchar(30),
  
  PRIMARY KEY (siape),
  FOREIGN KEY (siape) REFERENCES Funcionario (siape),
  FOREIGN KEY (nroGabinete, local) REFERENCES Gabinete (nroGabinete, local)
);

CREATE TABLE TelefoneGabineteTecnico (
  ddd         char(2),
  numero      varchar(9),
  nroGabinete int,
  local       varchar(30),
  
  PRIMARY KEY (ddd, numero, nroGabinete, local),
  FOREIGN KEY (nroGabinete, local) REFERENCES Gabinete (nroGabinete, local)
);

CREATE TABLE CargoAdministrativo (
    nomeCargo     varchar(30) NOT NULL,
    local         VARCHAR(30) NOT NULL,
    carga_horaria INTEGER     NOT NULL,
    
    PRIMARY KEY (nomeCargo)
)

CREATE TABLE Aluno (
  ra                int,
  cpf               char(11),
  sexoDoc           varchar(max),
  sexoDesc          varchar(max),
  sexoNome          varchar(20),
  maePrenome        varchar(30),
  maeSobrenome      varchar(30),
  paiPrenome        varchar(30),
  paiSobrenome      varchar(30),
  nascData          date,
  nascLocal         varchar(30),
  nascUF            char(2),
  emailProvedor     varchar(30),
  emailEndereco     varchar(20),
  ensMedAnoTermino  int,
  ensMedInstituicao varchar(30),
  
  PRIMARY KEY (ra),
  FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);

CREATE TABLE Disciplina (
  sigla               varchar(5),
  nome                varchar(64),
  numCreditosPraticos int,
  numCreditosTeoricos int,
  
  PRIMARY KEY (sigla)
);

CREATE TABLE PreRequisito (
  siglaDisciplina   varchar(5),
  siglaPreRequisito varchar(5),

  PRIMARY KEY (siglaDisciplina, siglaPreRequisito),
  FOREIGN KEY (siglaDisciplina)   REFERENCES Disciplina (sigla),
  FOREIGN KEY (siglaPreRequisito) REFERENCES Disciplina (sigla)
);

CREATE TABLE CoRequisito (
  siglaDisciplina  varchar(5),
  siglaCoRequisito varchar(5),

  PRIMARY KEY (siglaDisciplina, siglaCoRequisito),
  FOREIGN KEY (siglaDisciplina) REFERENCES Disciplina (sigla),
  FOREIGN KEY (siglaCoRequisito) REFERENCES Disciplina (sigla)
);
 


CREATE TABLE Turma (
  semestre        tinyint,
  ano             int,
  siglaTurma      varchar(5),
  siglaDisciplina varchar(5),
  valida          bit,
  vagas           int,
  inscricaoMin    int,
  inscricaoMax    int,

  PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina),
  FOREIGN KEY (siglaDisciplina) REFERENCES Disciplina (sigla)
);

CREATE TABLE AlunoCursaTurma (
  ra              int,
  semestre        tinyint,
  ano             int,
  siglaTurma      varchar(5),
  siglaDisciplina varchar(5),
  mediaFinal      real,
  ira             int,

  PRIMARY KEY (ra, semestre, ano, siglaTurma, siglaDisciplina),
  FOREIGN KEY (ra) REFERENCES Aluno(ra),
  FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina)
);
-- identity eh o alto incremental, como um contador estatico
-- no Oracle eh uma sequence
CREATE TABLE Nota (
  id              int identity,
  ra              int,
  semestre        tinyint,
  ano             int,
  siglaTurma      varchar(5),
  siglaDisciplina varchar(5),
  descricao       varchar(30),
  nota            real,

  PRIMARY KEY (id),
  FOREIGN KEY (ra) REFERENCES Aluno (ra),
  FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina)
);

CREATE TABLE Carga (
  siglaDisciplina varchar(5),
  siape           char(9),
  tempoAno        int,
  tempoSemestre   tinyint,
  cargo           varchar(30),

  PRIMARY KEY (siglaDisciplina, siape, tempoAno, tempoSemestre),
  FOREIGN KEY (siglaDisciplina) REFERENCES Disciplina (sigla),
  FOREIGN KEY (siape)           REFERENCES Docente (siape)
)

CREATE TABLE Curso (
  nome  varchar(30),
  sigla varchar(5),

  PRIMARY KEY (sigla)
)

CREATE TABLE ProjetoPoliticoPedagogico (
  siglaCurso      VARCHAR(5),
  inicioVigencia  DATE,
  projeto        VARCHAR(max),

  PRIMARY KEY (inicioVigencia),
  FOREIGN KEY (siglaCurso) REFERENCES Curso (sigla)
)

CREATE TABLE AprovacaoProjetoPoliticoPedagogico (
  siglaCurso      VARCHAR(5),
  inicioVigencia  DATE,
  siape           CHAR(9),
  status          BIT,

  FOREIGN KEY (siglaCurso)     REFERENCES Curso(sigla),
  FOREIGN KEY (inicioVigencia) REFERENCES ProjetoPoliticoPedagogico (inicioVigencia),
  FOREIGN KEY (siape)          REFERENCES Docente (siape)
);

CREATE TABLE CursoIndicadoParaDisciplina (
    siglaCurso      varchar(5)  NOT NULL,
    siglaDisciplina varchar(5)  NOT NULL,
    tipoOferta      varchar(30),
    perfil          tinyint,
        
    CONSTRAINT FK_Curso      FOREIGN KEY (siglaCurso)      REFERENCES Curso(sigla),
    CONSTRAINT FK_Disciplina FOREIGN KEY (siglaDisciplina) REFERENCES Disciplina(sigla),
    CONSTRAINT PK            PRIMARY KEY (siglaCurso, siglaDisciplina)    
)

CREATE TABLE Enade (         
    ano             int,
    desempenhoCurso tinyint,
    siglaCurso      varchar(5),

    FOREIGN KEY (siglaCurso)    REFERENCES Curso(sigla),
    PRIMARY KEY (ano, siglaCurso)    
)

CREATE TABLE EnadeAvaliaCurso (         
    anoEnade       int,
    siglaCurso     varchar(5),
 
    FOREIGN KEY (anoEnade, siglaCurso) REFERENCES Enade(ano, siglaCurso),
    PRIMARY KEY (anoEnade, siglaCurso)    
)

CREATE TABLE Reconhecimento (
  idReconhecimento  INT,

  PRIMARY KEY (idReconhecimento)
)

CREATE TABLE ComiteReconhecimento (
  nome        VARCHAR(30),
  sobrenome     VARCHAR(30),
  idReconhecimento  INT,

  PRIMARY KEY (nome, sobrenome),
  FOREIGN KEY (idReconhecimento) REFERENCES Reconhecimento (idReconhecimento)
)

CREATE TABLE CursoSolicitaReconhecimento (
  fase              INT,
  idReconhecimento  INT,
  data              DATE,
  PRIMARY KEY (fase),
  FOREIGN KEY (idReconhecimento) REFERENCES Reconhecimento (idReconhecimento) 
);

CREATE TABLE AlunoRealizaEnade(
    ra                 int         NOT NULL,
    anoEnade           int         NOT NULL,
    siglaCursoEnade    varchar(5)  NOT NULL,
    dataRealizacao     date        NOT NULL,
    status             varchar(20),
    resultado          float,
       
    FOREIGN KEY (ra)                        REFERENCES Aluno(ra),
    FOREIGN KEY (anoEnade, siglaCursoEnade) REFERENCES Enade(ano, siglaCurso),
    PRIMARY KEY (ra, anoEnade, siglaCursoEnade)    
);

-- Guilhermo programou licenca, nao fez os inserts - fiz os inserts - corrigi referencia chave estrangeira 
CREATE TABLE Licenca (
    siape       CHAR(9),
    dataInicio  DATE,
    dataTermino DATE,
    documento   VARCHAR(500),
    indicacao   VARCHAR(200),
    motivo      VARCHAR(200),

    PRIMARY KEY (siape, dataInicio, dataTermino),
    FOREIGN KEY (siape) REFERENCES Funcionario(siape)
);

CREATE TABLE NucleoDocenteEstruturante (
    siglaCurso   VARCHAR(5) NOT NULL,
    dataCriacao  DATE       NOT NULL,
    regimento    TEXT       NOT NULL,

    PRIMARY KEY (siglaCurso),
    FOREIGN KEY (siglaCurso) REFERENCES Curso(sigla)
);

CREATE TABLE Reuniao(
    dataHora datetime,

    PRIMARY KEY (dataHora)
);

CREATE TABLE ItemDePauta(
    idIP      INT,
    dataHora  datetime,
    descricao nvarchar(200),
    
    PRIMARY KEY (idIP, dataHora),
    FOREIGN KEY (dataHora) REFERENCES Reuniao (dataHora)
);

CREATE TABLE ItemAvaliado (
  id          INT,
  fase        INT,
  idReconhecimento  INT,
  item        VARCHAR(max),
  resultado     BIT,

  PRIMARY KEY (id),
  FOREIGN KEY (idReconhecimento) REFERENCES Reconhecimento (idReconhecimento),
  FOREIGN KEY (fase) REFERENCES CursoSolicitaReconhecimento (fase)
)

CREATE TABLE Documento (
    idIP        INT,
    dataHora    datetime,
    idDocumento INT,
    link        VARCHAR(500),

    PRIMARY KEY (idIP, dataHora, idDocumento),
    FOREIGN KEY (idIP, dataHora) REFERENCES ItemDePauta (idIP, dataHora)
)

CREATE TABLE DecisaoAprovada(
    idIP     INT,
    dataHora datetime,
    decisao  VARCHAR(500),

    PRIMARY KEY (idIP, dataHora),
    FOREIGN KEY (idIP, dataHora) REFERENCES ItemDePauta (idIP, dataHora)
);

CREATE TABLE PlanoDeEnsino (
    semestre             tinyint,
    ano                  INT,
    siglaTurma           VARCHAR(5),
    siglaDisciplina      VARCHAR(5),
    siape                CHAR(9),
    ementa               varchar(max),
    estrategia           varchar(max),
    objetivosEspecificos varchar(max),
    objetivosGerais      varchar(max),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina),
    FOREIGN KEY (siape) REFERENCES Docente (siape)
);
 
CREATE TABLE PlanoDeEnsino_Recurso(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    recurso         VARCHAR(500),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, recurso),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_Atividades(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    horas           INT,
	id				INT,
    atividade       VARCHAR(max),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, horas, id),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_EAD(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    horas           INT,
    atividade       VARCHAR(200),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, horas, atividade),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_DistribHoras(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    horas           INT,
    atividade       VARCHAR(200),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, horas, atividade),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_BibliografiaBasica(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    titulo          VARCHAR(100),
    editor          VARCHAR(50),
    bibAno          INT,
    autor           VARCHAR(50),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, titulo, editor, bibAno, autor),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_BibliografiaComplementar(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    titulo          VARCHAR(100),
    editor          VARCHAR(50),
    bibAno          INT,
    autor           VARCHAR(50),

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, titulo, editor, bibAno, autor),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);
 
CREATE TABLE PlanoDeEnsino_Topico(      
    semestre        tinyint,
    ano             INT,
    siglaTurma      VARCHAR(5),
    siglaDisciplina VARCHAR(5),
    horas           INT,
	id				INT,
    topico          VARCHAR(max)

    PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, horas, id),
    FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES PlanoDeEnsino (semestre, ano, siglaTurma, siglaDisciplina)
);

CREATE TABLE Local (
  predio          varchar(30),
  nroSala         varchar(10),
  nroCarteiras    int,
  
  PRIMARY KEY (predio, nroSala)
);

CREATE TABLE TurmaAtribuicaoLocal (
  semestre        tinyint,
  ano             int,
  siglaTurma      varchar(5),
  siglaDisciplina varchar(5),
  predio          varchar(30),
  nroSala         varchar(10),
  diaSemana       varchar(30),
  horarioInicio   time,
  horarioFim      time,

  PRIMARY KEY (semestre, ano, siglaTurma, siglaDisciplina, predio, nroSala),
  FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina),
  FOREIGN KEY (predio, nroSala) REFERENCES Local (predio, nroSala)
);

CREATE TABLE Matricula(
  siglaCurso VARCHAR(5),
  ra INTEGER,
  dataIngresso DATE,
  dataSaida DATE,
  PRIMARY KEY (siglaCurso, ra),
  FOREIGN KEY (siglaCurso) REFERENCES Curso (sigla)
);

CREATE TABLE MembroNucleoDocenteEstruturante(
    siapeDocente CHAR(9),
    siglaCurso VARCHAR(5),
    dataPosse DATE,
    portaria VARCHAR(max),
    PRIMARY KEY (siapeDocente, siglaCurso),
    FOREIGN KEY (siapeDocente) REFERENCES Docente (siape),
    FOREIGN KEY (siglaCurso) REFERENCES Curso (sigla)
);

CREATE TABLE ReuniaoNucleoDocenteEstruturante(
    dataHora datetime,
    siglaCurso varchar(5)
    PRIMARY KEY (dataHora),
    FOREIGN KEY (dataHora) REFERENCES Reuniao (dataHora),
    FOREIGN KEY (siglaCurso) REFERENCES NucleoDocenteEstruturante (siglaCurso)
)

CREATE TABLE ParticipaReuniaoNucleo(
	siapeDocente char(9),
    siglaCurso VARCHAR(5),
	dataHoraReuniao datetime,
	PRIMARY KEY (siapeDocente, siglaCurso, dataHoraReuniao),
  FOREIGN KEY (siapeDocente, siglaCurso) REFERENCES MembroNucleoDocenteEstruturante (siapeDocente, siglaCurso),
  FOREIGN KEY (dataHoraReuniao) REFERENCES ReuniaoNucleoDocenteEstruturante (dataHora)
);

CREATE TABLE PropoeItemReuniaoNucleoDocenteEstruturante(
		siapeDocente CHAR(9),
		siglaCurso VARCHAR(5),
		idIP int,
		dataHora datetime,
    PRIMARY KEY (siapeDocente, siglaCurso, idIP, dataHora),
    FOREIGN KEY (siapeDocente, siglaCurso) REFERENCES MembroNucleoDocenteEstruturante (siapeDocente, siglaCurso),
    FOREIGN KEY (idIP, dataHora) REFERENCES ItemdePauta (idIP, dataHora)
);

CREATE TABLE ComunicadoNucleoDocenteEstruturante(
  siapeDocente CHAR(9),
  siglaCurso VARCHAR(5),
  idIP int,
  dataHora datetime,
	idCNDE int,
	comunicado varchar(max),
  PRIMARY KEY (siapeDocente, siglaCurso, idIP, dataHora, IdCNDE),
  FOREIGN KEY (siapeDocente, siglaCurso, idIP, dataHora) REFERENCES PropoeItemReuniaoNucleoDocenteEstruturante (siapeDocente, siglaCurso, idIP, dataHora)
);

CREATE TABLE PropostaIntervencaoNucleoDocenteEstruturante(
		siape char(9),
		siglaCurso varchar(5),
		idIP int,
    dataHora datetime,
		idPINDE int,
    propostaIntervencao varchar(max),
    PRIMARY KEY (siape, siglaCurso, idIP, dataHora, idPINDE),
    FOREIGN KEY (siape, siglaCurso, idIP, dataHora) REFERENCES PropoeItemReuniaoNucleoDocenteEstruturante (siapeDocente, siglaCurso, idIP, dataHora)
);

CREATE TABLE ConselhoCoordenacao(
		siglaCurso varchar(5),
    dataCriacao date,
    PRIMARY KEY (siglaCurso, dataCriacao),
    FOREIGN KEY (siglaCurso) REFERENCES Curso (sigla)
);

CREATE TABLE MembroConsehoCoordenacao(
  cpf char(11),
  siglaCurso varchar(5),
  dataCriacao date,
  dataPosse date,
  portaria varchar(max),
  PRIMARY KEY (cpf, siglaCurso, dataCriacao),
  FOREIGN KEY (cpf) REFERENCES Pessoa (cpf),
  FOREIGN KEY (siglaCurso, dataCriacao) REFERENCES ConselhoCoordenacao (siglaCurso, dataCriacao)

);

CREATE TABLE ReuniaoConselhoCoordenacaoCurso(
	  dataHora datetime,
		siglaCurso varchar(5),
	  dataCriacao date,
    PRIMARY KEY (dataHora, siglaCurso, dataCriacao),
    FOREIGN KEY (siglaCurso, dataCriacao) REFERENCES ConselhoCoordenacao (siglaCurso, dataCriacao)
);

CREATE TABLE EquipeDeApoio
(
	siglaDisciplina varchar(5) NOT NULL,
	siglaTurma varchar(5) NOT NULL,
    ano int NOT NULL,
    semestre int NOT NULL,
	cpf char(11) NOT NULL,
	siape char(9) NOT NULL,
	descricao varchar(200) NOT NULL,
	
	FOREIGN KEY (cpf) REFERENCES Pessoa (cpf), 
	FOREIGN KEY (siape) REFERENCES Tecnico (siape), 
	
	CONSTRAINT PK_EQUIPEDEAPOIO PRIMARY KEY (siglaDisciplina, siglaTurma, ano, semestre)
)

CREATE TABLE ListaDocenteTurma 
(
	siape char(9) NOT NULL,
	semestre tinyint NOT NULL, 
	ano int NOT NULL, 
    siglaTurma varchar(5) NOT NULL, 
    siglaDisciplina varchar(5) NOT NULL, 
	
	FOREIGN KEY (siape) REFERENCES Docente (siape),
	FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina),
	
	CONSTRAINT PK_LISTADOCENTETURMA PRIMARY KEY (siape, semestre, ano, siglaTurma, siglaDisciplina)
)

CREATE TABLE TemPrioridadeDocente 
(
	siglaDisciplina varchar(5) NOT NULL,
	siape char(9) NOT NULL,
	grau tinyint NOT NULL,
		
	FOREIGN KEY (siglaDisciplina) REFERENCES Disciplina (sigla),
	FOREIGN KEY (siape) REFERENCES Docente (siape),
	
	CONSTRAINT PK_TemPrioridadeDocente PRIMARY KEY (siglaDisciplina, siape)
)

CREATE TABLE AlunoInscreveTurma 
(
	ra int NOT NULL,
	semestre tinyint NOT NULL, 
	ano int NOT NULL, 
    siglaTurma varchar(5) NOT NULL, 
    siglaDisciplina varchar(5) NOT NULL, 
	situacao varchar(30), 
	motivo varchar(30),
		
	FOREIGN KEY (ra) REFERENCES Aluno (ra),
	FOREIGN KEY (semestre, ano, siglaTurma, siglaDisciplina) REFERENCES Turma (semestre, ano, siglaTurma, siglaDisciplina),
	
	CONSTRAINT PK_AlunoInscreveTurma PRIMARY KEY (ra, semestre, ano, siglaTurma, siglaDisciplina)
)

CREATE TABLE DocenteTemCargoAdministrativo 
(
	siape char(9) NOT NULL, 
	nomeCargo varchar(30) NOT NULL, 
	dataInicio date NOT NULL,
	dataFim date,
	
	FOREIGN KEY (siape) REFERENCES Docente (siape),
	FOREIGN KEY (nomeCargo) REFERENCES CargoAdministrativo (nomeCargo),
	
	CONSTRAINT PK_DocenteTemCargoAdministrativo PRIMARY KEY (siape, nomeCargo)
)

CREATE TABLE Email 
(
	provedor varchar(20) NOT NULL,
	endereco varchar(30) NOT NULL,  
		
	CONSTRAINT PK_Email PRIMARY KEY (provedor, endereco)
)

CREATE TABLE EmailAluno 
(
	ra int NOT NULL, 
	provedor varchar(20) NOT NULL,
	endereco varchar(30) NOT NULL, 
	
	FOREIGN KEY (ra) REFERENCES Aluno (ra),
	FOREIGN KEY (provedor, endereco) REFERENCES Email (provedor, endereco),
	CONSTRAINT PK_EmailAluno PRIMARY KEY (ra, provedor, endereco)
)

CREATE TABLE AlunoMatriculadoCurso 
(
	ra int NOT NULL, 
	siglaCurso varchar(5) NOT NULL,
	dataIngresso date NOT NULL,
	dataSaida date	NOT NULL, 
	
	FOREIGN KEY (ra) REFERENCES Aluno (ra),
	FOREIGN KEY (siglaCurso) REFERENCES Curso (sigla),
	
	CONSTRAINT PK_AlunoMatriculadoCurso PRIMARY KEY (ra, siglaCurso)
)

CREATE TABLE EmailDocente 
(
	siape char(9) NOT NULL, 
	provedor varchar(20) NOT NULL,
	endereco varchar(30) NOT NULL,  
	
	FOREIGN KEY (siape) REFERENCES Docente (siape),
	FOREIGN KEY (provedor, endereco) REFERENCES Email (provedor, endereco),
	
	CONSTRAINT PK_EmailDocente PRIMARY KEY (siape, provedor, endereco)
)

CREATE TABLE TelefoneDocente 
(
	siape char(9) NOT NULL, 
	ddd char(2) NOT NULL, 
	numero varchar(9) NOT NULL,
	ddi varchar(3) NOT NULL,
	
	FOREIGN KEY (siape) REFERENCES Docente (siape),
		
	CONSTRAINT PK_TelefoneDocente PRIMARY KEY (ddd, numero, siape)
)
