-- CONSULTAS

-- 1: Listar todos os campeonatos
	SELECT * FROM campeonato;
-- 2: Listar todos os patrocinadores com cota entre 200000 e 300000
	SELECT * FROM patrocinador WHERE cota BETWEEN 200000 AND 300000;
-- 3: Listar todos os estadios com capacidade maior que 50000
	SELECT * FROM estadio WHERE capacidade > 50000;
-- 4: Listar todos os times
	SELECT * FROM time;
-- 5: Listar as partidas com duração maior que 92 minutos
	SELECT * FROM partida WHERE duracao > 92;
-- 6: Listar os times que fizeram mais que 3 gols
	SELECT * FROM time WHERE gols_pro > 3;
-- 7: Listar todos os arbitros
	SELECT * FROM arbitros;

-- 8: Listar os jogadores com maior número de gols
	SELECT * FROM jogador ORDER BY gols DESC;
    
-- 9: Listar os times com maior número de vitórias
	SELECT * FROM time ORDER BY vitorias DESC;
    
-- 10: Listar os patrocinadores com maior contribuição
	SELECT * FROM patrocinador ORDER BY cota DESC;
    


-- 11: Retornar o número de jogadores com mais de 33 anos para cada time
	SELECT  idtime,COUNT(FLOOR(DATEDIFF(CURDATE(), data_nasc) / 365.25)) as total FROM jogador WHERE FLOOR(DATEDIFF(CURDATE(), data_nasc) / 365.25) > 33  GROUP BY idtime;

-- 12: Retornar a média de duração das partidas de um campeonato
	SELECT idcampeonato,AVG(duracao) FROM dbcampeonato.partida GROUP BY idcampeonato;
    
-- 13: Retornar a média de gols das partidas de um campeonato em até 2 casas decimais
	SELECT idcampeonato,  ROUND(AVG((gols_mandante + gols_visitante)),2) as media FROM dbcampeonato.partida GROUP BY idcampeonato;
    
-- 14: Retornar o número de cartoes vermelhos de jogadores para cada time 
	SELECT idtime,SUM(c_vermelhos) AS total FROM jogador GROUP BY idtime;
    
-- 15 Retornar o número de faltas de jogadores para cada time 
	SELECT idtime,SUM(faltas) AS total FROM jogador GROUP BY idtime;
    


-- 16 Retornar o nome dos patrocinadores e o nome do campeonato que eles patrocinam
	SELECT patrocinador.nome, campeonato.nome FROM patrocinador
    INNER JOIN patrocinador_patrocina_campeonato ON patrocinador.id = idpatrocinador
    INNER JOIN campeonato ON idcampeonato = campeonato.id;
    
-- 17 Retornar o time de arbitragem com o número de partidas que eles apitaram
	SELECT time_arbitragem.id,c_amarelos,c_vermelhos,faltas ,COUNT(partida.idtime_arbitragem) AS totalpartidas FROM time_arbitragem
    INNER JOIN partida ON time_arbitragem.id = idtime_arbitragem
    WHERE time_arbitragem.id = idtime_arbitragem
    GROUP BY time_arbitragem.id;
    
-- 18 Retornar o nome dos times que participam do campeonato brasileiro
	SELECT time.nome FROM campeonato_possui_time
    INNER JOIN time ON idtime = time.id WHERE idcampeonato = 1;

-- 19 Retornar o nome e a cidade dos times do campeonato brasileiro
	SELECT time.nome, estadio.cidade FROM campeonato_possui_time 
	INNER JOIN time ON idtime = time.id
    INNER JOIN estadio ON idestadio = estadio.id
    WHERE idcampeonato = 1;
    

-- 20 Retornar o nome e o número de faltas dos campeonatos
	SELECT nome, SUM(partida.faltas_mandante + partida.faltas_visitante) AS total FROM campeonato
    INNER JOIN partida ON campeonato.id = partida.idcampeonato
    WHERE campeonato.id = partida.idcampeonato
    GROUP BY campeonato.id;
-- VIEWS

-- 1 Classificacao_campeonato_brasileiro
	CREATE VIEW classificacao AS 
    SELECT nome, SUM(vitorias * 3 + empates) AS pontuacao, vitorias, empates, derrotas, gols_pro, gols_sofridos, CAST(gols_pro AS SIGNED) -  CAST(gols_sofridos AS SIGNED) AS saldo FROM campeonato_possui_time
    INNER JOIN time on idtime = id
    WHERE idcampeonato = 1
    GROUP BY id
    ORDER BY pontuacao DESC, vitorias DESC, saldo DESC;
    
    SELECT * from classificacao;

-- 2 Campeonato_cota_total
	CREATE VIEW campeonato_cota_total AS
    SELECT campeonato.nome, SUM(cota) as cotatotal from campeonato 
    INNER JOIN patrocinador_patrocina_campeonato ON campeonato.id = idcampeonato
    INNER JOIN patrocinador ON idpatrocinador = patrocinador.id
	WHERE campeonato.id = idcampeonato
    GROUP BY campeonato.id;
    
    SELECT * FROM campeonato_cota_total;

-- 3 Time_media_de_idade
	CREATE VIEW time_media_idade AS
    SELECT time.id,time.nome, AVG(FLOOR(DATEDIFF(CURDATE(), data_nasc) / 365.25)) AS mediaidade FROM time
    INNER JOIN jogador ON time.id = jogador.idtime
    WHERE time.id = idtime
    GROUP BY time.id;
    
    
    SELECT * FROM time_media_idade;
 
    
   
