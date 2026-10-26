
DROP DATABASE IF EXISTS clinica;
GO

CREATE DATABASE clinica; -- nome banco de dados
GO

USE clinica;
GO

CREATE TABLE especialidade (
    ID int PRIMARY KEY, 
    especialidade varchar(100)
);

CREATE TABLE paciente (
    num_Bene int PRIMARY KEY, 
    Nome varchar(100), 
    logradouro varchar(200), 
    num int, 
    cep char(8), 
    comp varchar(255), 
    tel char(11)
);

CREATE TABLE medico (
    ID int PRIMARY KEY, 
    Nome varchar(100), 
    logradouro varchar (200), 
    num int, 
    cep char (8), 
    comple varchar(255), 
    cont varchar(11),
    dia_semana_atend varchar (60),
    ID_espec int,
    CONSTRAINT FK_medico_espec FOREIGN KEY (ID_espec) REFERENCES especialidade (ID)
);

CREATE TABLE consulta ( 
    data_hora datetime, 
    observacao varchar(200), 
    num_Bene int, 
    ID_medico int,
    CONSTRAINT FK_consulta_paciente FOREIGN KEY (num_Bene) REFERENCES paciente(num_Bene),
    CONSTRAINT FK_consulta_medico FOREIGN KEY (ID_medico) REFERENCES medico (ID)
);
GO


INSERT INTO especialidade (ID, especialidade) VALUES
('1', 'Otorrinolaringologista'),
('2', 'Urologista'),
('3', 'Geriatra');

INSERT INTO paciente (num_Bene, Nome, logradouro, num, cep, comp, tel) VALUES
('99901', 'Washington Silva', 'R.Anhaia', '150', '02345000', 'Casa', '922229999'),
('99902', 'Luis Ricardo', 'R. Voluntários da Pátria', '2251', '03254010', 'Bloco B. Apto 25', '923450987'),
('99903', 'Maria Elisa', 'AV. Aguia de Haia', '1188', '06987020', 'Apto 1208', '912348765'),
('99904', 'José Araujo', 'R. XV de Novembro', '18', '03678000', 'Casa', '945674312'),
('99905', 'Joana Paula', 'R. 7 de Abril', '97', '01214000', 'Conjunto 3 - Apto 801', '912095674');

INSERT INTO medico (ID,dia_semana_atend, Nome, logradouro, num, cep, comple, cont, ID_espec) VALUES
('100001','2° feira', 'Ana Paula', 'R. 7 de Setembro', '256', '03698000', 'Casa', '915689456', '1'),
('100002','4° feira', 'Maria Aparecida', 'AV. Brasil', '32', '02145070', 'Casa', '923235454', '1'),
('100003', '2° feira','Lucas Borges', 'Av. do Estado', '3210', '05241000', 'Apto205', '963698585', '2'),
('100004', '5° feira', 'Gabriel Oliveira', 'Av. Dom Helder Camara', '350', '03145000', 'Apto 602', '932458745', '3');

INSERT INTO consulta (num_Bene, ID_medico, data_hora, observacao) VALUES
('99901', '100002', '2021-09-04 13:20', 'Infecção Urina'),
('99902', '100003', '2021-09-04 13:15', 'Gripe'),
('99901', '100001', '2021-09-04 12:30', 'Infecção Garganta');
GO

UPDATE medico
SET logradouro = 'Av. Bras Leme',
    num = 876,
    comple = 'apto 504',
    cep = '02122000'
WHERE Nome = 'Lucas Borges';

SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM especialidade;
SELECT * FROM consulta;

