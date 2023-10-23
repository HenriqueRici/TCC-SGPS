ALTER TABLE `sgps-db`.processo_seletivo_participante DROP FOREIGN KEY processo_seletivo_participante_FK;
ALTER TABLE `sgps-db`.processo_seletivo_participante DROP FOREIGN KEY processo_seletivo_participante_FK_1;
ALTER TABLE `sgps-db`.processo_seletivo_participante ADD CONSTRAINT participante_processo_seletivo_participante_fk FOREIGN KEY (id_participante) REFERENCES `sgps-db`.participante(id);
ALTER TABLE `sgps-db`.processo_seletivo_participante ADD CONSTRAINT processo_seletivo_processo_seletivo_participante_fk FOREIGN KEY (id_processo_seletivo) REFERENCES `sgps-db`.processo_seletivo(id);