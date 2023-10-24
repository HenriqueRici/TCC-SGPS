ALTER TABLE `sgps-db`.usuario ADD id_perfil INTEGER NOT NULL;
ALTER TABLE `sgps-db`.usuario ADD CONSTRAINT usuario_fk FOREIGN KEY (id_perfil) REFERENCES `sgps-db`.perfil(id);