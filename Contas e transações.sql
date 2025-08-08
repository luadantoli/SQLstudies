CREATE TABLE contas (
    id_conta INT IDENTITY PRIMARY KEY,
    nome_conta VARCHAR (100) NOT NULL,
    tipo_conta VARCHAR(50),
    saldo DECIMAL(12,2) DEFAULT 0.00

);

CREATE TABLE transacoes (
    id_transacao INT IDENTITY(1,1) PRIMARY KEY,
    data_transacao DATE NOT NULL,
    valor DECIMAL(12,2) NOT NULL,
    id_origem INT,
    id_destino INT,
    descrição TEXT,
    FOREIGN KEY (id_origem) REFERENCES contas(id_conta),
    FOREIGN KEY (id_destino) REFERENCES contas(id_conta)

);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

ALTER TABLE transações ADD id_categoria INT;
ALTER TABLE transações ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

INSERT INTO contas (nome_conta, tipo_conta, saldo)
VALUES ('Conta Corrente Banco A', 'corrente', 1500.00),
       ('Cartão de Crédito', 'cartão', 0.00);
INSERT INTO categorias (nome_categoria)
VALUES ('Aluguel'), ('Salário'), ('Transferência');

INSERT INTO transações (data_transação, valor, id_origem, id_destino, id_categoria)
VALUES ('2025-08-07', 1200.00, 1, 2, 'Pagamento do aluguel via Pix',1)

SELECT i.id_transação, t.data_transação, t.valor, cl.nome_conta AS origem, c2.nome_conta AS destino, cat.nome_categoria, t.descrição
FROM transaçõea t 
JOIN contas c1 ON t.id_origem = c1.id_conta
JOIN contas c2 ON t.id_destino = c2.id_conta
LEFT JOIN categorias cat ON t.id_categoria = cat.id_categoria;

SELECT MONTH(data_transação) AS mês, SUM(valor) AS total
FROM transações
GROUP BY MONTH(data_transação);
