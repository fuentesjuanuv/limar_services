# Parcial 1: Despliegue de Base de Datos y Modelo Relacional (Servicios LiMar)

Este repositorio contiene la solución práctica para el Parcial No. 1 de la asignatura **Bases de Datos (750006-C)** de la **Universidad del Valle**. Aquí se detalla el proceso de despliegue de los contenedores mediante Docker y el diseño físico del modelo relacional para el sistema de turnos de Servicios LiMar.

**Estudiante:** Juan Carlos Fuentes

**Código:** 2027231

## 1. Despliegue de los contenedores (Docker)

Para inicializar el entorno aislado y limpio, se ejecutaron los siguientes comandos en Windows PowerShell:

### Paso 1: Contenedor de PostgreSQL v14
Se levantó el motor de la base de datos con las credenciales asignadas en el examen y el nombre del servicio personalizado:

```powershell
docker run --name limar_service -e POSTGRES_USER=ulimar -e POSTGRES_PASSWORD=ex4men_db -p 5432:5432 -d postgres:14
```

### Paso 2: Contenedor de pgAdmin 4
Se desplegó la interfaz gráfica web y se vinculó a la red del motor mediante la bandera --link:

```powershell
docker run --rm -p 5050:80 --link limar_service:limar_service -e "PGADMIN_DEFAULT_EMAIL=usuario@servilimar.com" -e "PGADMIN_DEFAULT_PASSWORD=limar#123" -d dpage/pgadmin4
```
## 2. Instrucciones y consultas

### Paso 1: Instrucciones del Lenguaje de Definición de Datos (DDL)
Tras conectar pgAdmin al contenedor limar_service y crear la base de datos llamada servilimar, se ejecutaron los siguientes scripts en el Query Tool para crear las tablas físicas.

*Nota: Se implementó la palabra dedicada SERIAL para habilitar llaves primarias autoincrementables y se aplicó una restricción ON DELETE CASCADE para asegurar la integridad referencial.

```sql
-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50) NOT NULL, -- 'Cliente', 'Empleado', 'Proveedor'
    condicion_especial VARCHAR(150),   -- Registra condiciones especiales
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
    estado VARCHAR(50) NOT NULL,      -- 'Asignado', 'Atendido', 'Cancelado'
    CONSTRAINT fk_usuario_turno FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id) ON DELETE CASCADE
);
```

### Paso 2: Instrucciones del Lenguaje de Manipulación de Datos (DML)
Se insertaron estos 10 registros de prueba en las tablas con las necesidades de control de franjas horarias y condiciones especiales de Servicios LiMar:

```sql
INSERT INTO Usuario (nombre, apellido, tipo_usuario, condicion_especial, ciudad_id, codigo_postal) VALUES
('Juan', 'Pérez', 'Cliente', 'Adulto Mayor', 1, '760001'),
('María', 'Gómez', 'Cliente', 'Embarazo', 1, '760002'),
('Carlos', 'Rodríguez', 'Cliente', 'Requiere Silla de Ruedas', 2, '110111'),
('Ana', 'Martínez', 'Cliente', 'Ninguna', 1, '760003'),
('Luis', 'Beltrán', 'Empleado', 'Ninguna', 1, '760004'),
('Diana', 'Toro', 'Empleado', 'Ninguna', 1, '760005'),
('Laura', 'Castro', 'Cliente', 'Ninguna', 3, '050001'),
('Pedro', 'Marín', 'Cliente', 'Adulto Mayor', 1, '760006'),
('Sofía', 'Herrera', 'Cliente', 'Ninguna', 2, '110112'),
('Diego', 'Ruiz', 'Proveedor', 'Ninguna', 1, '760007');

INSERT INTO Turno (usuario_id, servicio_id, nombre_servicio, empleado_id, fecha, hora_inicio, hora_fin, estado) VALUES
(1, 101, 'Despacho', 5, '2026-05-25', '08:00:00', '08:20:00', 'Atendido'),
(2, 102, 'Entrega artículos', 6, '2026-05-25', '08:30:00', '08:50:00', 'Atendido'),
(3, 103, 'Atención al cliente', 5, '2026-05-25', '09:00:00', '09:30:00', 'Asignado'),
(4, 104, 'Consultoría', 6, '2026-05-25', '09:40:00', '10:10:00', 'Asignado'),
(5, 101, 'Despacho', 5, '2026-05-25', '10:20:00', '10:40:00', 'Asignado'),
(6, 102, 'Recepción artículos', 6, '2026-05-25', '11:00:00', '11:20:00', 'Asignado'),
(7, 103, 'Atención al cliente', 5, '2026-05-25', '11:30:00', '12:00:00', 'Cancelado'),
(8, 104, 'Consultoría', 6, '2026-05-26', '08:00:00', '08:30:00', 'Asignado'),
(9, 101, 'Despacho', 5, '2026-05-26', '08:40:00', '09:00:00', 'Asignado'),
(10, 102, 'Entrega artículos', 6, '2026-05-26', '09:10:00', '09:30:00', 'Asignado');
```

### Paso 3: Consultas de comprobación
Comprobamos que se hayan insertado los registros en las tablas correctamente usando:

```sql
SELECT * FROM Usuario;
SELECT * FROM Turno;
```

