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

## Instrucciones de Instalación y Ejecución

Este proyecto está contenerizado con **Docker** para un despliegue automático y portable.

1. **Clonar el repositorio:**
   Descargue los archivos de este repositorio en su máquina local.

2. **Levantar la Base de Datos:**
   Ejecute el siguiente comando en la terminal para crear el contenedor, las tablas y cargar los datos automáticamente:
   ```bash
   docker-compose up -d

3. **Ejecutar el Sistema: Inicie el menú interactivo para realizar consultas:**
   ```bash
   python menu.py

## Catálogo de Consultas y Expresiones en Álgebra Relacional

A continuación se detalla la especificación formal (Álgebra Relacional) de las 20 consultas incluidas en el sistema:

### 1. BÁSICAS
- **Estudiante con ID 5:** σ id_est = 5 (ESTUDIANTE)
- **Aulas fuera del edificio A:** σ edificio ≠ 'A' (AULA)
- **Notas superiores a 90:** σ nota > 90 (INSCRIPCION)
- **Cursos de 8 créditos del Prof. 30:** σ creditos = 8 ∧ id_prof = 30 (CURSO)
- **Estudiantes de Sistemas o Arquitectura:** σ carrera = 'Sistemas' ∨ carrera = 'Arquitectura' (ESTUDIANTE)
- **Proyección de Nombres:** π nombre, apellido (ESTUDIANTE)
- **Cálculo de Salario Anual:** π nombre, salario, salario * 12 (PROFESOR)

### 2. REUNIONES (JOINS)
- **Historial de Estudiantes:** π nombre, semestre, nota (ESTUDIANTE ⋈ INSCRIPCION)
- **Detalle Completo (3 tablas):** π nombre, nombre_curso, nota (ESTUDIANTE ⋈ INSCRIPCION ⋈ CURSO)
- **Ubicación de Cursos:** π nombre_curso, edificio, numero (CURSO ⋈ AULA)
- **Profesores y sus Cursos (Incluye sin carga):** PROFESOR ⟕ CURSO (Left Outer Join)

### 3. AGREGACIÓN
- **Total de estudiantes:** ℑ COUNT(id_est) (ESTUDIANTE)
- **Promedio general:** ℑ AVG(nota) (INSCRIPCION)
- **Nota máxima:** ℑ MAX(nota) (INSCRIPCION)
- **Estudiantes por carrera:** γ carrera; COUNT(*) (ESTUDIANTE)
- **Nómina por departamento:** γ departamento; SUM(salario) (PROFESOR)

### 4. AVANZADAS
- **Unión de Personas (Estudiantes + Profesores):** π nombre (ESTUDIANTE) ∪ π nombre (PROFESOR)
- **Estudiantes sin inscripciones (Resta):** ESTUDIANTE - (π datos_est (ESTUDIANTE ⋈ INSCRIPCION))
- **Mejores promedios (Agrupación + Orden):** τ promedio ↓ ( γ nombre; AVG(nota) (ESTUDIANTE ⋈ INSCRIPCION) )
- **Aulas grandes (Subconsulta):** σ capacidad > (ℑ AVG(capacidad)(AULA)) (AULA)

## Modelos de Base de Datos

### 1. Diagrama Entidad-Relación Extendido (EER)
Representación conceptual del dominio:

![Diagrama EER](diagrama_eer.png)

### 2. Modelo Relacional (Esquema Lógico)
Representación de la implementación en tablas:

```mermaid
erDiagram
    ESTUDIANTE ||--o{ INSCRIPCION : "realiza"
    CURSO ||--o{ INSCRIPCION : "tiene"
    PROFESOR ||--o{ CURSO : "imparte"
    AULA ||--o{ CURSO : "alberga"

    ESTUDIANTE {
        int id_est PK
        string nombre
        string apellido
        string email
    }
    PROFESOR {
        int id_prof PK
        string nombre
        string departamento
    }
    CURSO {
        int id_curso PK
        string nombre_curso
        int creditos
        int id_prof FK
        int id_aula FK
    }
    AULA {
        int id_aula PK
        string edificio
        int numero
    }
    INSCRIPCION {
        int id_inscripcion PK
        int id_est FK
        int id_curso FK
        float nota
    }
