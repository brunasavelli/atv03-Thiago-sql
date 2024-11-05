-- Criação do banco de dados
CREATE DATABASE hotes_reservas;

-- Entrar no bando de dados
\c hotel_reservas;

-- Criação das tabelas
CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero INT UNIQUE NOT NULL,
    andar INT NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    horario_entrada TIME NOT NULL,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

-- Inserção dos dados
INSERT INTO hospedes (nome, email, cpf) VALUES
('Alejandra', 'alejandra@gmail.com', '111.111.111-11'),
('Bruna', 'bruna@gmail.com', '222.222.222-22'),
('Laura', 'laura@gmail.com', '333.333.333-33'),
('Evelyn', 'evelyn@gmail.com', '444.444.444-44'),
('Ana Carol', 'anaCarol@gmail.com', '555.555.555-55'),
('Felipe Dev', 'felipeDev92@gmail.com', '666.666.666-66'),
('Thiago Dev', 'thigoDev@gmail.com', '777.777.777-77'),
('Maria', 'maria@gmail.com', '888.888.888-88');

INSERT INTO quartos (numero, andar) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2);

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, data_saida, horario_entrada) VALUES
(1, 1, '05-12-2024', '15-12-2024', '08:00'),
(2, 2, '12-12-2024', '29-12-2024', '08:30'),
(3, 3, '28-12-2024', '03-01-2025', '09:00'),
(4, 4, '30-12-2024', '10-01-2025', '10:00'),
(5, 5, '11-01-2025', '20-01-2025', '09:30'),
(6, 6, '24-01-2025', '30-01-2025', '11:00'),
(7, 7, '10-10-2024', '23-10-2024', '12:00'),
(8, 8, '25-10-2024', '30-10-2025', '09:30'),
