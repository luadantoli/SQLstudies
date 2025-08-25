CREATE TABLE pacientes (
    id_paciente INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER,
    sexo TEXT,
    cidade TEXT
);

CREATE TABLE exames (
    id_exame INTEGER PRIMARY KEY,
    id_paciente INTEGER,
    tipo_exame TEXT,
    data_exame DATE,
    resultado REAL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

CREATE TABLE consultas (
    id_consulta INTEGER PRIMARY KEY,
    id_paciente INTEGER,
    especialidade TEXT,
    data_consulta DATE,
    observacoes TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);
