CREATE SCHEMA IF NOT EXISTS `dbcampeonato` ;

USE `dbcampeonato` ;

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`campeonato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `premiacao` DOUBLE NOT NULL,
  `temporada` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`patrocinador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `cota` DOUBLE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`time_arbitragem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `c_amarelos` SMALLINT(3) UNSIGNED NOT NULL,
  `c_vermelhos` SMALLINT(3) UNSIGNED NOT NULL,
  `faltas` SMALLINT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`arbitro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `funcao` VARCHAR(30) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  `idtime_arbitragem` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `arbitro`
    FOREIGN KEY (`idtime_arbitragem`)
    REFERENCES `dbcampeonato`.`time_arbitragem` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`partida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duracao` TINYINT(3) UNSIGNED NOT NULL,
  `mandante` VARCHAR(30) NOT NULL,
  `visitante` VARCHAR(30) NOT NULL,
  `gols_mandante` TINYINT(3) NOT NULL,
  `gols_visitante` TINYINT(3) NOT NULL,
  `faltas_mandante` TINYINT(3) NOT NULL,
  `faltas_visitante` TINYINT(3) NOT NULL,
  `posse_mandante` TINYINT(3) UNSIGNED NOT NULL,
  `c_amarelos_mandante` TINYINT(3) NOT NULL,
  `c_vermelhos_mandante` TINYINT(3) NOT NULL,
  `c_vermelhos_visitante` TINYINT(3) NOT NULL,
  `c_amarelos_visitante` TINYINT(3) NOT NULL,
  `data_partida` DATE NOT NULL,
  `idtime_arbitragem` INT NOT NULL,
  `idcampeonato` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `partida`
    FOREIGN KEY (`idtime_arbitragem`)
    REFERENCES `dbcampeonato`.`time_arbitragem` (`id`),
    FOREIGN KEY (`idcampeonato`)
    REFERENCES `dbcampeonato`.`campeonato` (`id`)	
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`estadio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `capacidade` MEDIUMINT(6) UNSIGNED NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(30) NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `estado` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`time` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `vitorias` TINYINT(3) UNSIGNED NOT NULL,
  `derrotas` TINYINT(3) UNSIGNED NOT NULL,
  `empates` TINYINT(3) UNSIGNED NOT NULL,
  `gols_pro` TINYINT(3) UNSIGNED NOT NULL,
  `gols_sofridos` TINYINT(3) UNSIGNED NOT NULL,
  `faltas` TINYINT(3) UNSIGNED NOT NULL,
  `c_amarelos` TINYINT(3) UNSIGNED NOT NULL,
  `c_vermelhos` TINYINT(3) UNSIGNED NOT NULL,
  `idestadio` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `time`
    FOREIGN KEY (`idestadio`)
    REFERENCES `dbcampeonato`.`estadio` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`tecnico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`jogador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `gols` TINYINT(3) UNSIGNED NOT NULL,
  `faltas` TINYINT(3) UNSIGNED NOT NULL,
  `c_amarelos` TINYINT(3) UNSIGNED NOT NULL,
  `c_vermelhos` TINYINT(3) UNSIGNED NOT NULL,
  `posicao` VARCHAR(30) NOT NULL,
  `idtime` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `jogador`
    FOREIGN KEY (`idtime`)
    REFERENCES `dbcampeonato`.`time` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`time_tecnico` (
  `idtecnico` INT NOT NULL,
  `idtime` INT NOT NULL,
  PRIMARY KEY (`idtecnico`),
  CONSTRAINT `time_tecnico`
    FOREIGN KEY (`idtecnico`)
    REFERENCES `dbcampeonato`.`tecnico` (`id`),
    FOREIGN KEY (`idtime`)
    REFERENCES `dbcampeonato`.`time` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`patrocinador_patrocina_campeonato` (
  `idcampeonato` INT NOT NULL,
  `idpatrocinador` INT NOT NULL,
  PRIMARY KEY (`idcampeonato`, `idpatrocinador`),
  CONSTRAINT `patrocinador_patrocina_campeonator`
    FOREIGN KEY (`idcampeonato`)
    REFERENCES `dbcampeonato`.`campeonato` (`id`),
    FOREIGN KEY (`idpatrocinador`)
    REFERENCES `dbcampeonato`.`patrocinador` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`campeonato_possui_time` (
  `idcampeonato` INT NOT NULL,
  `idtime` INT NOT NULL,
  PRIMARY KEY (`idcampeonato`, `idtime`),
  CONSTRAINT `campeonato_possui_time`
    FOREIGN KEY (`idcampeonato`)
    REFERENCES `dbcampeonato`.`campeonato` (`id`),
    FOREIGN KEY (`idtime`)
    REFERENCES `dbcampeonato`.`time` (`id`)
);

CREATE TABLE IF NOT EXISTS `dbcampeonato`.`time_joga_partida` (
  `idtime` INT NOT NULL,
  `idpartida` INT NOT NULL,
  CONSTRAINT `time_joga_partida`
    FOREIGN KEY (`idtime`)
    REFERENCES `dbcampeonato`.`time` (`id`),
    FOREIGN KEY (`idpartida`)
    REFERENCES `dbcampeonato`.`partida` (`id`)
);