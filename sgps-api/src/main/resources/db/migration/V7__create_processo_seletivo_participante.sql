CREATE TABLE if not exists `sgps-db`.processo_seletivo_participante (
    id INTEGER auto_increment NOT NULL,
    id_participante INTEGER NOT NULL,
    id_processo_seletivo INTEGER NOT NULL,
    CONSTRAINT processo_seletivo_participante_pk PRIMARY KEY (id),
    CONSTRAINT processo_seletivo_participante_FK FOREIGN KEY (id_participante) REFERENCES `sgps-db`.participante(id),
    CONSTRAINT processo_seletivo_participante_FK_1 FOREIGN KEY (id_processo_seletivo) REFERENCES `sgps-db`.processo_seletivo(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1;