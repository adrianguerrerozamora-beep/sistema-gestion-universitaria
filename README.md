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

## Catálogo de Consultas y Expresiones en Álgebra Relacional

A continuación se detalla la especificación formal (Álgebra Relacional) de las 20 consultas incluidas en el sistema:

### 1. BÁSICAS
1. **Estudiante con ID 5:** σ id_est = 5 (ESTUDIANTE)
2. **Aulas fuera del edificio A:** σ edificio ≠ 'A' (AULA)
3. **Notas superiores a 90:** σ nota > 90 (INSCRIPCION)
4. **Cursos de 8 créditos del Prof. 30:** σ creditos = 8 ∧ id_prof = 30 (CURSO)
5. **Estudiantes de Sistemas o Arquitectura:** σ carrera = 'Sistemas' ∨ carrera = 'Arquitectura' (ESTUDIANTE)
6. **Proyección de Nombres:** π nombre, apellido (ESTUDIANTE)
7. **Cálculo de Salario Anual:** π nombre, salario, salario * 12 (PROFESOR)

### 2. REUNIONES (JOINS)
8. **Historial de Estudiantes:** π nombre, semestre, nota (ESTUDIANTE ⋈ INSCRIPCION)
9. **Detalle Completo (3 tablas):** π nombre, nombre_curso, nota (ESTUDIANTE ⋈ INSCRIPCION ⋈ CURSO)
10. **Ubicación de Cursos:** π nombre_curso, edificio, numero (CURSO ⋈ AULA)
11. **Profesores y sus Cursos (Incluye sin carga):** PROFESOR ⟕ CURSO (Left Outer Join)

### 3. AGREGACIÓN
12. **Total de estudiantes:** ℑ COUNT(id_est) (ESTUDIANTE)
13. **Promedio general:** ℑ AVG(nota) (INSCRIPCION)
14. **Nota máxima:** ℑ MAX(nota) (INSCRIPCION)
15. **Estudiantes por carrera:** γ carrera; COUNT(*) (ESTUDIANTE)
16. **Nómina por departamento:** γ departamento; SUM(salario) (PROFESOR)

### 4. AVANZADAS
17. **Unión de Personas (Estudiantes + Profesores):** π nombre (ESTUDIANTE) ∪ π nombre (PROFESOR)
18. **Estudiantes sin inscripciones (Resta):** ESTUDIANTE - (π datos_est (ESTUDIANTE ⋈ INSCRIPCION))
19. **Mejores promedios (Agrupación + Orden):** τ promedio ↓ ( γ nombre; AVG(nota) (ESTUDIANTE ⋈ INSCRIPCION) )
20. **Aulas grandes (Subconsulta):** σ capacidad > (ℑ AVG(capacidad)(AULA)) (AULA)
