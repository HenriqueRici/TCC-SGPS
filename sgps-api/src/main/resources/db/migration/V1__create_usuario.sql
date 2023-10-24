CREATE TABLE if not exists `sgps-db`.usuario (
    id INTEGER auto_increment NOT NULL,
    login varchar(100) NOT NULL,
    senha varchar(100) NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1;