INSERT INTO socios
(documento, nombre, telefono, correo, acepta_whatsapp)
VALUES
('1007', 'Sofia Ramirez', '3001001007', NULL, 'si'),
('1008', 'Miguel Torres', '3001001008', 'miguel@gmail.com', 'no');

INSERT INTO membresias
(documento_socio, id_plan, fecha_inicio, fecha_fin, valor_pagado)
VALUES
('1007', 1, '2026-11-01', '2026-12-01', 75000),
('1007', 2, '2026-11-10', '2027-02-10', 195000),
('1007', 3, '2026-12-01', '2027-06-01', 390000),
('1008', 1, '2026-10-01', '2026-11-01', 80000),
('1002', 2, '2026-11-03', '2027-02-03', 210000),
('1006', 1, '2026-11-15', '2026-12-15', 80000);

INSERT INTO inscripciones
(documento_socio, id_clase, fecha_inscripcion)
VALUES
('1007', 2, CURRENT_DATE),
('1008', 2, CURRENT_DATE),
('1007', 4, CURRENT_DATE),
('1001', 4, CURRENT_DATE);

SELECT * FROM socios
WHERE documento IN ('1007', '1008');

SELECT * FROM membresias
WHERE documento_socio IN ('1007', '1008', '1002', '1006')
ORDER BY documento_socio, fecha_inicio;

SELECT * FROM inscripciones
WHERE documento_socio IN ('1007', '1008', '1001');