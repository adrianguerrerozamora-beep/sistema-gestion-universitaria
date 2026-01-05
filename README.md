# Proyecto Integrador: Sistema de Gestión Universitaria

**Materia:** Bases de Datos  
**Estudiante:** Adrián  

## Descripción del Dominio
Este proyecto implementa una base de datos relacional para gestionar la información académica de una universidad. El sistema administra:
- **Estudiantes:** Información personal y académica.
- **Profesores:** Asignación a departamentos y salarios.
- **Cursos:** Oferta académica con créditos y asignación docente.
- **Aulas:** Gestión de infraestructura física.
- **Inscripciones:** Registro histórico de notas y cursos tomados.

## Estructura del Proyecto
El esquema cumple con los requisitos de normalización y claves foráneas para asegurar la integridad referencial.

### Tablas Principales
1. **ESTUDIANTE**: `id_est` (PK)
2. **PROFESOR**: `id_prof` (PK)
3. **AULA**: `id_aula` (PK)
4. **CURSO**: `id_curso` (PK), `id_prof` (FK), `id_aula` (FK)
5. **INSCRIPCION**: `id_inscripcion` (PK), `id_est` (FK), `id_curso` (FK)

## Instrucciones de Instalación

1. Clonar este repositorio.
2. Ejecutar el script `schema.sql` en su cliente de PostgreSQL para crear las tablas.
3. Ejecutar el script `data.sql` para poblar la base de datos con información de prueba.