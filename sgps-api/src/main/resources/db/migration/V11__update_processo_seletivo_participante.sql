RENAME TABLE `sgps-db`.processo_seletivo_participante TO `sgps-db`.inscricao;
ALTER TABLE `sgps-db`.inscricao DROP FOREIGN KEY participante_processo_seletivo_participante_fk;
ALTER TABLE `sgps-db`.inscricao DROP FOREIGN KEY processo_seletivo_processo_seletivo_participante_fk;
ALTER TABLE `sgps-db`.inscricao ADD CONSTRAINT inscricao_participante_fk FOREIGN KEY (id_participante) REFERENCES `sgps-db`.participante(id);
ALTER TABLE `sgps-db`.inscricao ADD CONSTRAINT inscricao_processo_seletivo_fk FOREIGN KEY (id_processo_seletivo) REFERENCES `sgps-db`.processo_seletivo(id);

