INSERT INTO Pessoa VALUES ('11100000001', 0,'Santos', 'Mauricio', '10000000', 'SSP/MG', 'Rua dos Alunos', 14, 'São Carlos', 'Bairro dos Alunos', '13560001');
INSERT INTO Pessoa VALUES ('11100000002', 1,'Silva', 'Maria', '20000000', 'SSP/RJ', 'Rua dos Alunos', 30, 'São Carlos', 'Bairro dos Alunos', '13560001');
INSERT INTO Pessoa VALUES ('11100000003', 2, 'Souza', 'Mariana', '30000000', 'SEJUSP', 'Rua dos Alunos', 14, 'São Carlos', 'Bairro dos Alunos', '13560001');
INSERT INTO Pessoa VALUES ('11100000004', 3, 'Salomão', 'Marcela', '40000000', 'DPMAF', 'Rua dos Alunos', 91, 'São Carlos', 'Bairro dos Alunos', '13560001');
INSERT INTO Pessoa VALUES ('11100000005', 4, 'Salgado', 'Matheus', '50000000', 'GOVGO', 'Rua dos Alunos', 30, 'São Carlos', 'Bairro dos Alunos', '13560001');
INSERT INTO Pessoa VALUES ('22200000001', 5, 'Castro', 'Cecília', '60000000', 'SSP/MG', 'Rua dos Professores', 90, 'São Carlos', 'Bairro dos Profesores', '13560002');
INSERT INTO Pessoa VALUES ('22200000002', 6, 'Cachoeira', 'Cauã', '70000000', 'PMMG', 'Rua dos Professores', 643, 'São Carlos', 'Bairro dos Profesores', '13560002');
INSERT INTO Pessoa VALUES ('22200000003', 7, 'Caetano', 'Cláudia', '80000000', 'IICCECF', 'Rua dos Professores', 141, 'São Carlos', 'Bairro dos Profesores', '13560002');
INSERT INTO Pessoa VALUES ('22200000004', 8, 'Cardoso', 'Carlos', '90000000', 'DPF', 'Rua dos Professores', 730, 'São Carlos', 'Bairro dos Profesores', '13560002');
INSERT INTO Pessoa VALUES ('22200000005', 9, 'Cruz', 'Caio', '100000000', 'PMMG', 'Rua dos Professores', 934, 'São Carlos', 'Bairro dos Profesores', '13560002');
INSERT INTO Pessoa VALUES ('33300000001', 10, 'Lima', 'Arthur', '1100000000', 'SSP/SP', 'Rua dos Tecnicos', 33, 'São Carlos', 'Bairro dos Tecnicos', '13560003');
INSERT INTO Pessoa VALUES ('33300000002', 11, 'Linhares', 'Adriana', '1200000000', 'CRMV', 'Rua dos Tecnicos', 841, 'São Carlos', 'Bairro dos Tecnicos', '13560003');
INSERT INTO Pessoa VALUES ('33300000003', 12, 'Lopes', 'Alexandre', '1300000000', 'SSP/SP', 'Rua dos Tecnicos', 614, 'São Carlos', 'Bairro dos Tecnicos', '13560003');
INSERT INTO Pessoa VALUES ('33300000004', 13, 'Lins', 'Anderson', '1400000000', 'FIPE', 'Rua dos Tecnicos', 391, 'São Carlos', 'Bairro dos Tecnicos', '13560003');
INSERT INTO Pessoa VALUES ('33300000005', 14, 'Luz', 'Amanda', '1500000000', 'SSP/SP', 'Rua dos Tecnicos', 288, 'São Carlos', 'Bairro dos Tecnicos', '13560003');


-- 10 funcionarios, todos sao Docentes ou Tecnicos (siape, cpf)
INSERT INTO Funcionario VALUES ('000000001', '22200000001');
INSERT INTO Funcionario VALUES ('000000002', '22200000002');
INSERT INTO Funcionario VALUES ('000000003', '22200000003');
INSERT INTO Funcionario VALUES ('000000004', '22200000004');
INSERT INTO Funcionario VALUES ('000000005', '22200000005');
INSERT INTO Funcionario VALUES ('100000001', '33300000001');
INSERT INTO Funcionario VALUES ('100000002', '33300000002');
INSERT INTO Funcionario VALUES ('100000003', '33300000003');
INSERT INTO Funcionario VALUES ('100000004', '33300000004');
INSERT INTO Funcionario VALUES ('100000005', '33300000005');

INSERT INTO Docente VALUES ('000000001', 'Departamento de Computação', '16', '0001', '3300');
INSERT INTO Docente VALUES ('000000002', 'Departamento de Computação', '16', '0002', '3300');
INSERT INTO Docente VALUES ('000000003', 'Departamento de Computação', '16', '0003', '3300');
INSERT INTO Docente VALUES ('000000004', 'Departamento de Computação', '16', '0004', '3300');
INSERT INTO Docente VALUES ('000000005', 'Departamento de Computação', '16', '0005', '3300');

INSERT INTO Gabinete VALUES (1, 'Departamento de Computação');
INSERT INTO Gabinete VALUES (2, 'Departamento de Computação');
INSERT INTO Gabinete VALUES (3, 'Departamento de Computação');
INSERT INTO Gabinete VALUES (4, 'Departamento de Computação');
INSERT INTO Gabinete VALUES (5, 'Departamento de Computação');
INSERT INTO Gabinete VALUES (6, 'Departamento de Computação');

INSERT INTO Tecnico VALUES ('100000001',  1, 'Departamento de Computação');
INSERT INTO Tecnico VALUES ('100000002',  2, 'Departamento de Computação');
INSERT INTO Tecnico VALUES ('100000003',  3, 'Departamento de Computação');
INSERT INTO Tecnico VALUES ('100000004',  4, 'Departamento de Computação');
INSERT INTO Tecnico VALUES ('100000005',  5, 'Departamento de Computação');

INSERT INTO Aluno VALUES (1, '11100000001', '', '', 'Masculino', 'Maria', 'Santos', 'João', 'Santos', '19950101', 'Campinas', 'SP', 'gmail.com', 'msantos', 2012, 'Colégio 1');
INSERT INTO Aluno VALUES (2, '11100000002', '', '', 'Masculino', 'Maria', 'Silva', 'João', 'Silva', '19920203', 'São Paulo', 'SP', 'gmail.com', 'msilva', 2009, 'Colégio 2');
INSERT INTO Aluno VALUES (3, '11100000003', '', '', 'Masculino', 'Maria', 'Souza', 'João', 'Souza', '19930305', 'Uberlândia', 'MG', 'hotmail.com', 'msouza', 2010, 'Colégio 3');
INSERT INTO Aluno VALUES (4, '11100000004', '', '', 'Masculino', 'Maria', 'Salomão', 'João', 'Salomão', '19950407', 'Ribeirão Preto', 'SP', 'gmail.com', 'msalomao', 2012, 'Colégio 4');
INSERT INTO Aluno VALUES (5, '11100000005', '', '', 'Masculino', 'Maria', 'Salgado', 'João', 'Salgado', '19900509', 'Brasília', 'DF', 'hotmail.com', 'msalgado', 2007, 'Colégio 5');

INSERT INTO Disciplina VALUES ('CAP', 'Construção de Algoritmos e Programação', 4, 4);
INSERT INTO Disciplina VALUES ('PC', 'Programação de Computadores', 2, 2);
INSERT INTO Disciplina VALUES ('IL', 'Introdução a Lógica', 0, 4);
INSERT INTO Disciplina VALUES ('CD', 'Circuitos Digitais', 4, 0);
INSERT INTO Disciplina VALUES ('LCD', 'Laboratório de Circuitos Digitais', 0, 2);
INSERT INTO Disciplina VALUES ('ARQ1', 'Arquitetura e Organização de Computadores 1', 4, 0);
INSERT INTO Disciplina VALUES ('LARQ1', 'Laboratório de Arquitetura e Organização de Computadores 1', 0, 2);
INSERT INTO Disciplina VALUES ('ARQ2', 'Arquitetura e Organização de Computadores 2', 4, 0);
INSERT INTO Disciplina VALUES ('LARQ2', 'Laboratório de Arquitetura e Organização de Computadores 2', 0, 2);
INSERT INTO Disciplina VALUES ('C1', 'Calculo 1', 0, 4);

INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32000001', 1, 'Departamento de Computação');
INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32000002', 2, 'Departamento de Computação');
INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32000003', 3, 'Departamento de Computação');
INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32000004', 4, 'Departamento de Computação');
INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32000005', 5, 'Departamento de Computação');
INSERT INTO TelefoneGabineteTecnico VALUES ('16', '32010005', 6, 'Departamento de Computação');

INSERT INTO Turma VALUES (1, 2013, 'A', 'CAP', 1, 40, 5, 40);
INSERT INTO Turma VALUES (2, 2013, 'A', 'PC',  1, 40, 5, 40);
INSERT INTO Turma VALUES (1, 2013, 'A', 'IL',  1, 40, 5, 40);
INSERT INTO Turma VALUES (2, 2013, 'A', 'CD',  1, 40, 5, 40);
INSERT INTO Turma VALUES (2, 2013, 'A', 'LCD', 1, 40, 5, 40);

INSERT INTO CargoAdministrativo VALUES ('Secretario de Graduação','DC',40);
INSERT INTO CargoAdministrativo VALUES ('Secretario de Pós-Graduação','DM',40);
INSERT INTO CargoAdministrativo VALUES ('Coordenador de Graduação','DF',40);
INSERT INTO CargoAdministrativo VALUES ('Coordenador de Pós-Graduação','DSo',40);
INSERT INTO CargoAdministrativo VALUES ('Chefe de  Departamento','DMa',40);

INSERT INTO AlunoCursaTurma VALUES (1, 1, 2013, 'A', 'CAP', 10 , 20000);
INSERT INTO AlunoCursaTurma VALUES (2, 1, 2013, 'A', 'CAP', 8  , 16000);
INSERT INTO AlunoCursaTurma VALUES (3, 1, 2013, 'A', 'CAP', 9.5, 19000);
INSERT INTO AlunoCursaTurma VALUES (4, 1, 2013, 'A', 'CAP', 9  , 18000);
INSERT INTO AlunoCursaTurma VALUES (5, 1, 2013, 'A', 'CAP', 8.5, 17000);

INSERT INTO Nota VALUES ( 1, 1, 2013, 'A', 'CAP', 'P1', 10);
INSERT INTO Nota VALUES ( 2, 1, 2013, 'A', 'CAP', 'P1', 8);
INSERT INTO Nota VALUES ( 3, 1, 2013, 'A', 'CAP', 'P1', 9.5);
INSERT INTO Nota VALUES ( 4, 1, 2013, 'A', 'CAP', 'P1', 9);
INSERT INTO Nota VALUES ( 5, 1, 2013, 'A', 'CAP', 'P1', 8.5);

INSERT INTO Local VALUES ('DC', 'LE3', 40);
INSERT INTO Local VALUES ('DC', 'LE4', 40);
INSERT INTO Local VALUES ('AT9', '212', 40);
INSERT INTO Local VALUES ('AT9', '199', 40);
INSERT INTO Local VALUES ('DC', 'LE5', 40);

INSERT INTO TurmaAtribuicaoLocal VALUES (1, 2013, 'A', 'CAP', 'DC' , 'LE3', 'Segunda-feira', '8:00' , '12:00');
INSERT INTO TurmaAtribuicaoLocal VALUES (2, 2013, 'A', 'PC',  'DC' , 'LE4', 'Quarta-feira' , '8:00' , '12:00');
INSERT INTO TurmaAtribuicaoLocal VALUES (1, 2013, 'A', 'IL',  'AT9', '212', 'Quinta-feira' , '8:00' , '12:00');
INSERT INTO TurmaAtribuicaoLocal VALUES (2, 2013, 'A', 'CD',  'AT9', '199', 'Segunda-feira', '8:00' , '12:00');
INSERT INTO TurmaAtribuicaoLocal VALUES (2, 2013, 'A', 'LCD', 'DC' , 'LE5', 'Segunda-feira', '14:00', '16:00');

INSERT INTO Carga VALUES ('CAP', '000000001', 2013, 1, 'Professor');
INSERT INTO Carga VALUES ('IL',  '000000002', 2014, 1, 'Professor');
INSERT INTO Carga VALUES ('CD',  '000000003', 2015, 1, 'Professor');
INSERT INTO Carga VALUES ('LCD', '000000004', 2016, 1, 'Professor');
INSERT INTO Carga VALUES ('PC',  '000000005', 2013, 2, 'Professor');

INSERT INTO PreRequisito VALUES ('PC',    'CAP');
INSERT INTO PreRequisito VALUES ('CD',    'IL');
INSERT INTO PreRequisito VALUES ('LCD',   'IL');
INSERT INTO PreRequisito VALUES ('ARQ1',  'CD');
INSERT INTO PreRequisito VALUES ('LARQ1', 'CD');
INSERT INTO PreRequisito VALUES ('ARQ2',  'ARQ1');
INSERT INTO PreRequisito VALUES ('LARQ2', 'ARQ1');

INSERT INTO CoRequisito VALUES ('CD',    'LCD');
INSERT INTO CoRequisito VALUES ('LCD',   'CD');
INSERT INTO CoRequisito VALUES ('ARQ1',  'LARQ1');
INSERT INTO CoRequisito VALUES ('LARQ1', 'ARQ1');
INSERT INTO CoRequisito VALUES ('ARQ2',  'LARQ2');
INSERT INTO CoRequisito VALUES ('LARQ2', 'ARQ2');


----------------------------------------------------------------------------------------------------------------
-- Precisa de Curso e Enade aqui

INSERT INTO Curso VALUES('Ciencia da Computacao'   , 'BCC')
INSERT INTO Curso VALUES('Engenharia de Computacao', 'ENC')
INSERT INTO Curso VALUES('Engenharia de Materiais' , 'EM' )
INSERT INTO Curso VALUES('Engenharia de Producao'  , 'EP' )
INSERT INTO Curso VALUES('Engenharia Fisica'       , 'EF' )

INSERT INTO CursoIndicadoParaDisciplina VALUES('BCC', 'C1', 'obrigatoria', 1 )
INSERT INTO CursoIndicadoParaDisciplina VALUES('ENC', 'C1', 'obrigatoria', 1 )
INSERT INTO CursoIndicadoParaDisciplina VALUES('EM' , 'C1', 'obrigatoria', 1 )
INSERT INTO CursoIndicadoParaDisciplina VALUES('EP' , 'C1', 'obrigatoria', 1 )
INSERT INTO CursoIndicadoParaDisciplina VALUES('EF' , 'C1', 'obrigatoria', 1 )

INSERT INTO Enade VALUES(2015, 5, 'BCC')
INSERT INTO Enade VALUES(2014, 3, 'ENC')
INSERT INTO Enade VALUES(2010, 4, 'EM' )
INSERT INTO Enade VALUES(2016, 4, 'EP' )
INSERT INTO Enade VALUES(2013, 4, 'EF' )

INSERT INTO EnadeAvaliaCurso VALUES(2015, 'BCC')
INSERT INTO EnadeAvaliaCurso VALUES(2014, 'ENC')
INSERT INTO EnadeAvaliaCurso VALUES(2010, 'EM' )
INSERT INTO EnadeAvaliaCurso VALUES(2016, 'EP' )
INSERT INTO EnadeAvaliaCurso VALUES(2013, 'EF' )
-- a tabela AlunoMatriculadoCurso deve ter correspondencia com aluno realiza enade
-- nao eh possivel um aluno ralizar o enade de outro curso  
INSERT INTO AlunoRealizaEnade VALUES(1, 2015,'BCC', '2016-10-15', 'reprovado', 2)
INSERT INTO AlunoRealizaEnade VALUES(2, 2014,'ENC', '2016-10-15', 'aprovado' , 5)
INSERT INTO AlunoRealizaEnade VALUES(3, 2010,'EM' , '2016-10-15', 'reprovado', 2)
INSERT INTO AlunoRealizaEnade VALUES(4, 2016,'EP' , '2016-10-15', 'aprovado',  7)
INSERT INTO AlunoRealizaEnade VALUES(5, 2013,'EF' , '2016-10-15', 'reprovado', 2)
--------------------------------------------------------------------------------------------------------

INSERT INTO Licenca VALUES('000000001', '2016-10-15', '1988-10-30', 'link Para Documentos', 'link indicação da licença no Diário Oficial da União','Problema Físico')
INSERT INTO Licenca VALUES('000000002', '2016-5-1'  , '2016-6-1'  , 'link Para Documentos', 'link indicação da licença no Diário Oficial da União','Problema Psicológico')
INSERT INTO Licenca VALUES('100000003', '2016-7-30' , '2016-8-15' , 'link Para Documentos', 'link indicação da licença no Diário Oficial da União','Morte familiar')
INSERT INTO Licenca VALUES('100000004', '2016-5-1'  , '2016-6-1'  , 'link Para Documentos', 'link indicação da licença no Diário Oficial da União','Gravidez')
INSERT INTO Licenca VALUES('100000005', '2016-3-15' , '2016-3-30' , 'link Para Documentos', 'link indicação da licença no Diário Oficial da União','Depressão')

INSERT INTO NucleoDocenteEstruturante VALUES ('BCC', '2016-6-1','Link para regimento de BCC');
INSERT INTO NucleoDocenteEstruturante VALUES ('ENC', '2016-6-1','Link para regimento de ENC');
INSERT INTO NucleoDocenteEstruturante VALUES ('EM',  '2016-6-1','Link para regimento de EM');
INSERT INTO NucleoDocenteEstruturante VALUES ('EP',  '2016-6-1','Link para regimento de EP');
INSERT INTO NucleoDocenteEstruturante VALUES ('EF',  '2016-6-1','Link para regimento de EF');

INSERT INTO ProjetoPoliticoPedagogico VALUES ('BCC'	,	'2000-3-1',	'Projeto de Curso BCC'	)
INSERT INTO ProjetoPoliticoPedagogico VALUES ('ENC'	,	'1990-6-1',	'Projeto de Curso ENC'	)
INSERT INTO ProjetoPoliticoPedagogico VALUES ('EM'	,	'1970-5-1',	'Projeto de Curso EM'	)
INSERT INTO ProjetoPoliticoPedagogico VALUES ('EP'	,	'2010-7-1',	'Projeto de Curso EP'	)
INSERT INTO ProjetoPoliticoPedagogico VALUES ('EF'	,	'2015-9-1',	'Projeto de Curso EF'	)

INSERT INTO AprovacaoProjetoPoliticoPedagogico VALUES ('BCC',	'2000-3-1',	'000000001',	1)
INSERT INTO AprovacaoProjetoPoliticoPedagogico VALUES ('ENC',	'1990-6-1',	'000000002',	1)
INSERT INTO AprovacaoProjetoPoliticoPedagogico VALUES ('EM'	,	'1970-5-1',	'000000003',	0)
INSERT INTO AprovacaoProjetoPoliticoPedagogico VALUES ('EP'	,	'2010-7-1',	'000000004',	0)
INSERT INTO AprovacaoProjetoPoliticoPedagogico VALUES ('EF'	,	'2015-9-1',	'000000005',	0)

INSERT INTO Reconhecimento VALUES (1)
INSERT INTO Reconhecimento VALUES (2)
INSERT INTO Reconhecimento VALUES (3)
INSERT INTO Reconhecimento VALUES (4)
INSERT INTO Reconhecimento VALUES (5)

INSERT INTO CursoSolicitaReconhecimento VALUES (1,	1,	'2010-3-15')
INSERT INTO CursoSolicitaReconhecimento VALUES (2,	2,	'1990-3-15')
INSERT INTO CursoSolicitaReconhecimento VALUES (3,	3,	'1997-3-15')
INSERT INTO CursoSolicitaReconhecimento VALUES (4,	4,	'1980-3-15')
INSERT INTO CursoSolicitaReconhecimento VALUES (5,	5,	'2015-3-15')

INSERT INTO ItemAvaliado VALUES (1,	1,	1,	'Didatica'	    ,	1)
INSERT INTO ItemAvaliado VALUES (2,	2,	2,	'Pesquisa'	    ,	1)
INSERT INTO ItemAvaliado VALUES (3,	3,	3,	'Ensino'        ,	1)
INSERT INTO ItemAvaliado VALUES (4,	4,	4,	'Extensão'	    ,	0)
INSERT INTO ItemAvaliado VALUES (5,	5,	5,	'Infraestrutura',	0)

INSERT INTO ComiteReconhecimento VALUES ('Alonso'	,	'Ribeiro',	1)
INSERT INTO ComiteReconhecimento VALUES ('Pedro'	,	'Rogerio',	2)
INSERT INTO ComiteReconhecimento VALUES ('Marcela'	,	'Paz'	 ,	3)
INSERT INTO ComiteReconhecimento VALUES ('Yago'		,	'Rocha' ,	4)
INSERT INTO ComiteReconhecimento VALUES ('Alexandre',	'Lara'   ,	5)

-- Guilhermo

INSERT INTO PlanoDeEnsino VALUES (
	2, 2013, 'A', 'LCD',  '000000004',
	'DE ACORDO COM OS OBJETIVOS NORTEADOS PELA DISCIPLINA, OS ASSUNTOS ABORDADOS SERÃO: ESTUDO DE DIVERSOS COMPONENTES E A SUA MANIPULAÇÃO; EQUIPAMENTOS DE MEDIÇÃO E TESTES; PROJETO, IMPLEMENTAÇÃO, MEDIÇÃO E TESTE DE CIRCUITOS COMBINATÓRIOS; PROJETO, IMPLEMENTAÇÃO, MEDIÇÃO E TESTE DE CIRCUITOS SEQÜENCIAIS.',
	'Estratégias de Ensino
- Exposição dos assuntos de forma participativa; 
- Apresentação de aplicações e benefícios; 
- Apresentação de exemplos práticos; 
- Proposição de trabalhos práticos e uma prova. ',
	'Habilitar o aluno a realizar simulações e implementações por meio de diagramas esquemáticos e linguagens de descrição de hardware (HDLs) de circuitos digitais incluindo portas lógicas, decodificadores, multiplexadores, flip-flops e registradores, aritmética e modelos de memória.',
	'CAPACITAR O ALUNO QUANTO À IMPLEMENTAÇÃO E TESTE DE CIRCUITOS COMBINATÓRIOS E SEQÜENCIAIS, UTILIZANDO TECNOLOGIAS ATUALMENTE DISPONÍVEIS; E TAMBÉM, QUANTO AO MANEJO DE EQUIPAMENTOS LABORATORIAIS DE IMPLEMENTAÇÃO, MEDIÇÃO E TESTE DE CIRCUITOS.'
);

INSERT INTO PlanoDeEnsino VALUES (
	2, 2013, 'A', 'CD', '000000004',
	'DE ACORDO COM OS OBJETIVOS NORTEADOS PELA DISCIPLINA, OS ASSUNTOS ABORDADOS SERÃO: PORTAS LÓGICAS BÁSICAS E, OU E NÃO; EXEMPLOS DE CIRCUITS COMBINATÓRIOS TÍPICOS; TECNOLOGIAS DE IMPLEMENTAÇÃO DE CIRCUITOS DIGITAIS; CONCEITOS DE SISTEMAS SEQÜENCIAIS SÍNCRONOS E ASSÍNCRONOS; ELEMENTOS DE ESTADO: LATCHES E FLIP-FLOPS; SÍNTESE DE CIRCUITOS SEQÜENCIAIS (MÁQUINAS DE MEALY E MOORE); EXEMPLOS DE CIRCUITOS SEQÜENCIAIS TÍPICOS.',
	'Estratégias de Ensino
As seguintes estratégias são sugeridas: 
- exposição dos assuntos de forma interativa; 
- reflexões sobre excertos das referências básicas; 
- proposição de exercícios; 
- resolução de exercícios; 
- aplicação de avaliação. ',
	'Objetivos Específicos
-Além de capacitar os alunos para o entendimento dos assuntos listados na seção anterior (Tópicos/Duração), bem como para desenvolver reflexão sobre estes assuntos, outros objetivos associados à capacitação dos alunos podem ser ressaltados: 

- análise de sistemas digitais (nível simbólico); 
- projeto de sistemas digitais (nível simbólico); 
- aquisição de fundamentos para técnicas de implementação de sintese digitais (nível elétrico); 
- aquisição de vocabulário específico; 
- estimular a capacitade de criação de sistemas digitais voltados à solução de problemas reais e/ou visando gerar maior qualidade na interação com o meio em que se vive.',
	'CAPACITAR O ALUNO QUANTO AO PROJETO LÓGICO DE CIRCUITOS COMBINATÓRIOS E SEQÜENCIAIS, BEM COMO QUANTO A IMPLEMENTAÇÃO USANDO PORTAS LÓGICAS, ABORDANDO QUESTÕES COMO MINIMIZAÇÃO, CONSUMO DE ENERGIA, RETARDO DE PROPAGAÇÃO, INTERCONEXÃO, FAMÍLIAS DE CIRCUITOS INTEGRADOS E COMPONENTES TÍPICOS.'
);

INSERT INTO PlanoDeEnsino VALUES (
	2, 2013, 'A', 'PC', '000000003',
	'1- ESPECIFICAÇÃO DA LINGUAGEM DE PROGRAMAÇÃO: TIPOS DE DADOS, ESTRUTURAS DE CONTROLE, ENTRADA E SAÍDA.2- REPRESENTAÇÃO DE ALGORITMOS NA LINGUAGEM DE PROGRAMAÇÃO;3- ESTRUTURA DE DADOS;4- ORGANIZAÇÃO DE ARQUIVOS;5- EXERCÍCIOS;',
	'Aulas expositivas, discussão de exemplos e implementação com a linguagem C++.',
	'Aprendizado dos conceitos de orientação a objetos utilizando a liguagem C++.',
	'APRESENTAÇÃO DE LINGUAGENS DE PROGRAMAÇÃO E DO MAPEAMENTO DOS ALGORITMOS JÁ CONHECIDOS PARA PROGRAMAS NAS LINGUAGENS DE PROGRAMAÇÃO. COMPLEMENTAR O CONHECIMENTO DE METODOLOGIAS DE PROGRAMAÇÃO E INTRODUZIR NOVAS TÉCNICAS DE MANIPULAÇÃO DE ESTRUTURAS DE INFORMAÇÃO E DEPURAÇÃO DE ERROS EM PROGRAMAS. INTRODUZIR A METODOLOGIA DE PROGRAMAÇÃO ORIENTADA A OBJETOS.'
);

INSERT INTO PlanoDeEnsino VALUES (
	1, 2013, 'A', 'CAP', '000000001',
	'DE ACORDO COM OS OBJETIVOS NORTEADOS PELA DISCIPLINA, OS ASSUNTOS ABORDADOS SERÃO: CARACTERÍSTICAS BÁSICAS DOS COMPUTADORES: UNIDADES BÁSICAS, INSTRUÇÕES, PROGRAMAS ARMAZENADOS, LINGUAGEM DE MÁQUINA, ENDEREÇAMENTO, LINGUAGENS DE PROGRAMAÇÃO, SISTEMAS OPERACIONAIS, EQUIPAMENTOS PERIFÉRICOS; SISTEMAS NUMÉRICOS, ARITMÉTICA BINÁRIA, CÓDIGOS PONDERADOS E NÃO PONDERADOS: REPRESENTAÇÃO E CONVERSÕES DE BASES; AMBIENTE DE PROGRAMAÇÃO: EDIÇÃO, COMPILADORES, FERRAMENTAS AUXILIARES; CONCEITOS DE METODOLOGIAS DE DESENVOLVIMENTO DE ALGORITMOS: ESTRUTURAÇÃO DE CÓDIGO E DADOS, MODULARIZAÇÃO, DESENVOLVIMENTO TOP-DOWN, REAPROVEITAMENTO DE CÓDIGO, ABSTRAÇÃO DE CONTROLE E DE DADOS; CONSTRUÇÃO DE ALGORITMOS: ABORDAGEM PARA SOLUÇÃO DE PROBLEMAS, ESTRUTURAS DE CONTROLE, ESTRUTURAÇÃO DE DADOS, ESTRUTURAS DE MODULARIZAÇÃO; LINGUAGENS DE PROGRAMAÇÃO: CODIFICAÇÃO DE ALGORITMOS, COMPILAÇÃO, DEPURAÇÃO; E DISCIPLINA DE DOCUMENTAÇÃO.',
	'Apresentação de com projetor, proposição e resolução de algoritmos, bem como proposição de programas na linguagem C nas aulas de laboratório. Proposição de material de estudo para discussão em aula.',
	'Fornecer ao aluno conhecimentos básicos sobre computadores (organização, representação de valores em memória, periféricos, sistema operacional), sobre algoritmos (proposição de soluções, refinamentos e modularização) e sobre programação (codificação dos algoritmos em uma linguagem de programação - linguagem C).',
	'OS ALUNOS DEVERÃO SER CAPAZES DE ABORDAR PROBLEMAS DE DIFERENTES COMPLEXIDADES E ESTAR APTOS A PROVER SOLUÇÕES ALGORÍTMICAS PARA SOLUCIONÁ-LOS, APRESENTANDO PROPOSTAS DE SOLUÇÃO ESTRUTURADAS, ORGANIZADAS, COERENTES E COM DOCUMENTAÇÃO ADEQUADA. SERÃO CAPAZES DE UTILIZAR EFICIENTEMENTE AS ESTRUTURAS DE ENTRADA E SAÍDA, ESTRUTURAS CONDICIONAIS E ESTRUTURAS DE REPETIÇÃO NOS ALGORITMOS PROPOSTOS, BEM COMO FARÃO USO JUSTO DAS ESTRUTURAS DE REPRESENTAÇÃO DE DADOS EM MEMÓRIA. TERÃO COMPETÊNCIA PARA ORGANIZAR O ALGORITMO EM SUB-ROTINAS COM PASSAGEM ADEQUADA DE PARÂMETROS E FAZER USO CORRETO DE VARIÁVEIS GLOBAIS E LOCAIS. POSSUIRÃO CONHECIMENTO PARA A MANIPULAÇÃO BÁSICA DE DADOS EM ARQUIVOS.ADICIONALMENTE, OS ALUNOS APRENDERÃO UMA LINGUAGEM DE PROGRAMAÇÃO NA QUAL AS SOLUÇÕES ALGORÍTMICAS ELABORADAS SERÃO IMPLEMENTADAS. TERÃO, PORTANTO, TAMBÉM A HABILIDADE DE UTILIZAR DE FORMA EFICIENTE UM AMBIENTE DE PROGRAMAÇÃO (SISTEMA OPERACIONAL E EDITOR DE PROGRAMAS) E UM COMPILADOR, COM VISTA A GERAR PROGRAMAS UTILIZANDO CORRETAMENTE AS ESTRUTURAS DE CONTROLE E A REPRESENTAÇÃO DE DADOS DISPONÍVEIS.'
);

INSERT INTO PlanoDeEnsino VALUES (
	1, 2013, 'A', 'IL', '000000002',
	'DE ACORDO COM OS OBJETIVOS NORTEADOS PELA DISCIPLINA, OS ASSUNTOS ABORDADOS SERÃO: O CÁLCULO PROPOSICIONAL: PROPOSIÇÕES ATÔMICAS, CONECTIVOS, PROPOSIÇÕES COMPOSTAS, FÓRMULAS BEM FORMADAS, LINGUAGEM PROPOSICIONAL, SEMÂNTICA (MODELOS), CONSEQÜÊNCIA LÓGICA, EQUIVALÊNCIA LÓGICA, MÉTODOS DE MINIMIZAÇÃO, MINIMIZAÇÃO DE EXPRESSÕES ALGÉBRICAS, DEDUÇÃO, FORMAS NORMAIS, REGRAS DE INFERÊNCIA, ARGUMENTOS, O PRINCÍPIO DE RESOLUÇÃO; EA LÓGICA DE PRIMEIRA ORDEM: ALFABETOS DE PRIMEIRA ORDEM, TERMOS, FÓRMULAS BEM FORMADAS, LINGUAGEM DE PRIMEIRA ORDEM, ESCOPO DE QUANTIFICADORES, VARIÁVEIS LIVRES E LIGADAS, SEMÂNTICA (MODELOS), CONSEQÜÊNCIA LÓGICA, EQUIVALÊNCIA LÓGICA, DEDUÇÃO, SKOLEMIZAÇÃO, FORMAS NORMAIS, QUANTIFICAÇÃO UNIVERSAL E NOTAÇÃO CLAUSAL, CLÁUSULAS DE HORN, UNIVERSO DE HERBRAND, DEMONSTRAÇÃO AUTOMÁTICA DE TEOREMAS POR COMPUTADOR, SUBSTITUIÇÃO E UNIFICAÇÃO, UNIFICADORES MAIS GERAIS, O PRINCÍPIO DE RESOLUÇÃO.',
	'Exposição dialogada em todos os itens. Desenvolvimento (e resolução) de exercícios e problemas em sala de aula e proposição de empenho individual de forma similar.',
	'Apresentar e discutir os fundamentos das linguagens do Cálculo Proposicional e da Lógica de Primeira Ordem, de maneira a habilitar o aluno a usar ambas as linguagens como formalismos para a representação e resolução de problemas. Promover a abordagem e o tratamento de problemas de maneira sistemática e formal.',
	'ALÉM DE DESENVOLVER NO ALUNO A CAPACIDADE DO RACIOCÍNIO LÓGICO E ABSTRATO NO INTUITO DE PREPARÁ-LO A DESENVOLVER ALGORITMOS RÁPIDOS E EFICIENTES, A DISCIPLINA TEM COMO OBJETIVO DAR FUNDAMENTAÇÃO SOBRE SISTEMAS DEDUTIVOS E FORMALISMOS DA LÓGICA CLÁSSICA. AO FINAL DA DISCIPLINA O ALUNO DEVE CONHECER OS CONCEITOS DA LÓGICA PROPOSICIONAL E DE PREDICADOS E SUAS APLICAÇÕES NA COMPUTAÇÃO.'
);

INSERT INTO PlanoDeEnsino_Recurso VALUES (
	1, 2013, 'A', 'CAP',
	'Projetores, software de apresentação, computadores para as aulas de laboratório e lousa, ambiente MOODLE de ensino à distância, compiladores da linguagem C.'
);

INSERT INTO PlanoDeEnsino_Recurso VALUES (
	1, 2013, 'A', 'IL',
	'Lousa, giz e projetor multimídia. Literatura sugerida.'
);

INSERT INTO PlanoDeEnsino_Recurso VALUES (
	2, 2013, 'A', 'PC',
	'Laboratório de informática; 
literatura relacionada; 
ambiente Moodle.'
);

INSERT INTO PlanoDeEnsino_Recurso VALUES (
	2, 2013, 'A', 'CD',
	'Livro, giz e lousa.'
);

INSERT INTO PlanoDeEnsino_Recurso VALUES (
	2, 2013, 'A', 'LCD',
	'Computador, Projetor multimídia, Slides, Material multimídia, Quadro branco ou negro, Canetas ou giz, Laboratório contendo microcomputadores, kits didáticos, instrumentos de medição e softwares para simulação e implementação de sistemas digitais. 
O ambiente Moodle será utilizado como apoio no desenvolvimento da disciplina para a distribuição de materiais, entrega de relatórios e comunicação entre docente e alunos. Internet.'
);

INSERT INTO PlanoDeEnsino_Atividades VALUES (
	2, 2013, 'A', 'CD',
	30,
	1,
	'São expectativas de comportamento associado ao aluno: 
- participação efetiva nas aulas: acompanhando a exposição, gerando questionamentos diante de dúvidas, compondo observações em face de discordâncias e demandando informação para suprir curiosidades; 
- empenho na resolução de exercícios propostos; 
- preparação para as avaliações; 
- dedicação ao estudo dos assuntos expostos em sala de aula, indivivualmente e/ou em grupo.'
);
 
INSERT INTO PlanoDeEnsino_Atividades VALUES (
	1, 2013, 'A', 'CAP',
	30,
	2,
	'Acompanhar as apresentações; Desenvolver soluções algorítmicas propostas pelo professor em sala de aula; Transcrever as soluções algorítmicas para programas computacionais, implementá-los e testa-los em laboratório; Utilizar o laboratório e a biblioteca para estudos fora do horário de aula para realizar tarefas extra-classe.'
);

INSERT INTO PlanoDeEnsino_Atividades VALUES (
	2, 2013, 'A', 'PC',
	30,
	3,
	'Resolver exercícios avaliativos utilizando a linguagem C++. 
Participar das aulas e discutir os conceitos de orientação a objeto, com implementação em C++. '
);

INSERT INTO PlanoDeEnsino_Atividades VALUES (
	1, 2013, 'A', 'IL',
	30,
	4,
	'Estudos individuais e participação em discussões coletivas em sala de aula.'
);

INSERT INTO PlanoDeEnsino_Atividades VALUES (
	2, 2013, 'A', 'LCD',
	30,
	5,
	'- Presença e participação nas aulas em laboratório. 
- Implementar circuitos digitais em protoboard. 
- Implementar circuitos digitais em ambiente de programação. 
- Desenvolver e implementar projetos. 
- Elaborar trabalhos,escrever relatórios e realizar prova. 
- Apresentação de relatórios e seminários.'
);

INSERT INTO PlanoDeEnsino_EAD VALUES (
	1, 2013, 'A', 'CAP',
	4,
	'1. Introdução; manipulação básica de algoritmos'
);
INSERT INTO PlanoDeEnsino_EAD VALUES (
	1, 2013, 'A', 'CAP',
	4,
	'2. Algoritmos de nível alto; formalização de algoritmos; refinamentos '
);
INSERT INTO PlanoDeEnsino_EAD VALUES (
	1, 2013, 'A', 'CAP',
	4,
	'3. Algoritmos: condicionais '
);
INSERT INTO PlanoDeEnsino_EAD VALUES (
	1, 2013, 'A', 'CAP',
	4,
	'4. Algoritmos: repetições '
);
INSERT INTO PlanoDeEnsino_EAD VALUES (
	1, 2013, 'A', 'CAP',
	4,
	'11. Programação: SO, linguagens, codificação; compilação, variáveis, ES '
);

INSERT INTO PlanoDeEnsino_DistribHoras VALUES (
	2, 2013, 'A', 'CD',
	2,
	'1) Introducao'
);

INSERT INTO PlanoDeEnsino_DistribHoras VALUES (
	2, 2013, 'A', 'CD',
	4,
	'2) Sistemas numéricos, códigos e operações aritméticas'
);

INSERT INTO PlanoDeEnsino_DistribHoras VALUES (
	2, 2013, 'A', 'CD',
	2,
	'3) Álgebra de Boole, portas lógicas básicas e síntese de circuitos combinatórios'
);

INSERT INTO PlanoDeEnsino_DistribHoras VALUES (
	2, 2013, 'A', 'CD',
	8,
	'4) Minimização de circuitos digitais'
);

INSERT INTO PlanoDeEnsino_DistribHoras VALUES (
	2, 2013, 'A', 'CD',
	8,
	'5) Elementos de estado (latches e flip-flops) e circuitos sequenciais'
);

INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (
	1, 2013, 'A', 'IL',
	'A Cartilha da Lógica',
	'Apontamentos - EDUFSCar', 2010, 'Prof. Maria do Carmo Nicoletti'
);

INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (
	1, 2013, 'A', 'CAP',
	'Algoritmos',
	'SeAD UFSCar', 2005, 'Moreira, J.'
);

INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (
	2, 2013, 'A', 'LCD',
	'Rapid Prototyping of Digital Systems',
	'Springer', 2008, 'Hamblen, J. O.; Hall, T. S.; Furman, M. D.'
);

INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (
	2, 2013, 'A', 'LCD',
	'Digital Design and Implementation with Field Programmable Devices',
	'Kap', 2005, 'Navabi, Z.'
);

INSERT INTO PlanoDeEnsino_BibliografiaBasica VALUES (
	2, 2013, 'A', 'LCD',
	'Sistemas Digitais - Princípios e Aplicações',
	'Pearson, Prentice Hall', 2011, 'Tocci, R. J.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	2, 2013, 'A', 'LCD',
	'Eletrônica Digital Moderna e VHDL',
	'Campus', 2010, 'Pedroni, V. A.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	2, 2013, 'A', 'LCD',
	'Elementos de Eletrônica Digital',
	'Editora Érica', 2012, 'Capuano, F. G.; Idoeta, I. V.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	1, 2013, 'A', 'IL',
	'Foundations of Logic Programming',
	'Springer-Verlag', 1984, 'Lloyd, J.W.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	1, 2013, 'A', 'IL',
	'Álgebra Booleana e Circuitos de Chaveamento',
	'McGraw-Hill', 1977, 'Mendelson, E.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	1, 2013, 'A', 'IL',
	'Logic for Problem Solving',
	'North-Holland', 1979, 'Kowalski, R.'
);

INSERT INTO PlanoDeEnsino_BibliografiaComplementar VALUES (
	1, 2013, 'A', 'IL',
	'Álgebra Booleana e Circuitos de Chaveamento - Segunda Edição',
	'McGraw-Hill', 1977, 'Mendelson, E.'
);

INSERT INTO PlanoDeEnsino_Topico VALUES (
	1, 2013, 'A', 'IL',
	20,
	1,
	'1. O cálculo proposicional: proposições atômicas, conectivos, proposições compostas, fórmulas bem formadas, linguagem proposicional, semântica (modelos), consequência lógica, equivalência lógica, métodos de minimização, minimização de expressões algébricas, dedução, formas normais, regras de inferência, argumentos, o princípio de resolução. (20 créditos)'
);

INSERT INTO PlanoDeEnsino_Topico VALUES (
	1, 2013, 'A', 'IL',
	20,
	2,
	'2. A lógica de primeira ordem: alfabetos de primeira ordem, termos, fórmulas bem formadas, linguagem de primeira ordem, escopo de quantificadores, variáveis livres e ligadas, semântica (modelos), consequência lógica, equivalência lógica, dedução, skolemização, formas normais, quantificação universal e notação clausal, cláusulas de horn. (20 créditos)'
);

INSERT INTO PlanoDeEnsino_Topico VALUES (
	1, 2013, 'A', 'IL',
	10,
	3,
	'3.Universo de herbrand, demonstração automática de teoremas por computador, substituição e unificação, unificadores mais gerais, o princípio de resolução. (10 créditos) '
);

INSERT INTO PlanoDeEnsino_Topico VALUES (
	1, 2013, 'A', 'IL',
	10,
	4,
	'4.Realização de avaliações individuais (10 créditos)'
);

INSERT INTO PlanoDeEnsino_Topico VALUES (
	2, 2013, 'A', 'LCD',
	14,
	5,
	'3- Experimentos com Circuitos Combinacionais (14 horas) 
- Implementação de circuitos combinacionais por meio da técnica de descrição de projeto por diagramas esquemáticos no ambiente Quartus II da Altera. 
- Implementação de circuito combinacional em proto-board para fins de comparação. 
- Implementação de circuito combinacional utilizando HDLs (Verilog-HDL/VHDL) no ambiente Quartus II da Altera. 
- Simulação no Kit DE1.'

);

INSERT INTO Licenca VALUES (
	'000000001', '2016-02-01', '2016-02-11', '', 'Coordenador', 'LICENÇA PARA TRATAR DE INTERESSES PARTICULARES'
);

INSERT INTO Licenca VALUES (
	'000000002', '2016-02-11', '2016-08-11', '', 'Coordenador', 'LICENÇA PATERNIDADE'
);

INSERT INTO Licenca VALUES (
	'000000003', '2016-02-11', '2016-02-18', '', 'Coordenador', 'LICENÇA POR MOTIVO DE DOENÇA EM PESSOA DA FAMÍLIA'
);

INSERT INTO Licenca VALUES (
	'000000004', '2016-02-11', '2016-03-11', '', 'Coordenador', 'LICENÇA SAÚDE'
);

INSERT INTO Licenca VALUES (
	'000000005', '2016-02-11', '2017-02-11', '', 'Coordenador', 'LICENÇA GESTANTE'
);

/*INSERT INTO Reuniao VALUES (
	'2016-02-11 13:23:44'
);

INSERT INTO Reuniao VALUES (
	'2016-03-11 13:23:44'
);

INSERT INTO Reuniao VALUES (
	'2016-04-11 13:23:44'
);

INSERT INTO Reuniao VALUES (
	'2016-05-11 13:23:44'
);

INSERT INTO Reuniao VALUES (
	'2016-06-11 13:23:44'
);*/
INSERT INTO Reuniao VALUES ('20160520 10:34:09 AM')
INSERT INTO Reuniao VALUES ('20160618 12:30:00 AM')
INSERT INTO Reuniao VALUES ('20160519 10:00:00 PM')
INSERT INTO Reuniao VALUES ('20160418 10:30:00 PM')
INSERT INTO Reuniao VALUES ('20160318 10:34:00 AM')

INSERT INTO ItemDePauta VALUES (
	1, '20160520 10:34:09 AM', 
	'Analisar os Relatórios de afastamento de até 5 dias dos docentes de siape 000000001 e 000000002'
);

INSERT INTO ItemDePauta VALUES (
	2, '20160520 10:34:09 AM', 
	'Analisar o Relatório de afastamento para o exterior do docente de siape 000000003'
);

INSERT INTO ItemDePauta VALUES (
	3, '20160520 10:34:09 AM', 
	'Analisar o Relatório do Projeto de Evento Acadêmico MEETING 2015'
);

INSERT INTO ItemDePauta VALUES (
	4, '20160520 10:34:09 AM', 
	'Analisar o Relatório do Projeto de Evento Acadêmico XVII Jornada Multidisciplinar, “Diversidade, Acessibilidade e Direitos: Diálogos com a Comunicação”'
);

INSERT INTO ItemDePauta VALUES (
	5, '20160520 10:34:09 AM', 
	'Analisar solicitação de Estágio Docência dos aluno do programa de pós-graduação'
);

INSERT INTO DecisaoAprovada VALUES (
	1, '20160520 10:34:09 AM', 
	'Aprovado'
);

INSERT INTO DecisaoAprovada VALUES (
	2, '20160520 10:34:09 AM', 
	'Reprovado'
);

INSERT INTO DecisaoAprovada VALUES (
	3, '20160520 10:34:09 AM', 
	'Aprovado'
);

INSERT INTO DecisaoAprovada VALUES (
	4, '20160520 10:34:09 AM', 
	'Retirado de pauta'
);

INSERT INTO DecisaoAprovada VALUES (
	5, '20160520 10:34:09 AM', 
	'Aprovado todos alunos'
);


-- Lucas

INSERT INTO Matricula VALUES ('BCC', 1, '20100310', '20150130')
INSERT INTO Matricula VALUES ('ENC', 2, '20110310', '20170130')
INSERT INTO Matricula VALUES ('EM',  3, '20120310', '20170130')
INSERT INTO Matricula VALUES ('EP',  4, '20100310', '20150130')
INSERT INTO Matricula VALUES ('BCC', 5, '20130310', '20170130')

INSERT INTO MembroNucleoDocenteEstruturante VALUES ('000000001', 'BCC', '20120117', '')
INSERT INTO MembroNucleoDocenteEstruturante VALUES ('000000002', 'EP' , '20120120', '')
INSERT INTO MembroNucleoDocenteEstruturante VALUES ('000000003', 'ENC', '20110130', '')
INSERT INTO MembroNucleoDocenteEstruturante VALUES ('000000004', 'EP' , '20120122', '')
INSERT INTO MembroNucleoDocenteEstruturante VALUES ('000000005', 'BCC', '20150130', '')

INSERT INTO ReuniaoNucleoDocenteEstruturante VALUES ('20160520 10:34:09 AM', 'BCC')
INSERT INTO ReuniaoNucleoDocenteEstruturante VALUES ('20160618 12:30:00 AM', 'BCC')
INSERT INTO ReuniaoNucleoDocenteEstruturante VALUES ('20160519 10:00:00 PM', 'ENC')
INSERT INTO ReuniaoNucleoDocenteEstruturante VALUES ('20160418 10:30:00 PM', 'ENC')
INSERT INTO ReuniaoNucleoDocenteEstruturante VALUES ('20160318 10:34:00 AM', 'BCC')

INSERT INTO ParticipaReuniaoNucleo VALUES ('000000001', 'BCC', '20160520 10:34:09 AM')
INSERT INTO ParticipaReuniaoNucleo VALUES ('000000003', 'ENC', '20160519 10:00:00 PM')
INSERT INTO ParticipaReuniaoNucleo VALUES ('000000001', 'BCC', '20160618 12:30:00 AM')
INSERT INTO ParticipaReuniaoNucleo VALUES ('000000005', 'BCC', '20160318 10:34:00 AM')
INSERT INTO ParticipaReuniaoNucleo VALUES ('000000005', 'BCC', '20160520 10:34:09 AM')

INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 1, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES ('000000003', 'ENC', 2, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 3, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 4, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 5, '20160520 10:34:09 AM')

INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 1, '20160520 10:34:09 AM', 1, '')
INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES ('000000003', 'ENC', 2, '20160520 10:34:09 AM', 2, '')
INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 3, '20160520 10:34:09 AM', 3, '')
INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 4, '20160520 10:34:09 AM', 4, '')
INSERT INTO ComunicadoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 5, '20160520 10:34:09 AM', 5, '')

INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 1, '20160520 10:34:09 AM', 1, '')
INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES ('000000003', 'ENC', 2, '20160520 10:34:09 AM', 2, '')
INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES ('000000001', 'BCC', 3, '20160520 10:34:09 AM', 3, '')
INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 4, '20160520 10:34:09 AM', 4, '')
INSERT INTO PropostaIntervencaoNucleoDocenteEstruturante VALUES ('000000005', 'BCC', 5, '20160520 10:34:09 AM', 5, '')


INSERT INTO ConselhoCoordenacao VALUES ('BCC', '19720520 10:34:09 AM')
INSERT INTO ConselhoCoordenacao VALUES ('ENC', '19730520 10:34:09 AM')
INSERT INTO ConselhoCoordenacao VALUES ('EP',  '19800520 10:34:09 AM')
INSERT INTO ConselhoCoordenacao VALUES ('EM',  '19710520 10:34:09 AM')
INSERT INTO ConselhoCoordenacao VALUES ('EF',  '19720520 10:34:09 AM')

INSERT INTO MembroConsehoCoordenacao VALUES ('11100000001', 'BCC', '19720520 10:34:09 AM', '20160510', '')
INSERT INTO MembroConsehoCoordenacao VALUES ('11100000002', 'BCC', '19720520 10:34:09 AM', '20160511', '')
INSERT INTO MembroConsehoCoordenacao VALUES ('11100000003', 'BCC', '19720520 10:34:09 AM', '20160512', '')
INSERT INTO MembroConsehoCoordenacao VALUES ('11100000004', 'EP',  '19800520 10:34:09 AM', '20160513', '')
INSERT INTO MembroConsehoCoordenacao VALUES ('11100000005', 'EM',  '19710520 10:34:09 AM', '20160514', '')

INSERT INTO ReuniaoConselhoCoordenacaoCurso VALUES ('20160520 10:34:09 AM', 'BCC', '19720520 10:34:09 AM')
INSERT INTO ReuniaoConselhoCoordenacaoCurso VALUES ('20160520 10:34:09 AM', 'ENC', '19730520 10:34:09 AM')
INSERT INTO ReuniaoConselhoCoordenacaoCurso VALUES ('20160520 10:34:09 AM', 'EP',  '19800520 10:34:09 AM')
INSERT INTO ReuniaoConselhoCoordenacaoCurso VALUES ('20160520 10:34:09 AM', 'EM', '19710520 10:34:09 AM')
INSERT INTO ReuniaoConselhoCoordenacaoCurso VALUES ('20160520 10:34:09 AM', 'EF', '19720520 10:34:09 AM')

INSERT INTO ParticipaReuniaoConselhoCoordenacao VALUES ('11100000001', 'BCC', '19720520 10:34:09 AM', '20160520 10:34:09 AM', 'BCC', '19720520')
INSERT INTO ParticipaReuniaoConselhoCoordenacao VALUES ('11100000002', 'BCC', '19720520 10:34:09 AM', '20160520 10:34:09 AM', 'BCC', '19720520')
INSERT INTO ParticipaReuniaoConselhoCoordenacao VALUES ('11100000003', 'BCC', '19720520 10:34:09 AM', '20160520 10:34:09 AM', 'BCC', '19720520')
INSERT INTO ParticipaReuniaoConselhoCoordenacao VALUES ('11100000004', 'EP',  '19800520 10:34:09 AM', '20160520 10:34:09 AM', 'EP',  '19800520')
INSERT INTO ParticipaReuniaoConselhoCoordenacao VALUES ('11100000005', 'EM',  '19710520 10:34:09 AM', '20160520 10:34:09 AM', 'EM', '19710520')

INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES ('11100000001', 'BCC', '19720520 10:34:09 AM', 1, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES ('11100000002', 'BCC', '19720520 10:34:09 AM', 2, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES ('11100000003', 'BCC', '19720520 10:34:09 AM', 3, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES ('11100000004', 'EP',  '19800520 10:34:09 AM', 4, '20160520 10:34:09 AM')
INSERT INTO PropoeItemReuniaoConselhoDeCoordenacao VALUES ('11100000005', 'EM',  '19710520 10:34:09 AM', 5, '20160520 10:34:09 AM')
