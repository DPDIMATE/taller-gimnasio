-- 1. Fichas medicas: eliminar la ficha si se elimina el socio
ALTER TABLE fichas_medicas
DROP CONSTRAINT fichas_medicas_documento_socio_fkey;

ALTER TABLE fichas_medicas
ADD CONSTRAINT fichas_medicas_documento_socio_fkey
FOREIGN KEY (documento_socio)
REFERENCES socios(documento)
ON DELETE CASCADE;

-- 2. Inscripciones: eliminar las inscripciones si se elimina el socio
ALTER TABLE inscripciones
DROP CONSTRAINT inscripciones_documento_socio_fkey;

ALTER TABLE inscripciones
ADD CONSTRAINT inscripciones_documento_socio_fkey
FOREIGN KEY (documento_socio)
REFERENCES socios(documento)
ON DELETE CASCADE;

-- Consultar las reglas de eliminacion
SELECT constraint_name, delete_rule
FROM information_schema.referential_constraints
ORDER BY constraint_name;