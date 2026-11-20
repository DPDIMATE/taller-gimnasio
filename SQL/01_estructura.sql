
CREATE TABLE socios (
    documento VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100) UNIQUE
);

CREATE TABLE fichas_medicas (
    documento_socio VARCHAR(20) PRIMARY KEY REFERENCES socios(documento),
    peso NUMERIC(5,2),
    estatura NUMERIC(3,2),
    lesiones VARCHAR(255)
);

CREATE TABLE planes (
    id_plan SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    duracion_meses INTEGER NOT NULL,
    precio NUMERIC(10,2) NOT NULL
);

CREATE TABLE membresias (
    id_membresia SERIAL PRIMARY KEY,
    documento_socio VARCHAR(20) NOT NULL REFERENCES socios(documento),
    id_plan INTEGER NOT NULL REFERENCES planes(id_plan),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE entrenadores (
    id_entrenador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    correo VARCHAR(100) UNIQUE
);

CREATE TABLE clases (
    id_clase SERIAL PRIMARY KEY,
    id_entrenador INTEGER NOT NULL REFERENCES entrenadores(id_entrenador),
    nombre VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    hora TIME NOT NULL,
    cupo INTEGER NOT NULL
);

CREATE TABLE inscripciones (
    documento_socio VARCHAR(20) REFERENCES socios(documento),
    id_clase INTEGER REFERENCES clases(id_clase),
    fecha_inscripcion DATE NOT NULL,
    PRIMARY KEY (documento_socio, id_clase)
);
