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