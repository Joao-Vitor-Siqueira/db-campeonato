START TRANSACTION;
INSERT INTO `dbcampeonato`.`campeonato` (nome, premiacao, temporada) VALUES ('Campeonato A', 50000, '2024');
COMMIT;


START TRANSACTION;
UPDATE `dbcampeonato`.`time` SET vitorias = vitorias + 1 WHERE id = 1;
COMMIT;


START TRANSACTION;
DELETE FROM `dbcampeonato`.`jogador` WHERE id = 2;
COMMIT;


START TRANSACTION;
INSERT INTO `dbcampeonato`.`jogador` (nome, data_nasc, gols, faltas, c_amarelos, c_vermelhos, posicao, idtime) VALUES ('Jogador X', '1990-05-10', 10, 5, 2, 0, 'Atacante', 1);
COMMIT;


START TRANSACTION;
INSERT INTO `dbcampeonato`.`campeonato` (nome, premiacao, temporada) VALUES ('Campeonato B', 60000, '2025');
ROLLBACK;


START TRANSACTION;
UPDATE `dbcampeonato`.`time` SET derrotas = derrotas + 1 WHERE id = 3;
ROLLBACK;


START TRANSACTION;
UPDATE `dbcampeonato`.`estadio` SET capacidade = 50000 WHERE id = 4;
ROLLBACK;


START TRANSACTION;
INSERT INTO `dbcampeonato`.`tecnico` (nome, data_nasc) VALUES ('Tecnico Y', '1975-03-20');
ROLLBACK;


START TRANSACTION;
INSERT INTO `dbcampeonato`.`patrocinador` (nome, cota) VALUES ('Patrocinador Z', 15000);
SAVEPOINT savepoint1;
UPDATE `dbcampeonato`.`patrocinador` SET cota = 20000 WHERE id = 3;
ROLLBACK TO SAVEPOINT savepoint1;
COMMIT;


START TRANSACTION;
INSERT INTO `dbcampeonato`.`time` (nome, vitorias, derrotas, empates, gols_pro, gols_sofridos, faltas, c_amarelos, c_vermelhos, idestadio) VALUES ('Time B', 10, 5, 3, 20, 15, 25, 5, 2, 2);
SAVEPOINT savepoint2;
UPDATE `dbcampeonato`.`time` SET vitorias = 12 WHERE id = 5;
ROLLBACK TO SAVEPOINT savepoint2;
COMMIT;
