INSERT INTO planes (nombre, duracion_meses, precio)
VALUES
('Mensual', 1, 80000),
('Trimestral', 3, 210000),
('Semestral', 6, 390000);
INSERT INTO socios (documento, nombre, telefono, correo)
VALUES
('1001', 'Laura Martinez', '5559999', 'laura@gmail.com'),
('1002', 'Carlos Ramirez', '5551002', 'carlos@gmail.com'),
('1003', 'Ana Torres', '5551003', NULL),
('1004', 'Pedro Gomez', '5551004', 'pedro@gmail.com'),
('1005', 'Maria Lopez', '5551005', 'maria@gmail.com'),
('1006', 'Juan Herrera', '5551006', 'juan@gmail.com');
INSERT INTO fichas_medicas (documento_socio, peso, estatura, lesiones)
VALUES
('1001', 65.50, 1.63, 'Ninguna'),
('1002', 78.00, 1.75, 'Lesion de rodilla'),
('1003', 59.20, 1.60, 'Ninguna'),
('1004', 82.30, 1.80, 'Dolor de espalda');
INSERT INTO entrenadores (nombre, especialidad, correo)
VALUES
('Andres Perez', 'Musculacion', 'andres@gmail.com'),
('Sofia Morales', 'Yoga', 'sofia@gmail.com'),
('David Castro', 'Entrenamiento funcional', 'david@gmail.com');
INSERT INTO clases (id_entrenador, nombre, dia_semana, hora, cupo)
VALUES
(1, 'Yoga', 'Lunes', '08:00', 3),
(2, 'Musculacion', 'Martes', '10:00', 20),
(2, 'Spinning', 'Miercoles', '17:00', 10),
(2, 'Entrenamiento funcional', 'Viernes', '18:00', 12);
INSERT INTO membresias (documento_socio, id_plan, fecha_inicio, fecha_fin)
VALUES
('1001', 1, '2025-01-01', '2025-02-01'),
('1001', 2, '2025-02-02', '2025-05-02'),
('1001', 3, '2026-10-01', '2027-04-01'),
('1002', 1, '2026-11-01', '2026-12-01'),
('1003', 2, '2026-09-01', '2026-12-01'),
('1004', 1, '2026-10-15', '2026-11-15'),
('1005', 3, '2026-08-01', '2027-02-01'),
('1006', 1, '2026-11-10', '2026-12-10');
-- Registrar una membresia duplicada por error
INSERT INTO membresias (documento_socio, id_plan, fecha_inicio, fecha_fin)
VALUES ('1006', 1, '2026-11-10', '2026-12-10');
INSERT INTO inscripciones (documento_socio, id_clase, fecha_inscripcion)
VALUES
('1001', 1, '2026-10-01'),
('1001', 2, '2026-10-02'),
('1002', 1, '2026-10-03'),
('1002', 3, '2026-10-04'),
('1003', 2, '2026-10-05'),
('1003', 4, '2026-10-06'),
('1004', 1, '2026-10-07'),
('1004', 3, '2026-10-08'),
('1005', 2, '2026-10-09'),
('1005', 4, '2026-10-10');