# Parcial 1: Despliegue de Base de Datos y Modelo Relacional (Servicios LiMar)

Este repositorio contiene la solución práctica para el Parcial No. 1 de la asignatura **Bases de Datos (750006-C)** de la **Universidad del Valle**. Aquí se detalla el proceso de despliegue de los contenedores mediante Docker y el diseño físico del modelo relacional para el sistema de turnos de Servicios LiMar.

**Estudiante:** Juan Carlos Fuentes

**Código:** 2027231

## 1. Despliegue de los contenedores (Docker)

Para inicializar el entorno aislado y limpio, se ejecutaron los siguientes comandos en Windows PowerShell:

### Paso 1: Contenedor de PostgreSQL v14
Se levantó el motor de la base de datos con las credenciales asignadas en el examen y el nombre del servicio personalizado:

```powershell
- docker run --name limar_service -e POSTGRES_USER=ulimar -e POSTGRES_PASSWORD=ex4men_db -p 5432:5432 -d postgres:14

