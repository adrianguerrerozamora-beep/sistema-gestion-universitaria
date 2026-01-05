-- 1. INSERTAR AULAS (10 registros)
INSERT INTO AULA (edificio, numero, capacidad) VALUES 
('A', 101, 30), ('A', 102, 35), ('B', 201, 40), ('B', 202, 25), ('C', 301, 50),
('C', 302, 50), ('D', 401, 20), ('D', 402, 20), ('E', 501, 60), ('E', 502, 15);

-- 2. INSERTAR PROFESORES (10 registros)
INSERT INTO PROFESOR (nombre, departamento, salario) VALUES 
('Dr. House', 'Medicina', 5000.00), ('Alan Turing', 'Sistemas', 4500.00),
('Marie Curie', 'Física', 4800.00), ('Richard Feynman', 'Física', 4700.00),
('Grace Hopper', 'Sistemas', 4600.00), ('Ada Lovelace', 'Sistemas', 4900.00),
('Isaac Newton', 'Matemáticas', 4200.00), ('Euclides', 'Matemáticas', 4100.00),
('Sigmund Freud', 'Psicología', 4300.00), ('Frida Kahlo', 'Artes', 4000.00);

-- 3. INSERTAR ESTUDIANTES (25 registros)
INSERT INTO ESTUDIANTE (nombre, apellido, edad, email, carrera) VALUES 
('Ana', 'López', 20, 'ana.lop@uni.edu', 'Sistemas'), ('Carlos', 'Ruiz', 21, 'carl.ru@uni.edu', 'Derecho'),
('Elena', 'Díaz', 19, 'ele.di@uni.edu', 'Arquitectura'), ('David', 'Goméz', 22, 'dav.go@uni.edu', 'Sistemas'),
('Sofia', 'Mier', 20, 'sof.mi@uni.edu', 'Medicina'), ('Luis', 'Torres', 23, 'luis.to@uni.edu', 'Derecho'),
('Clara', 'Vega', 19, 'clara.v@uni.edu', 'Sistemas'), ('Jorge', 'Paz', 21, 'jorge.p@uni.edu', 'Arquitectura'),
('Marta', 'Silva', 20, 'mar.sil@uni.edu', 'Medicina'), ('Pedro', 'Rico', 22, 'ped.ric@uni.edu', 'Sistemas'),
('Lucia', 'Mendez', 20, 'lu.men@uni.edu', 'Psicología'), ('Marco', 'Polo', 24, 'mar.po@uni.edu', 'Historia'),
('Valentina', 'Solis', 19, 'val.so@uni.edu', 'Sistemas'), ('Hugo', 'Chavez', 21, 'hug.cha@uni.edu', 'Políticas'),
('Gabriela', 'Mistral', 22, 'gab.mis@uni.edu', 'Literatura'), ('Pablo', 'Neruda', 23, 'pab.ner@uni.edu', 'Literatura'),
('Diego', 'Rivera', 25, 'die.riv@uni.edu', 'Artes'), ('Salvador', 'Dali', 24, 'sal.dal@uni.edu', 'Artes'),
('Leo', 'Messi', 20, 'leo.mes@uni.edu', 'Deportes'), ('Cris', 'Ronaldo', 21, 'cri.ron@uni.edu', 'Deportes'),
('Serena', 'Williams', 22, 'ser.wil@uni.edu', 'Deportes'), ('Michael', 'Jordan', 23, 'mic.jor@uni.edu', 'Deportes'),
('Tom', 'Brady', 24, 'tom.bra@uni.edu', 'Deportes'), ('Usain', 'Bolt', 25, 'usa.bol@uni.edu', 'Deportes'),
('Simone', 'Biles', 19, 'sim.bil@uni.edu', 'Deportes');

-- 4. INSERTAR CURSOS (20 registros)
INSERT INTO CURSO (id_curso, nombre_curso, creditos, id_prof, id_aula) VALUES 
(501, 'Programación I', 8, 2, 1), (502, 'Base de Datos', 8, 5, 2),
(503, 'Física Cuántica', 10, 4, 3), (504, 'Anatomía', 9, 1, 4),
(505, 'Cálculo I', 7, 7, 5), (506, 'Arte Moderno', 6, 10, 6),
(507, 'Psicología 101', 6, 9, 7), (508, 'Álgebra Lineal', 7, 8, 8),
(509, 'Química Orgánica', 9, 3, 9), (510, 'Historia del Arte', 5, 10, 10),
(511, 'Redes', 8, 6, 1), (512, 'Sistemas Operativos', 8, 2, 2),
(513, 'Inteligencia Artificial', 10, 2, 3), (514, 'Derecho Romano', 7, 7, 4),
(515, 'Derecho Penal', 7, 7, 5), (516, 'Dibujo Técnico', 6, 10, 6),
(517, 'Fisiología', 9, 1, 7), (518, 'Algoritmos', 8, 5, 8),
(519, 'Estructura de Datos', 8, 6, 9), (520, 'Compiladores', 9, 5, 10);

-- 5. INSERTAR INSCRIPCIONES (50 registros - Historial académico)
INSERT INTO INSCRIPCION (id_est, id_curso, semestre, nota) VALUES 
(1, 501, '2023-1', 90), (1, 502, '2023-1', 85), (2, 514, '2023-1', 70),
(4, 501, '2023-1', 100), (5, 504, '2023-1', 95), (3, 516, '2023-1', 88),
(7, 502, '2023-1', 60), (6, 515, '2023-1', 75), (9, 517, '2023-1', 92),
(10, 518, '2023-1', 80), (1, 511, '2023-2', 88), (1, 512, '2023-2', 91),
(4, 513, '2023-2', 95), (5, 509, '2023-2', 85), (2, 515, '2023-2', 78),
(11, 507, '2023-1', 90), (12, 510, '2023-1', 85), (13, 501, '2023-1', 70),
(14, 514, '2023-1', 88), (15, 506, '2023-1', 92), (16, 506, '2023-1', 80),
(17, 506, '2023-1', 100), (18, 506, '2023-1', 95), (19, 505, '2023-1', 60),
(20, 505, '2023-1', 65), (21, 505, '2023-1', 70), (22, 505, '2023-1', 75),
(23, 505, '2023-1', 80), (24, 505, '2023-1', 85), (25, 505, '2023-1', 90),
(13, 502, '2023-1', 88), (13, 511, '2023-2', 92), (13, 512, '2023-2', 85),
(13, 518, '2023-2', 80), (13, 519, '2023-2', 75), (4, 519, '2023-2', 98),
(4, 520, '2023-2', 96), (7, 518, '2023-2', 70), (7, 519, '2023-2', 68),
(7, 520, '2023-2', 65), (10, 511, '2023-2', 82), (10, 512, '2023-2', 84),
(10, 513, '2023-2', 86), (1, 518, '2023-2', 94), (1, 519, '2023-2', 93),
(1, 520, '2023-2', 92), (5, 517, '2023-2', 99), (9, 504, '2023-2', 97),
(9, 509, '2023-2', 95), (2, 515, '2023-2', 77);
