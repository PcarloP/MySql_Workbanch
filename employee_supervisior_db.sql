DROP DATABASE IF EXISTS inc_db;
CREATE DATABASE inc_db;
USE inc_db;

CREATE TABLE employee(
id int(11) auto_increment primary key,
matricola varchar(4) not null unique,
nome varchar(255) not null,
cognome varchar(255) not null,
eta int(3) not null,
stipendio decimal(11, 2)
);

CREATE TABLE supervisor(
id int(11) auto_increment primary key,
employee_id varchar(4) not null references employee(matricola),
supervisor_id varchar(4) not null references employee(matricola),
unique (employee_id, supervisor_id)
);

INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('7309', 'Rossi', 'Paolo', 35, 45600.30);
INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('5998', 'Bianchi', 'Luca', 37, 38250.50);
INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('9553', 'Neri', 'Andrea', 42, 35150.57);
INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('5698', 'Bruni', 'Luigi', 43, 42400.00);
INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('4076', 'Mori', 'Anna', 45, 50000.00);
INSERT INTO employee(matricola, nome, cognome, eta, stipendio) VALUES ('8123', 'Lupi', 'Giovanni', 46, 60400.80);

INSERT INTO supervisor(employee_id, supervisor_id) VALUES ('7309', '5698');
INSERT INTO supervisor(employee_id, supervisor_id) VALUES ('5998', '5698');
INSERT INTO supervisor(employee_id, supervisor_id) VALUES ('9553', '4076');
INSERT INTO supervisor(employee_id, supervisor_id) VALUES ('5698', '4076');
INSERT INTO supervisor(employee_id, supervisor_id) VALUES ('4076', '8123');



-- Trovare tutti gli impiegati che guadagnano piu' di 40k euro.

SELECT *
FROM employee,supervisor;

SELECT *
FROM employee
WHERE stipendio > 40000.00;

--  Trovare matricola, nome, cognome ed eta degli impiegati che guadagnano piu' di 40k euro


select matricola,nome, cognome, stipendio
from employee
where stipendio > 40000.00;

-- Trovare le matricole dei capi degli impiegati che guadagnano piu' di 40k euro

Select s.supervisor_id
from employee AS e INNER JOIN supervisor AS s
ON e.matricola = s.employee_id
WHERE e.stipendio > 40000;

-- Trovare nome e stipenidio dei capi degli impiegati che guadagnano piu' di 40k

SELECT es.matricola ,es.nome,es.cognome,es.stipendio
FROM employee AS e INNER JOIN supervisor AS s 
ON e.matricola = s.employee_id
INNER JOIN employee AS es 
ON s.supervisor_id = es.matricola
WHERE e.stipendio > 40000;


-- trovare gli impieagati che guadagnano piu' del proprio capo 
-- mostrando matricola nome, cognme e stipendio dell'impiegto e del capo

select e.matricola, e.cognome, e.stipendio, s.matricola, s.nome,s.cognome,s.eta,s.stipendio
from employee e
JOIN supervisor s on e.matricola = s.employee_id
JOIN employee es on es.matricola = s.supervisor_id
where e.stipendio> s.stipendio;

-- 10. Cognome e nome degli studenti di una classe che hanno la media dei voti di tutte le prove 
-- inferiore alla media dei voti di tutte le prove dell’intera classe


SELECT *
FROM studenti ;











