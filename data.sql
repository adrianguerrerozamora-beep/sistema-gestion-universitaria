-- Insertar AULAS
INSERT INTO AULA (id_aula, edificio, numero, capacidad) VALUES
(1, 'A', 101, 30),
(2, 'A', 102, 30),
(3, 'B', 201, 50),
(4, 'B', 202, 50),
(5, 'C', 301, 20),
(6, 'C', 302, 25),
(7, 'D', 401, 100),
(8, 'D', 402, 100),
(9, 'E', 501, 40),
(10, 'E', 502, 40);

-- Insertar PROFESORES
INSERT INTO PROFESOR (id_prof, nombre, departamento, salario) VALUES
(10, 'Dr. House', 'Medicina', 5000),
(20, 'Lic. Bond', 'Derecho', 4500),
(30, 'Ing. Stark', 'Sistemas', 6000),
(40, 'Arq. Ted', 'Arquitectura', 4800),
(50, 'Dra. Curie', 'Ciencias', 5200),
(60, 'Mtro. Yoda', 'Filosofía', 4000),
(70, 'Ing. Musk', 'Sistemas', 5900),
(80, 'Lic. Goodman', 'Derecho', 4600),
(90, 'Dr. Strange', 'Medicina', 5100),
(100, 'Arq. Lisa', 'Arquitectura', 4700);

-- Insertar ESTUDIANTES
INSERT INTO ESTUDIANTE (id_est, nombre, apellido, edad, email, carrera) VALUES
(1, 'Ana', 'López', 20, 'ana.lop@uni.edu', 'Sistemas'),
(2, 'Carlos', 'Ruiz', 21, 'carl.ru@uni.edu', 'Derecho'),
(3, 'Elena', 'Diaz', 19, 'ele.di@uni.edu', 'Arquitectura'),
(4, 'David', 'Goméz', 22, 'dav.go@uni.edu', 'Sistemas'),
(5, 'Sofia', 'Mier', 20, 'sof.mi@uni.edu', 'Medicina'),
(6, 'Luis', 'Torres', 23, 'luis.to@uni.edu', 'Derecho'),
(7, 'Clara', 'Vega', 19, 'clara.v@uni.edu', 'Sistemas'),
(8, 'Jorge', 'Paz', 21, 'jorge.p@uni.edu', 'Arquitectura'),
(9, 'Marta', 'Silva', 20, 'mar.sil@uni.edu', 'Medicina'),
(10, 'Pedro', 'Rico', 22, 'ped.ric@uni.edu', 'Sistemas');

-- Insertar CURSOS
INSERT INTO CURSO (id_curso, nombre_curso, creditos, id_prof, id_aula) VALUES
(501, 'Programación', 8, 30, 1),
(502, 'Bases de Datos', 8, 70, 2),
(503, 'Anatomía I', 10, 10, 5),
(504, 'Derecho Penal', 6, 20, 3),
(505, 'Diseño 3D', 7, 40, 9),
(506, 'Física', 8, 50, 7),
(507, 'Ética', 4, 60, 8),
(508, 'Derecho Civil', 6, 80, 4),
(509, 'Cirugía', 10, 90, 6),
(510, 'Estructuras', 7, 100, 10);

-- Insertar INSCRIPCIONES
INSERT INTO INSCRIPCION (id_est, id_curso, semestre, nota) VALUES
(1, 501, '2023-1', 90),
(1, 502, '2023-1', 85),
(2, 504, '2023-1', 70),
(4, 501, '2023-1', 100),
(5, 503, '2023-1', 95),
(3, 505, '2023-1', 88),
(7, 502, '2023-1', 60),
(6, 508, '2023-1', 75),
(9, 509, '2023-1', 92),
(10, 501, '2023-1', 80);