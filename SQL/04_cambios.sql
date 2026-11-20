-- Agregar estado a la tabla clases
ALTER TABLE clases
ADD COLUMN estado VARCHAR(20) NOT NULL DEFAULT 'activa';

-- Restringir los valores permitidos
ALTER TABLE clases
ADD CONSTRAINT chk_estado_clase
CHECK (estado IN ('activa', 'suspendida'));
-- Agregar estado a la tabla clases
ALTER TABLE clases
ADD COLUMN estado VARCHAR(20) NOT NULL DEFAULT 'activa';

-- Restringir los valores permitidos
ALTER TABLE clases
ADD CONSTRAINT chk_estado_clase
CHECK (estado IN ('activa', 'suspendida'));