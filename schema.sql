-- 1. Tabla AULA (Sin dependencias)
CREATE TABLE AULA (
    id_aula SERIAL PRIMARY KEY,
    edificio VARCHAR(10) NOT NULL,
    numero INT NOT NULL,
    capacidad INT NOT NULL
);

-- 2. Tabla PROFESOR (Sin dependencias)
CREATE TABLE PROFESOR (
    id_prof SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

-- 3. Tabla ESTUDIANTE (Sin dependencias)
CREATE TABLE ESTUDIANTE (
    id_est SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR(100) UNIQUE,
    carrera VARCHAR(50) NOT NULL
);

-- 4. Tabla CURSO (Depende de PROFESOR y AULA)
CREATE TABLE CURSO (
    id_curso INT PRIMARY KEY, -- Usamos IDs manuales (501, 502...)
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    id_prof INT,
    id_aula INT,
    FOREIGN KEY (id_prof) REFERENCES PROFESOR(id_prof),
    FOREIGN KEY (id_aula) REFERENCES AULA(id_aula)
);

-- 5. Tabla INSCRIPCION (Depende de ESTUDIANTE y CURSO)
CREATE TABLE INSCRIPCION (
    id_inscripcion SERIAL PRIMARY KEY,
    id_est INT NOT NULL,
    id_curso INT NOT NULL,
    semestre VARCHAR(20) NOT NULL,
    nota DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (id_est) REFERENCES ESTUDIANTE(id_est),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);