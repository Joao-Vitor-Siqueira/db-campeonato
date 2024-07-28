CREATE ROLE 'Admin';
CREATE ROLE 'Senior';
CREATE ROLE 'Pleno';
CREATE ROLE 'Junior';

-- Role Admin (Acesso total)
GRANT ALL PRIVILEGES ON *.* TO 'Admin';

-- Role Senior (Acesso ao banco)
GRANT ALL PRIVILEGES ON `dbcampeonato`.* TO 'Senior';

-- Role Pleno (Acesso a tabela times)
GRANT ALL PRIVILEGES ON `dbcampeonato`.`time` TO 'Pleno';

-- Role Junior (Permissao de leitura)
GRANT SELECT ON `dbcampeonato`.* TO 'Junior';

-- Usuários
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT 'Admin' TO 'admin'@'%';

CREATE USER 'senior1'@'%' IDENTIFIED BY 'password';
GRANT 'Senior' TO 'senior1'@'%';

CREATE USER 'senior2'@'%' IDENTIFIED BY 'password';
GRANT 'Senior' TO 'senior2'@'%';

CREATE USER 'pleno'@'%' IDENTIFIED BY 'password';
GRANT 'Pleno' TO 'pleno'@'%';

CREATE USER 'junior1'@'%' IDENTIFIED BY 'password';
GRANT 'Junior' TO 'junior1'@'%';

CREATE USER 'junior2'@'%' IDENTIFIED BY 'password';
GRANT 'Junior' TO 'junior2'@'%';


SET DEFAULT ROLE 'Admin' TO 'admin'@'%';
SET DEFAULT ROLE 'Senior' TO 'senior1'@'%';
SET DEFAULT ROLE 'Senior' TO 'senior2'@'%';
SET DEFAULT ROLE 'Pleno' TO 'pleno'@'%';
SET DEFAULT ROLE 'Junior' TO 'junior1'@'%';
SET DEFAULT ROLE 'Junior' TO 'junior2'@'%';




