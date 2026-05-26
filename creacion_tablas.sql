-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50) NOT NULL,
    condicion_especial VARCHAR(150),
    ciudad_id INT NOT NULL,
    codigo_postal VARCHAR(20)
);

-- Creación de la tabla Turno
CREATE TABLE Turno (
    turno_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_id INT NOT NULL,
    nombre_servicio VARCHAR(100) NOT NULL,
    empleado_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT fk_usuario_turno FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id) ON DELETE CASCADE
);
