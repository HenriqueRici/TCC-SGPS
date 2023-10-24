CREATE TABLE if not exists `data-sgps-db`.participante (
    id INTEGER auto_increment NOT NULL,
    nome varchar(100) NOT NULL,
    cpf varchar(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    dt_ingresso DATE NOT NULL,
    classe varchar(100) NOT NULL,
    nivel varchar(100) NOT NULL,

    CONSTRAINT participante_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1;