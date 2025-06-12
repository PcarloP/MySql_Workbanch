drop database if exists scuola_db;
create database if not exists scuola_db;
use scuola_db;
set session sql_mode= 'strict_all_tables';
set default_storage_engine = INNODB;

-- Tabella STUDENTE
CREATE TABLE STUDENTE (

    id INT AUTO_INCREMENT PRIMARY KEY,
    CodiceStudente VARCHAR(20) UNIQUE NOT NULL,
    CognomeStudente VARCHAR(50) NOT NULL,
    NomeStudente VARCHAR(50) NOT NULL,
    Classe VARCHAR(10) NOT NULL,
    Sezione VARCHAR(5) NOT NULL,
    DataNascita DATE NOT NULL
    
)engine=innidb;

-- Tabella MATERIA
CREATE TABLE MATERIA (

    id INT AUTO_INCREMENT PRIMARY KEY,
    CodiceMateria VARCHAR(20) UNIQUE NOT NULL,
    Materia VARCHAR(100) NOT NULL

);

-- Tabella VOTI

CREATE TABLE VOTI (

    id INT AUTO_INCREMENT PRIMARY KEY,
    DataVoto DATE NOT NULL,
    CodiceStudente VARCHAR(20) NOT NULL,
    CodiceMateria VARCHAR(20) NOT NULL,
    Voto INT NOT NULL,
    UNIQUE (DataVoto, CodiceStudente, CodiceMateria),
    FOREIGN KEY (CodiceStudente) REFERENCES STUDENTE(CodiceStudente),
    FOREIGN KEY (CodiceMateria) REFERENCES MATERIA(CodiceMateria)

);

-- Popolamento della tabella STUDENTE

INSERT INTO STUDENTE (CodiceStudente, CognomeStudente, NomeStudente, Classe, Sezione, DataNascita)

VALUES 

('S001', 'Rossi', 'Luca', '3A', 'A', '2006-05-15'),
('S002', 'Bianchi', 'Anna', '3A', 'A', '2006-09-10'),
('S003', 'Verdi', 'Marco', '3B', 'B', '2006-01-20'),
('S004', 'Neri', 'Sara', '3B', 'B', '2006-03-12'),
('S005', 'Gialli', 'Francesca', '3C', 'C', '2006-07-25'),
('S006', 'Blu', 'Simone', '3C', 'C', '2006-12-01'),
('S007', 'Viola', 'Laura', '3A', 'A', '2006-11-08'),
('S008', 'Marrone', 'Giulia', '3B', 'B', '2006-06-30'),
('S009', 'Rosa', 'Antonio', '3A', 'A', '2006-02-18'),
('S010', 'Grigi', 'Chiara', '3C', 'C', '2006-08-22'),
('S011', 'Argento', 'Giorgio', '3A', 'A', '2006-10-10'),
('S012', 'Bronzo', 'Elena', '3B', 'B', '2006-04-16'),
('S013', 'Azzurri', 'Mattia', '3A', 'A', '2006-09-28'),
('S014', 'Dorati', 'Giovanni', '3B', 'B', '2006-03-03'),
('S015', 'Castani', 'Federica', '3C', 'C', '2006-01-05'),
('S016', 'Turchese', 'Riccardo', '3A', 'A', '2006-07-19'),
('S017', 'Beige', 'Sofia', '3B', 'B', '2006-05-09'),
('S018', 'Indaco', 'Marta', '3A', 'A', '2006-12-12'),
('S019', 'Oliva', 'Paolo', '3C', 'C', '2006-02-27'),
('S020', 'Ciano', 'Martina', '3B', 'B', '2006-10-31'),
('S021', 'Maradona', 'Diego', '4C', 'C', '2004-08-22'),
('S022', 'Lavezzi', 'Pocho', '4A', 'A', '2005-10-10'),
('S023', 'Argento', 'Giulia', '4B', 'B', '2007-04-16'),
('S024', 'Marino', 'Giuseppe', '4A', 'A', '2007-09-28'),
('S025', 'Verdi', 'Giovanni', '4B', 'B', '2007-03-03'),
('S026', 'Bianchi', 'Federica', '4C', 'C', '2007-01-05'),
('S027', 'Ciano', 'Riccardo', '4A', 'A', '2007-07-19'),
('S028', 'Rossi', 'Sofia', '4B', 'B', '2007-05-09'),
('S029', 'Gialli', 'Marta', '4A', 'A', '2007-12-12'),
('S030', 'Bruni', 'Paolo', '4C', 'C', '2007-02-27'),
('S031', 'Castagna', 'Martina', '4B', 'B', '2007-10-31');


-- Popolamento della tabella MATERIA

INSERT INTO MATERIA (CodiceMateria, Materia)

VALUES 

('M001', 'Matematica'),
('M002', 'Italiano'),
('M003', 'Inglese'),
('M004', 'Storia'),
('M005', 'Geografia'),
('M006', 'Scienze'),
('M007', 'Fisica'),
('M008', 'Chimica'),
('M009', 'Educazione Fisica'),
('M010', 'Arte'),
('M011', 'Musica'),
('M012', 'Religione'),
('M013', 'Tecnologia'),
('M014', 'Informatica'),
('M015', 'Filosofia'),
('M016', 'Economia'),
('M017', 'Diritto'),
('M018', 'Latino'),
('M019', 'Greco'),
('M020', 'Spagnolo');

-- Popolamento della tabella VOTI

INSERT INTO VOTI (DataVoto, CodiceStudente, CodiceMateria, Voto)

VALUES 

('2025-01-01', 'S001', 'M001', 8),
('2025-01-02', 'S002', 'M002', 7),
('2025-01-03', 'S003', 'M003', 9),
('2025-01-04', 'S004', 'M004', 6),
('2025-01-05', 'S005', 'M005', 5),
('2025-01-06', 'S006', 'M006', 8),
('2025-01-07', 'S007', 'M007', 7),
('2025-01-08', 'S008', 'M008', 6),
('2025-01-09', 'S009', 'M009', 10),
('2025-01-10', 'S010', 'M010', 4),
('2025-01-11', 'S011', 'M011', 8),
('2025-01-12', 'S012', 'M012', 9),
('2025-01-13', 'S013', 'M013', 7),
('2025-01-14', 'S014', 'M014', 6),
('2025-01-15', 'S015', 'M015', 5),
('2025-01-16', 'S016', 'M016', 8),
('2025-01-17', 'S017', 'M017', 6),
('2025-01-18', 'S018', 'M018', 7),
('2025-01-19', 'S019', 'M019', 9),
('2025-01-20', 'S020', 'M020', 8),
('2025-01-18', 'S001', 'M018', 7),
('2025-01-19', 'S002', 'M019', 9),
('2025-01-20', 'S003', 'M020', 8);

CREATE TABLE Users (

    id INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    username VARCHAR(50),
    password VARCHAR(50),
    ssn VARCHAR(11)

);


INSERT INTO Users (id, firstname, lastname, username, password, ssn) VALUES

(1, 'Alice', 'Smith', 'alice.s', 'alice123', '123-45-6789'),
(2, 'Bob', 'Johnson', 'bob.j', 'qwerty', '987-65-4321'),
(3, 'Charlie', 'Brown', 'charlie.b', 'letmein', '111-22-3333'),
(4, 'Diana', 'Evans', 'diana.e', 'hunter2', '222-33-4444'),
(5, 'Ethan', 'Williams', 'ethan.w', 'abc123', '333-44-5555'),
(6, 'Fiona', 'Clark', 'fiona.c', 'passw0rd', '444-55-6666'),
(7, 'George', 'Lee', 'george.l', 'iloveyou', '555-66-7777'),
(8, 'Hannah', 'Walker', 'hannah.w', 'letmein1', '666-77-8888'),
(9, 'Ian', 'Hall', 'ian.h', 'trustno1', '777-88-9999'),
(10, 'Julia', 'Allen', 'julia.a', 'welcome', '888-99-0000'),
(11, 'Kevin', 'Young', 'kevin.y', 'shadow', '111-11-1111'),
(12, 'Laura', 'Scott', 'laura.s', 'sunshine', '222-22-2222'),
(13, 'Martin', 'Green', 'martin.g', 'dragon', '333-33-3333'),
(14, 'Nina', 'Adams', 'nina.a', 'baseball', '444-44-4444'),
(15, 'Oscar', 'Baker', 'oscar.b', 'football', '555-55-5555'),
(16, 'Paula', 'Campbell', 'paula.c', 'monkey', '666-66-6666'),
(17, 'Quentin', 'Mitchell', 'quentin.m', 'abcABC123', '777-77-7777'),
(18, 'Rachel', 'Perry', 'rachel.p', 'password1', '888-88-8888'),
(19, 'Steven', 'Turner', 'steven.t', 'admin123', '999-99-9999'),
(20, 'Tina', 'Reed', 'tina.r', 'pass1234', '000-00-0000');


-- 1 cognome e nome e classe degli stundenti che hanno ottenuto voti inferiori da 1 a 5
 
SELECT *
FROM studente;
SELECT *
FROM voti;

SELECT s.cognomestudente , s.nomestudente , s.classe
FROM studente AS s INNER JOIN voti AS v
ON s.codicestudente = v.codicestudente
WHERE v.voto < 5;


-- 2. Media dei voti di inglese di uno studente di cui si conosce il nome

SELECT AVG(v.voto) AS mediavoti_inglese
FROM studente AS s INNER JOIN voti AS v
ON s.codicestudente = v.codicestudente
INNER JOIN materia AS m ON v.codicemateria = m.codicemateria
WHERE materia LIKE "inglese" ;


   -- 3. Miglior voto di matematica nella classe terza

SELECT s.nomestudente , s.cognomestudente ,max(v.voto) AS "miglior voto"
FROM studente AS s INNER JOIN voti AS v
ON s.codicestudente = v.codicestudente
INNER JOIN materia AS m ON v.codicemateria = m.codicemateria
WHERE materia LIKE "matematica" AND s.classe LIKE "3%";

   
-- 4. Miglior voto e peggior voto di uno studente di cui si conosce il codice
SELECT *
FROM studente;
SELECT *
FROM voti;

SELECT MAX(voto) AS "votoMassimo" , MIN(voto) AS "votoMinimo"
FROM voti 
WHERE codicestudente LIKE "S020";

-- 5. Elenco alfabetico di tutti gli studenti con cognome, nome e numero delle prove sufficienti in una determinata materia

SELECT s.cognomestudente, s.nomestudente  , COUNT(v.voto) AS "materie sufficienti"
FROM studente AS s INNER JOIN voti AS v
ON s.codicestudente = v.codicestudente
WHERE v.voto >= 6
GROUP BY s.codicestudente
ORDER BY s.cognomestudente , s.nomestudente;

-- 6. Per ciascuna materia la descrizione e il numero delle prove svolte nel periodo tra 5 gennaio e il 30 gennaio

SELECT *
FROM materia ,voti;

SELECT  m.materia AS"descrizione",COUNT(v.id) AS "numero prove"
FROM materia AS m INNER JOIN voti AS v
ON m.codicemateria = v.codicemateria
WHERE v.datavoto BETWEEN"2025-01-05" AND "2025-01-30"
GROUP BY m.materia;


-- 8. conteggio degli esami di ciascuna materia per ogni studente

SELECT s.cognomestudente , s.nomestudente ,
SUM(CASE WHEN m.Materia = 'Matematica' THEN 1 ELSE 0 END) AS Matematica,
SUM(CASE WHEN m.Materia = 'Italiano' THEN 1 ELSE 0 END) AS Italiano,
SUM(CASE WHEN m.Materia = 'Inglese' THEN 1 ELSE 0 END) AS Inglese,
SUM(CASE WHEN m.Materia = 'Storia' THEN 1 ELSE 0 END) AS Storia,
SUM(CASE WHEN m.Materia = 'Geografia' THEN 1 ELSE 0 END) AS Geografia,
SUM(CASE WHEN m.Materia = 'Scienze' THEN 1 ELSE 0 END) AS Scienze,
SUM(CASE WHEN m.Materia = 'Fisica' THEN 1 ELSE 0 END) AS Fisica,
SUM(CASE WHEN m.Materia = 'Chimica' THEN 1 ELSE 0 END) AS Chimica,
SUM(CASE WHEN m.Materia = 'Educazione Fisica' THEN 1 ELSE 0 END) AS Educazione_Fisica,
SUM(CASE WHEN m.Materia = 'Arte' THEN 1 ELSE 0 END) AS Arte,
SUM(CASE WHEN m.Materia = 'Musica' THEN 1 ELSE 0 END) AS Musica,
SUM(CASE WHEN m.Materia = 'Religione' THEN 1 ELSE 0 END) AS Religione,
SUM(CASE WHEN m.Materia = 'Tecnologia' THEN 1 ELSE 0 END) AS Tecnologia,
SUM(CASE WHEN m.Materia = 'Informatica' THEN 1 ELSE 0 END) AS Informatica,
SUM(CASE WHEN m.Materia = 'Filosofia' THEN 1 ELSE 0 END) AS Filosofia,
SUM(CASE WHEN m.Materia = 'Economia' THEN 1 ELSE 0 END) AS Economia,
SUM(CASE WHEN m.Materia = 'Diritto' THEN 1 ELSE 0 END) AS Diritto,
SUM(CASE WHEN m.Materia = 'Latino' THEN 1 ELSE 0 END) AS Latino,
SUM(CASE WHEN m.Materia = 'Greco' THEN 1 ELSE 0 END) AS Greco,
SUM(CASE WHEN m.Materia = 'Spagnolo' THEN 1 ELSE 0 END) AS Spagnolo


FROM studente AS s INNER JOIN voti AS v 
ON s.codicestudente = v.codicestudente
INNER JOIN materia AS m 
ON v.codicemateria = m.codicemateria
GROUP BY s.cognomestudente , s.nomestudente
ORDER BY s.cognomestudente , s.nomestudente;

-- 1. Cognome, nome e classe degli studenti che hanno ottenuto voti inferiori a 5 in una certa materia

select s.CognomeStudente, s.NomeStudente, s.Classe, m.materia ,v.voto
from studente s
join voti v on s.CodiceStudente = v.CodiceStudente
join materia as m on m.codicemateria = v.codicemateria
where v.voto <5;


-- 10. Cognome e nome degli studenti di una classe che hanno la media dei voti di tutte le prove inferiore alla media dei voti di tutte le prove dell’intera classe
select s.codicestudente,s.cognomestudente, s.nomestudente, avg(v.voto) as Media_voti_studente
from studente as s
inner join voti as v on s.codicestudente=v.codicestudente
group by s.codicestudente
having Media_voti_studente <=all(select avg(v.voto) as Media_voti_studente
from studente as s
inner join voti as v on s.codicestudente=v.codicestudente
group by s.codicestudente);select avg(v.voto) as Media_voti_studente
from studente as s
inner join voti as v on s.codicestudente=v.codicestudente;select avg(voto) as media_voti_scuola
from voti;select s.codicestudente,s.cognomestudente, s.nomestudente, avg(v.voto) as Media_voti_studente
from studente as s
inner join voti as v on s.codicestudente=v.codicestudente
group by s.codicestudente
having Media_voti_studente <=all(select avg(voto) as media_voti_scuola
from voti);





