
CREATE DATABASE Mecanica
GO

USE Mecanica
GO

CREATE TABLE Categoria (
    ID INT IDENTITY(1,1) PRIMARY KEY, -- ID começa em 1 e incrementa de 1 em 1
    Categoria VARCHAR(100),
    Valor_Hora DECIMAL(4,2)
);

CREATE TABLE Funcionario (
    ID INT IDENTITY(101,1) PRIMARY KEY, -- ID começa em 101 e incrementa de 1 em 1
    Nome VARCHAR(100),
    Logradouro VARCHAR(200),
    Numero INT,
    Telefone CHAR(11),
    Categoria_Habilitacao CHAR(2),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(ID)
);

CREATE TABLE Cliente (
    ID INT IDENTITY(3401,15) PRIMARY KEY, -- ID começa em 3401 e incrementa de 15 em 15
    Nome VARCHAR(100),
    Logradouro VARCHAR(200),
    Numero INT,
    CEP CHAR(8),
    Complemento VARCHAR(255)
);

CREATE TABLE Telefone_Cliente (
    ClienteID INT,
    Telefone VARCHAR(11),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

CREATE TABLE Peca (
    ID INT IDENTITY(3411,7) PRIMARY KEY, -- ID começa em 3411 e incrementa de 7 em 7
    Nome VARCHAR(30),
    Preco DECIMAL(7,2),
    Estoque INT
);

CREATE TABLE Veiculo (
    Placa CHAR(7) PRIMARY KEY,
    Marca VARCHAR(30),
    Modelo VARCHAR(30),
    Cor VARCHAR(15),
    Ano_Fabricacao INT,
    Ano_Modelo INT,
    Data_Aquisicao DATE,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

CREATE TABLE Reparo (
    VeiculoPlaca CHAR(7),
    FuncionarioID INT,
    PecaID INT,
    Data DATE,
    Custo_Total DECIMAL(7,2),
    Tempo INT,
    FOREIGN KEY (VeiculoPlaca) REFERENCES Veiculo(Placa),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(ID),
    FOREIGN KEY (PecaID) REFERENCES Peca(ID)
);
GO

-- Inserindo as categoria
INSERT INTO Categoria (Categoria, Valor_Hora) VALUES ('Estagiário', 16.00);
INSERT INTO Categoria (Categoria, Valor_Hora) VALUES ('Nível 1', 26.00);
INSERT INTO Categoria (Categoria, Valor_Hora) VALUES ('Nível 2', 36.00);
INSERT INTO Categoria (Categoria, Valor_Hora) VALUES ('Nível 3', 51.00);
GO

-- Inserindo funcionário
INSERT INTO Funcionario (Nome, Logradouro, Numero, Telefone, Categoria_Habilitacao, CategoriaID) 
VALUES ('Carlos Silva', 'Rua das Flores', 123, '11988887777', 'B', 1);
GO

-- Inserindo cliente
INSERT INTO Cliente (Nome, Logradouro, Numero, CEP, Complemento) 
VALUES ('Ana Souza', 'Av. Central', 456, '03123456', 'Bloco A');
GO

-- Inserindo telefone do cliente
INSERT INTO Telefone_Cliente (ClienteID, Telefone) 
VALUES (3401, '11977776666');
GO

-- Inserindo peça
INSERT INTO Peca (Nome, Preco, Estoque) 
VALUES ('Filtro de Óleo', 45.90, 15);
GO

-- Inserindo veículo
INSERT INTO Veiculo (Placa, Marca, Modelo, Cor, Ano_Fabricacao, Ano_Modelo, Data_Aquisicao, ClienteID) 
VALUES ('ABC1D23', 'Chevrolet', 'Onix', 'Prata', 2020, 2020, '2022-05-10', 3401);
GO

-- Inserindo reparo
INSERT INTO Reparo (VeiculoPlaca, FuncionarioID, PecaID, Data, Custo_Total, Tempo) 
VALUES ('ABC1D23', 101, 3411, '2026-06-01', 120.00, 2);
GO

-- Consultas para ver se tudo funcionou
SELECT * FROM Reparo
SELECT * FROM Categoria
SELECT * FROM Funcionario
SELECT * FROM Cliente
SELECT * FROM Telefone_Cliente
SELECT * FROM Peca
SELECT * FROM Veiculo

