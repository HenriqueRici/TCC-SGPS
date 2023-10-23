ALTER TABLE `sgps-db`.processo_seletivo DROP COLUMN dt_inicio_inscricoes;
ALTER TABLE `sgps-db`.processo_seletivo ADD dt_inicio_inscricoes DATETIME NOT NULL;
ALTER TABLE `sgps-db`.processo_seletivo DROP COLUMN dt_fim_inscricoes;
ALTER TABLE `sgps-db`.processo_seletivo ADD dt_fim_inscricoes DATETIME NOT NULL;
ALTER TABLE `sgps-db`.processo_seletivo DROP COLUMN dt_inicio_retificacao;
ALTER TABLE `sgps-db`.processo_seletivo ADD dt_inicio_retificacao DATETIME NOT NULL;
ALTER TABLE `sgps-db`.processo_seletivo DROP COLUMN dt_fim_retificacao;
ALTER TABLE `sgps-db`.processo_seletivo ADD dt_fim_retificacao DATETIME NOT NULL;
