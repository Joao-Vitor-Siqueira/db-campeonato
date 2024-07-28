-- INSERTS
	
-- Campeonato
	
    INSERT INTO campeonato VALUES(null,"Brasileirao",1000000,"2024");
    INSERT INTO campeonato VALUES(null,"Premier League",5000000,"2024-2025");
    INSERT INTO campeonato VALUES(null,"Bundesliga",3000000,"2024-2025");
    INSERT INTO campeonato VALUES(null,"Superliga Argentina",500000,"2024");
    INSERT INTO campeonato VALUES(null,"La liga",4000000,"2024-2025");
    INSERT INTO campeonato VALUES(null,"Serie A",2000000,"2024-2025");
    INSERT INTO campeonato VALUES(null,"Serie B",100000,"2024-2025");
    
    

-- patrocinador
	INSERT INTO patrocinador VALUES(null,"Continental",300000);
    INSERT INTO patrocinador VALUES(null,"Tim",300000);
    INSERT INTO patrocinador VALUES(null,"Chevrolet",400000);
    INSERT INTO patrocinador VALUES(null,"Coca-cola",500000);
    INSERT INTO patrocinador VALUES(null,"Heineken",200000);
    INSERT INTO patrocinador VALUES(null,"Visa",250000);
    INSERT INTO patrocinador VALUES(null,"Betfair",500000);
    

-- patrocinador_patrocina_campenato
	INSERT INTO patrocinador_patrocina_campeonato VALUES(1,6);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(2,5);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(3,4);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(4,3);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(5,2);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(6,1);
    
    INSERT INTO patrocinador_patrocina_campeonato VALUES(3,5);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(4,4);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(5,3);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(2,2);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(6,6);
    INSERT INTO patrocinador_patrocina_campeonato VALUES(2,4);

-- estadio
	INSERT INTO estadio VALUES(null,"Maracanã",70000,"13420870","Vila Isabel","Rio de Janeiro","RJ");
    INSERT INTO estadio VALUES(null,"São Januário",25000,"53330210","Vasco da Gama","Rio de Janeiro","RJ");
    INSERT INTO estadio VALUES(null,"Laranjeiras",2000,"61626660","Laranjeiras","Rio de Janeiro","RJ");
    INSERT INTO estadio VALUES(null,"Nilton Santos",40000,"23422270","Engenho de Dentro","Rio de Janeiro","RJ");
    INSERT INTO estadio VALUES(null,"Morumbi",60000,"12520850","Morumbi","São Paulo","SP");
    INSERT INTO estadio VALUES(null,"Alianz Parque",45000,"11320890","Água Branca","São Paulo","SP");
    
    INSERT INTO estadio VALUES(null,"Santiago Bernabeu",80000,"11350890","Madrid","Madrid","M");
    INSERT INTO estadio VALUES(null,"Camp Nou",75000,"11420890","Barcelona","Barcelona","M");
    INSERT INTO estadio VALUES(null,"Stamford Bridge",45000,"51320890","Madrid","Madrid","M");
    INSERT INTO estadio VALUES(null,"Old Trafford",65000,"33320890","Madrid","Madrid","M");

-- time
	INSERT INTO time VALUES(null,"Flamengo",0,0,0,0,0,0,0,0,1);
    INSERT INTO time VALUES(null,"Vasco",0,0,0,0,0,0,0,0,2);
    INSERT INTO time VALUES(null,"Fluminense",0,0,0,0,0,0,0,0,3);
    INSERT INTO time VALUES(null,"Botafogo",0,0,0,0,0,0,0,0,4);
    INSERT INTO time VALUES(null,"São Paulo",0,0,0,0,0,0,0,0,5);
    INSERT INTO time VALUES(null,"Palmeiras",0,0,0,0,0,0,0,0,6);
    
    INSERT INTO time VALUES(null,"Real Madrid",0,0,0,0,0,0,0,0,7);
    INSERT INTO time VALUES(null,"Barcelona",0,0,0,0,0,0,0,0,8);
    INSERT INTO time VALUES(null,"Chelsea",0,0,0,0,0,0,0,0,9);
    INSERT INTO time VALUES(null,"Manchester United",0,0,0,0,0,0,0,0,10);

-- campeonato_possui_time
	INSERT INTO campeonato_possui_time VALUES(1,1);
    INSERT INTO campeonato_possui_time VALUES(1,2);
    INSERT INTO campeonato_possui_time VALUES(1,3);
    INSERT INTO campeonato_possui_time VALUES(1,4);
    INSERT INTO campeonato_possui_time VALUES(1,5);
    INSERT INTO campeonato_possui_time VALUES(1,6);
    
	INSERT INTO campeonato_possui_time VALUES(5,7);
    INSERT INTO campeonato_possui_time VALUES(5,8);
    INSERT INTO campeonato_possui_time VALUES(2,9);
    INSERT INTO campeonato_possui_time VALUES(2,10);
-- tecnico
	INSERT INTO tecnico VALUES(null,"Tite","1976-11-26");
    INSERT INTO tecnico VALUES(null,"Álvaro Pacheco","1962-07-21");
    INSERT INTO tecnico VALUES(null,"Fernando Diniz","1975-03-16");
    INSERT INTO tecnico VALUES(null,"Artur Jorge","1972-01-01");
    INSERT INTO tecnico VALUES(null,"Zubeldia","1981-01-13");
    INSERT INTO tecnico VALUES(null,"Abel Ferreira","1978-12-22");
    INSERT INTO tecnico VALUES(null,"Renato Portalupi","1978-12-22");
    INSERT INTO tecnico VALUES(null,"Carlo Ancelotti","1952-12-22");
    INSERT INTO tecnico VALUES(null,"Pep Guardiola","1975-12-22");
    
-- time_tecnico
	INSERT INTO time_tecnico VALUES(1,1);
    INSERT INTO time_tecnico VALUES(2,2);
    INSERT INTO time_tecnico VALUES(3,3);
    INSERT INTO time_tecnico VALUES(4,4);
    INSERT INTO time_tecnico VALUES(5,5);
    INSERT INTO time_tecnico VALUES(6,6);

-- jogador
	INSERT INTO jogador VALUES(null,"Bruno Henrique","1992-06-20",0,0,0,0,"Ponta esquerda",1);
    INSERT INTO jogador VALUES(null,"Payet","1989-02-26",0,0,0,0,"Meia Central",2);
    INSERT INTO jogador VALUES(null,"Ganso","1992-12-12",0,0,0,0,"Meia Central",3);
    INSERT INTO jogador VALUES(null,"Junior Santos","1997-06-10",0,0,0,0,"Ponta direita",4);
    INSERT INTO jogador VALUES(null,"Alisson","1995-06-20",0,0,0,0,"Meia esquerda",5);
    INSERT INTO jogador VALUES(null,"Weverton","1988-01-03",0,0,0,0,"Goleiro",6);
    INSERT INTO jogador VALUES(null,"Fábio","1952-01-03",0,0,0,0,"Goleiro",6);
    
    INSERT INTO jogador VALUES(null,"Everton","1996-06-20",0,0,0,0,"Ponta esquerda",1);
    INSERT INTO jogador VALUES(null,"Gabriel Pec","1998-02-26",0,0,0,0,"Ponta esquerda",2);
    INSERT INTO jogador VALUES(null,"Fábio","1980-01-03",0,0,0,0,"Goleiro",3);
    INSERT INTO jogador VALUES(null,"Tiquinho Soares","1990-06-10",0,0,0,0,"Centroavante",4);
    INSERT INTO jogador VALUES(null,"Rodrigo Nestor","1997-06-20",0,0,0,0,"Meia direita",5);
    INSERT INTO jogador VALUES(null,"Maycke","1990-01-03",0,0,0,0,"Lateral direito",6);

-- time_arbitragem
   INSERT INTO time_arbitragem VALUES(null,0,0,0);
   INSERT INTO time_arbitragem VALUES(null,0,0,0);
   INSERT INTO time_arbitragem VALUES(null,0,0,0);
   INSERT INTO time_arbitragem VALUES(null,0,0,0);
   INSERT INTO time_arbitragem VALUES(null,0,0,0);
   INSERT INTO time_arbitragem VALUES(null,0,0,0);

-- arbitro
   INSERT INTO arbitro VALUES(null,"Central","1991-12-09","Luiz da Silva",1);
   INSERT INTO arbitro VALUES(null,"Bandeirinha","1991-05-09","Gilberto da Silva",1);
   INSERT INTO arbitro VALUES(null,"Bandeirinha","1991-08-09","Anderson da Silva",1);
   INSERT INTO arbitro VALUES(null,"Quarto Arbitro","1991-11-09","João da Silva",1);
   INSERT INTO arbitro VALUES(null,"Central","1991-02-09","Mateus da Silva",2);
   INSERT INTO arbitro VALUES(null,"Central","1991-07-09","Bernardo da Silva",3);


-- partida
	INSERT INTO partida VALUES(null,90,"Flamengo","Vasco",2,0,5,5,62,1,0,0,2,"2024-05-30",1,1);
    INSERT INTO partida VALUES(null,97,"Fluminense","Botafogo",3,0,5,5,66,1,0,0,2,"2024-05-30",1,1);
    INSERT INTO partida VALUES(null,92,"São Paulo","Palmeiras",1,0,5,5,51,1,0,0,2,"2024-05-30",1,1);
    INSERT INTO partida VALUES(null,91,"Fluminense","Flamengo",1,0,5,5,75,1,0,0,2,"2024-06-03",1,1);
    INSERT INTO partida VALUES(null,99,"Vasco","Palmeiras",1,0,5,5,42,1,0,0,2,"2024-06-03",1,1);
    INSERT INTO partida VALUES(null,91,"Botafogo","São Paulo",4,0,5,5,35,1,0,0,2,"2024-06-03",1,1);        

-- time joga partida
	INSERT INTO time_joga_partida VALUES (1,1);
    INSERT INTO time_joga_partida VALUES (2,1);
    
    INSERT INTO time_joga_partida VALUES (3,2);
    INSERT INTO time_joga_partida VALUES (4,2);
    
    INSERT INTO time_joga_partida VALUES (5,3);
    INSERT INTO time_joga_partida VALUES (6,3);
    
    INSERT INTO time_joga_partida VALUES (3,4);
    INSERT INTO time_joga_partida VALUES (1,4);
    
    INSERT INTO time_joga_partida VALUES (2,5);
    INSERT INTO time_joga_partida VALUES (6,5);
    
    INSERT INTO time_joga_partida VALUES (4,6);
    INSERT INTO time_joga_partida VALUES (5,6);
    
    

   

-- UPATES E DELETES
   
   DELETE FROM campeonato WHERE id = 7;
   DELETE FROM tecnico WHERE id = 7;
   DELETE FROM jogador WHERE id = 7;
   DELETE FROM patrocinador WHERE id = 7;
   DELETE FROM arbitro WHERE id > 4;
   
   UPDATE time SET vitorias = 1, derrotas = 1, gols_pro = 2, gols_sofridos = 1, faltas = 10, c_amarelos = 3 WHERE id = 1;
   UPDATE time SET vitorias = 1, derrotas = 1, gols_pro = 1, gols_sofridos = 2, faltas = 10, c_amarelos = 3 WHERE id = 2;
   UPDATE time SET vitorias = 2, derrotas = 0, gols_pro = 4, gols_sofridos = 1, faltas = 10, c_amarelos = 3 WHERE id = 3;
   UPDATE time SET vitorias = 1, derrotas = 1, gols_pro = 4, gols_sofridos = 3, faltas = 10, c_amarelos = 3 WHERE id = 4;
   UPDATE time SET vitorias = 1, derrotas = 1, gols_pro = 1, gols_sofridos = 4, faltas = 10, c_amarelos = 3 WHERE id = 5;
   UPDATE time SET vitorias = 0, derrotas = 2, gols_pro = 0, gols_sofridos = 2, faltas = 10, c_amarelos = 3 WHERE id = 6;
   
   
   UPDATE jogador SET gols = 2 WHERE id = 1;
   UPDATE jogador SET gols = 1 WHERE id = 2;
   UPDATE jogador SET gols = 4 WHERE id = 3;
   UPDATE jogador SET gols = 1 WHERE id = 4;
   UPDATE jogador SET gols = 2 WHERE id = 5;
   
   UPDATE arbitro SET data_nasc = "1990-10-09" WHERE id = 1;
   
   UPDATE patrocinador SET cota = 400000 WHERE id = 1;
   
   UPDATE tecnico SET data_nasc = "1951-11-26" WHERE id = 1;
   
   

   
   