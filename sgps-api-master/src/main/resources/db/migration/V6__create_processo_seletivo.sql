CREATE TABLE if not exists `sgps-db`.processo_seletivo (
    id INTEGER auto_increment NOT NULL,
    edital varchar(100) NOT NULL,
    cargo varchar(100) NOT NULL,
    ano_referencia INTEGER NOT NULL,
    dt_inicio_inscricoes DATE NOT NULL,
    dt_fim_inscricoes DATE NOT NULL,
    dt_inicio_retificacao DATE NOT NULL,
    dt_fim_retificacao DATE NOT NULL,
    CONSTRAINT processo_seletivo_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1;