-- PROCEDURES

DELIMITER $$


CREATE PROCEDURE inserir_time(
    IN nome VARCHAR(30),
    IN idestadio INT,
    IN idtecnico INT,
    IN idcampeonato INT
)
BEGIN
    DECLARE idtime INT DEFAULT NULL;

    IF nome IS NOT NULL AND idestadio IS NOT NULL AND idtecnico IS NOT NULL AND idcampeonato IS NOT NULL THEN
        INSERT INTO time VALUES(NULL, nome, 0, 0, 0, 0, 0, 0, 0, 0, idestadio);
        SET idtime := LAST_INSERT_ID();
        INSERT INTO campeonato_possui_time VALUES(idcampeonato, idtime);
        INSERT INTO time_tecnico VALUES(idtecnico, idtime);
    END IF;

    SELECT * FROM time WHERE id = idtime;
END $$

DELIMITER ;

DELIMITER $$


CREATE PROCEDURE inserir_partida(
    IN duracao TINYINT(3),
    IN mandante VARCHAR(30),
    IN visitante VARCHAR(30),
    IN gols_mandante TINYINT(3),
    IN gols_visitante TINYINT(3),
    IN faltas_mandante TINYINT(3),
    IN faltas_visitante TINYINT(3),
    IN posse_mandante TINYINT(3),
    IN c_amarelos_mandante TINYINT(3),
    IN c_vermelhos__mandante TINYINT(3),
    IN c_vermelhos__visitante TINYINT(3),
    IN c_amarelos_visitante TINYINT(3),
    IN data_partida DATE,
    IN idtime_arbitragem INT,
    IN idcampeonato INT
)
BEGIN
    DECLARE idpartida, idmandante, idvisitante INT DEFAULT NULL;

    IF ( 
		duracao IS NOT NULL AND mandante IS NOT NULL AND visitante IS NOT NULL AND gols_mandante IS NOT NULL AND gols_visitante IS NOT NULL AND faltas_mandante IS NOT NULL AND faltas_visitante 
	    IS NOT NULL AND posse_mandante IS NOT NULL AND c_amarelos_mandante  IS NOT NULL AND  c_vermelhos__mandante IS NOT NULL AND c_vermelhos__visitante IS NOT NULL AND 
        c_amarelos_visitante IS NOT NULL AND data_partida IS NOT NULL AND idtime_arbitragem IS NOT NULL AND  idcampeonato IS NOT NULL
        ) 
        THEN
        
        SET idmandante := (SELECT id FROM time WHERE nome = mandante);
        SET idvisitante := (SELECT id FROM time WHERE nome = visitante);
        
        INSERT INTO partida VALUES(null,duracao,mandante,visitante,gols_mandante, gols_visitante,faltas_mandante,faltas_visitante,posse_mandante,
									c_amarelos_mandante,c_vermelhos__mandante,c_vermelhos__visitante,c_amarelos_visitante,data_partida,idtime_arbitragem,idcampeonato);
        
        SET idpartida := LAST_INSERT_ID();
		INSERT INTO time_joga_partida VALUES (idmandante,idpartida);
		INSERT INTO time_joga_partida VALUES (idvisitante,idpartida);
    END IF;

    SELECT * FROM partida WHERE id = idpartida;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE inserir_patrocinador(
    IN nome VARCHAR(30),
    IN cota DOUBLE,
    IN idcampeonato INT
)
BEGIN
    DECLARE idpatrocinador INT DEFAULT NULL;

    IF nome IS NOT NULL AND cota IS NOT NULL AND idcampeonato IS NOT NULL THEN
        INSERT INTO patrocinador VALUES(null,nome,cota);
        SET idpatrocinador := LAST_INSERT_ID();
		INSERT INTO patrocinador_patrocina_campeonato VALUES(idcampeonato,idpatrocinador);
    END IF;

    SELECT * FROM patrocinador WHERE id = idpatrocinador;
END $$

DELIMITER ;



CALL inserir_time("teste",1,8,1);
CALL inserir_partida(90,"Barcelona","Real Madrid",2,0,5,5,62,1,0,0,2,"2024-05-30",1,1);
CALL inserir_patrocinador("PUC",20000,1);


-- FUNCTIONS


-- Retornar o número de partidas que acontecem em um mesmo dia
DELIMITER $$

CREATE FUNCTION numpartidas(data_partida DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SET total = (SELECT COUNT(*) FROM partida WHERE partida.data_partida = data_partida);
    RETURN total;
END $$

DELIMITER ;
SELECT numpartidas("2024-05-30");


-- Retornar media de posse de bola de um time
DELIMITER $$

CREATE FUNCTION mediaposse(nometime VARCHAR(30))
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE pmandante DOUBLE;
    DECLARE pvisitante DOUBLE;
    DECLARE media DOUBLE;
    SET pmandante = (SELECT AVG(posse_mandante) FROM partida WHERE mandante = nometime);
    SET pvisitante = (SELECT AVG(100 - posse_mandante) FROM partida WHERE visitante = nometime);
    
    IF pmandante IS NULL AND pvisitante IS NULL THEN
        RETURN 0;
    ELSEIF pmandante IS NULL THEN
        RETURN pvisitante;
    ELSEIF pvisitante IS NULL THEN
        RETURN pmandante;
    ELSE
        SET media = (pmandante + pvisitante) / 2;
        RETURN media;
    END IF;

END $$

DELIMITER ;
SELECT mediaposse("Fluminense");


-- Retornar o número de patrocinadores de um campeonato
DELIMITER $$

CREATE FUNCTION numpatrocinadores(idcamp INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SET total = (SELECT COUNT(*) AS numpatrocinadores FROM patrocinador_patrocina_campeonato WHERE idcampeonato = idcamp);
    RETURN total;
END $$

DELIMITER ;
SELECT numpatrocinadores(1);













