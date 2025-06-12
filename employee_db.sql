DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE IF NOT EXISTS employee_db;
use employee_db;
-- SET SESSION sql_mode = 'STRICT_ALL_TABLES';

create table azienda(
id int auto_increment primary key,
codice varchar(125) unique not null,
settore varchar(125) not null
);
-- drop table dipendente;
create table dipendente(
id int auto_increment primary key,
codice int unique not null,
nome varchar(125) not null,
cognome varchar(125) not null,
fk_azienda varchar(125) references azienda(codice)
);
-- drop table versamento;
create table versamento(
id int auto_increment primary key,
fk_dipendente int not null references dipendenete(codice),
importo decimal(10.2)
);

insert into azienda(codice, settore)values('qwerty1','tessile');
insert into azienda(codice, settore)values('qwerty2','tessile');
insert into azienda(codice, settore)values('qwerty3','informatica');
insert into azienda(codice, settore)values('qwerty4','consulenza');
insert into azienda(codice, settore)values('qwerty5','agraria');
insert into azienda(codice, settore)values('qwerty7','ristorazione');
insert into azienda(codice, settore)values('qwerty8','consulenza fiscale');

insert into dipendente(codice, cognome, nome, fk_azienda)values
(132, 'verdi', 'giuseppe', 'qwerty1'),
(456, 'rossi', 'mario', 'qwerty1'),
(789, 'castello', 'silvia', 'qwerty3'),
(147, 'bianco', 'sabatina', 'qwerty4'),
(258, 'zoppetto', 'teresa',  'qwerty2'),
(369, 'mezzetta', 'antonia', 'qwerty5'),
(159, 'addessi', 'miriam', 'qwerty3'),
(101, 'viso', 'filippa', 'qwerty2'),
(106, 'polvere', 'gianni', 'qwerty2');

insert into versamento(fk_dipendente, importo)values
(132, 1520),
(456, 1200),
(789, 1800),
(147, 1640),
(258, 1700),
(369, 1100),
(159, 1520),
(230, 2300);
select *
from dipendente;

select *
from dipendente
where nome = 'giuseppe';

select *
from dipendente
where codice = 132;

select codice, nome, cognome
from dipendente;

select *
from azienda;

select *
from dipendente
where nome like "Mario";

select *
from dipendente
where id = 2;

-- operatore AND , OR, NOT
select *
from dipendente
WHERE NOT id = 2;

select *
from dipendente
WHERE id = 2 OR id = 3;

select *
from dipendente
WHERE id = 2 AND nome like "mario";

select *
from dipendente
WHERE nome like "MARIO";

-- ORDER BY
select nome
from dipendente
order by nome desc;

select nome
from dipendente
order by id;

-- limit
select nome
from dipendente
order by id limit 2;

-- min , max

select  max(codice), nome , cognome
from dipendente
where fk_azienda like "qwerty1";

select  min(codice), nome, cognome
from dipendente
where fk_azienda like "qwerty1";

select  min(codice), max(codice)
from dipendente
where fk_azienda like "qwerty1";

-- COUNT, AVG, SUM
select count(codice)
from azienda
where settore like "tessile";

select AVG(importo)
from versamento;

select SUM(importo)
from versamento;

-- between
select *
from dipendente
where id between 2 and 4;

-- as
select nome as "nome propio"
from dipendente;

-- nome e cognome e importo percepito dai dipendi

select d.nome, d.cognome, v.importo
from dipendente as d inner join versamento as v on d.codice = v.fk_dipendente;

-- nome e cognome e importo percepito dei dipendendi e tipi di azienda per cui lavorano 

select * from dipendente;
select * from azienda;
select * from versamento;
select d.nome,d.cognome,v.importo as importo_accreditato,a.settore
from dipendente as d
join azienda as a on d.fk_azienda= a.codice
join versamento as v on d.codice= v.fk_dipendente;

-- nome e cognome importo percepito dai dipendenti

SELECT *
FROM dipendente d inner join versamento as v on d.codice = v.fk_dipendente;

SELECT *
FROM dipendente d , versamento v
WHERE d.codice = v.fk_dipendente;

-- esempio di case

SELECT*
FROM dipendente d INNER JOIN versamento v
ON d.codice = v.fk_dipendente;

-- caso con discriminante retribuzione e mansione

SELECT
d.nome,
d.cognome,
CASE
	WHEN v.importo >= 1600 THEN 'Manager'
	WHEN v.importo >= 1400 AND v.importo < 1600 THEN 'Senior'
	WHEN v.importo >= 1200 AND v.importo < 1400 THEN 'Junior'
	ELSE 'Trainee'
	END AS qualifica
	FROM dipendente d
	JOIN versamento v ON d.codice = v.fk_dipendente;


SELECT*
FROM azienda AS a INNER JOIN dipendente AS d
ON a.codice = d.fk_azienda;

SELECT*
FROM azienda;
SELECT*
FROM dipendente;
SELECT d.nome , d.cognome
CASE 
   WHEN a.settore LIKE 'tessile' THEN 'produzione'
   WHEN a.settore LIKE  'informatica' THEN 'it'
   WHEN a.settore LIKE 'consulenza' THEN 'servizi'
   ELSE a.settore
   AND AS 'settore aziendale'
   FROM azienda AS a INNER JOIN dipendente AS d
   ON a.codice = d.fk_azienda
   
   -- esempio GROUP BY
   -- conta le aziende per settore
   
   SELECT settore , count(codice)
   FROM azienda 
   GROUP BY settore;
   
     -- numero di dipendenti per azienda - GROUP BY
     
SELECT fk_azienda , COUNT(id) AS numero_dipendenti
FROM dipendente 
GROUP BY fk_azienda;

-- numero di dipendenti per azienda - GROUP BY
-- aziende che hanno un numero di dipendenti maggiore uguale di due
select fk_azienda,count(id) as numero_dipendenti
from dipendente
group by fk_azienda
having numero_dipendenti >=2;

-- trovare i dipendenti con matricola maggiore di 123

SELECT*
FROM dipendenti
WHERE codice > 132; 


-- raggruppare aziende con id maggiore di 132

SELECT *
FROM dipendente
GROUP BY fk_azienda
HAVING codice < 132;

-- numero aziende per settore

SELECT*
FROM azienda
GROUP BY settore;
--
SELECT*
FROM versamento AS v INNER JOIN dipendente d ON v.fk_dipendente = d.codice
INNER JOIN azienda a on d.fk_azienda = a.codice;






