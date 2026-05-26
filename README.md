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
Tras conectar pgAdmin al contenedor limar_service y crear la base de datos llamada servilimar, se ejecutaron los scripts necesarios en el Query Tool para crear las tablas físicas.

Nota: Se implementó la palabra dedicada SERIAL para habilitar llaves primarias autoincrementables y se aplicó una restricción ON DELETE CASCADE para asegurar la integridad referencial.

### Paso 2: Instrucciones del Lenguaje de Manipulación de Datos (DML)
Se insertaron 10 registros de prueba en las tablas con las necesidades de control de franjas horarias y condiciones especiales de Servicios LiMar

### Paso 3: Consultas de comprobación
Comprobamos que se hayan insertado los registros en las tablas correctamente usando:

```powershell
SELECT * FROM Usuario;
SELECT * FROM Turno;
```

