IF EXISTS (SELECT name FROM sys.databases WHERE name = N'livraria')
BEGIN
    DROP DATABASE livraria;
END
GO

CREATE DATABASE livraria;
GO

USE livraria;
GO

CREATE TABLE Autor (
    ID_Autor INT IDENTITY(2351,1) PRIMARY KEY,
    Nome VARCHAR(100) UNIQUE NOT NULL,
    Data_nasc DATE,
    Pais_Nasc VARCHAR(50) CHECK (Pais_Nasc IN ('Brasil', 'Estados Unidos', 'Inglaterra', 'Alemanha')),
    Biografia VARCHAR(255)
);
GO

CREATE TABLE Livro (
    Codigo INT IDENTITY(100001,100) PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL,
    Lingua VARCHAR(10) DEFAULT 'PT-BR',
    Ano INT CHECK (Ano >= 1990)
);
GO

CREATE TABLE Editora (
    ID_Editora INT IDENTITY(491,16) PRIMARY KEY,
    Nome VARCHAR(70) UNIQUE NOT NULL,
    Telefone VARCHAR(11) CHECK (LEN(Telefone) = 10),
    Logradouro_Endereco VARCHAR(200),
    Numero_Endereco INT CHECK (Numero_Endereco >= 0),
    CEP_Endereco CHAR(8) CHECK (LEN(CEP_Endereco) = 8),
    Complemento_Endereco VARCHAR(255)
);
GO

CREATE TABLE Edicao (
    ISBN CHAR(13) PRIMARY KEY CHECK (LEN(ISBN) = 13),
    Preco DECIMAL(4,2) CHECK (Preco >= 0),
    Ano INT CHECK (Ano >= 1993),
    Numero_Paginas INT CHECK (Numero_Paginas >= 15),
    Qtd_Estoque INT
);
GO

CREATE TABLE Livro_Autor (
    LivroCodigo INT,
    AutorID_Autor INT,
    PRIMARY KEY (LivroCodigo, AutorID_Autor),
    FOREIGN KEY (LivroCodigo) REFERENCES Livro(Codigo),
    FOREIGN KEY (AutorID_Autor) REFERENCES Autor(ID_Autor)
);
GO

CREATE TABLE Editora_Edicao_Livro (
    EditoraID_Editora INT,
    EdicaoISBN CHAR(13),
    LivroCodigo INT,
    PRIMARY KEY (EditoraID_Editora, EdicaoISBN, LivroCodigo),
    FOREIGN KEY (EditoraID_Editora) REFERENCES Editora(ID_Editora),
    FOREIGN KEY (EdicaoISBN) REFERENCES Edicao(ISBN),
    FOREIGN KEY (LivroCodigo) REFERENCES Livro(Codigo)
);
GO

SELECT * FROM Autor;
SELECT * FROM Livro;
SELECT * FROM Editora;
SELECT * FROM Edicao;
SELECT * FROM Livro_Autor;
SELECT * FROM Editora_Edicao_Livro;