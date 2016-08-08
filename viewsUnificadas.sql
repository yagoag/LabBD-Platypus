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
