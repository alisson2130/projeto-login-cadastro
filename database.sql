-- Criação do Banco de Dados
CREATE DATABASE meu_projeto_db;
USE meu_projeto_db;

-- Tabela de Perfis/Níveis de Acesso (Ex: Admin, Usuário Padrão)
CREATE TABLE perfis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_perfil VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de Usuários (Base para Login e Cadastro)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL, -- Guardará o hash da senha
    perfil_id INT DEFAULT 2,     -- Padrão: Usuário Comum
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (perfil_id) REFERENCES perfis(id) ON DELETE SET NULL
);

-- Inserção de dados iniciais obrigatórios
INSERT INTO perfis (nome_perfil) VALUES ('Administrador'), ('Usuario');