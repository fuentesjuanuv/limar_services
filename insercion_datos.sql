-- Inserción de 10 registros en Usuario
INSERT INTO Usuario (nombre, apellido, tipo_usuario, condiciones, ciudad_id, codigo_postal) VALUES
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

-- Inserción de 10 registros en Turno
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
