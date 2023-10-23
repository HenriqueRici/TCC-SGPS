CREATE TABLE if not exists `sgps-db`.participante (
    id INTEGER auto_increment NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    dt_ingresso DATE NOT NULL,
    classe varchar(100) NOT NULL,
    nivel varchar(100) NOT NULL,
    id_usuario INTEGER NOT NULL,
    CONSTRAINT participante_pk PRIMARY KEY (id),
    CONSTRAINT participante_fk FOREIGN KEY (id_usuario) REFERENCES `sgps-db`.usuario(id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1;