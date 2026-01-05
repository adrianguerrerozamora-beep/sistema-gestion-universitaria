import psycopg2
import os

# --- CONFIGURACIÓN DE CONEXIÓN ---
# Nota: Mantenemos el puerto 5439 que configuraste
DB_CONFIG = {
    "dbname": "universidad",
    "user": "admin",
    "password": "password123",
    "host": "127.0.0.1",
    "port": "5439" 
}

# --- DEFINICIÓN DE LAS 20 CONSULTAS ---
# Organizadas por categorías para que el menú sea legible
CONSULTAS = {
    "1": {
        "categoria": "BÁSICAS (Selección y Proyección)",
        "queries": [
            {"desc": "Estudiante con ID 5 (Selección simple)", 
             "sql": "SELECT * FROM ESTUDIANTE WHERE id_est = 5;"},
            {"desc": "Aulas que NO están en el edificio 'A' (Desigualdad)", 
             "sql": "SELECT * FROM AULA WHERE edificio != 'A';"},
            {"desc": "Inscripciones con nota superior a 90", 
             "sql": "SELECT * FROM INSCRIPCION WHERE nota > 90;"},
            {"desc": "Cursos de 8 créditos del Profesor 30 (AND)", 
             "sql": "SELECT * FROM CURSO WHERE creditos = 8 AND id_prof = 30;"},
            {"desc": "Estudiantes de Sistemas O Arquitectura (OR)", 
             "sql": "SELECT * FROM ESTUDIANTE WHERE carrera = 'Sistemas' OR carrera = 'Arquitectura';"},
            {"desc": "Solo Nombres y Apellidos (Proyección)", 
             "sql": "SELECT nombre, apellido FROM ESTUDIANTE;"},
            {"desc": "Salario Anual de Profesores (Campo Calculado)", 
             "sql": "SELECT nombre, salario, (salario * 12) as salario_anual FROM PROFESOR;"}
        ]
    },
    "2": {
        "categoria": "REUNIONES (Joins)",
        "queries": [
            {"desc": "Historial: Estudiantes + Inscripciones (Inner Join)", 
             "sql": "SELECT e.nombre, i.semestre, i.nota FROM ESTUDIANTE e JOIN INSCRIPCION i ON e.id_est = i.id_est;"},
            {"desc": "Detalle Completo: Estudiante + Curso + Nota (3 Tablas)", 
             "sql": """SELECT e.nombre as estudiante, c.nombre_curso, i.nota 
                       FROM ESTUDIANTE e 
                       JOIN INSCRIPCION i ON e.id_est = i.id_est 
                       JOIN CURSO c ON i.id_curso = c.id_curso;"""},
            {"desc": "Cursos y sus Aulas asignadas", 
             "sql": "SELECT c.nombre_curso, a.edificio, a.numero FROM CURSO c JOIN AULA a ON c.id_aula = a.id_aula;"},
            {"desc": "Profesores y sus Cursos (Left Join - Muestra todos los profes)", 
             "sql": "SELECT p.nombre, c.nombre_curso FROM PROFESOR p LEFT JOIN CURSO c ON p.id_prof = c.id_prof;"}
        ]
    },
    "3": {
        "categoria": "AGREGACIÓN Y AGRUPACIÓN",
        "queries": [
            {"desc": "Total de estudiantes registrados (COUNT)", 
             "sql": "SELECT COUNT(*) as total_estudiantes FROM ESTUDIANTE;"},
            {"desc": "Promedio general de notas (AVG)", 
             "sql": "SELECT AVG(nota) as promedio_general FROM INSCRIPCION;"},
            {"desc": "Nota máxima registrada (MAX)", 
             "sql": "SELECT MAX(nota) as nota_maxima FROM INSCRIPCION;"},
            {"desc": "Cantidad de estudiantes por Carrera (GROUP BY)", 
             "sql": "SELECT carrera, COUNT(*) as cantidad FROM ESTUDIANTE GROUP BY carrera;"},
            {"desc": "Gasto total en salarios por Departamento", 
             "sql": "SELECT departamento, SUM(salario) as nomina_mensual FROM PROFESOR GROUP BY departamento;"}
        ]
    },
    "4": {
        "categoria": "AVANZADAS Y CONJUNTOS",
        "queries": [
            {"desc": "Unión de Nombres: Estudiantes y Profesores (UNION)", 
             "sql": "SELECT nombre, 'Estudiante' as tipo FROM ESTUDIANTE UNION SELECT nombre, 'Profesor' as tipo FROM PROFESOR;"},
            {"desc": "Estudiantes SIN inscripciones (Subconsulta/Resta)", 
             "sql": "SELECT * FROM ESTUDIANTE WHERE id_est NOT IN (SELECT id_est FROM INSCRIPCION);"},
            {"desc": "Promedio de notas por Estudiante (Ordenado)", 
             "sql": """SELECT e.nombre, AVG(i.nota) as promedio 
                       FROM INSCRIPCION i JOIN ESTUDIANTE e ON i.id_est = e.id_est 
                       GROUP BY e.nombre ORDER BY promedio DESC;"""},
            {"desc": "Aulas con capacidad mayor al promedio", 
             "sql": "SELECT * FROM AULA WHERE capacidad > (SELECT AVG(capacidad) FROM AULA);"}
        ]
    }
}

# --- FUNCIONES DEL SISTEMA ---

def limpiar_consola():
    os.system('cls' if os.name == 'nt' else 'clear')

def conectar():
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"\n[ERROR CRÍTICO] No se pudo conectar a la BD.")
        print(f"Detalle: {repr(e)}")
        print("\nVerifica que Docker esté corriendo y el puerto sea el correcto (5439).")
        return None

def ejecutar_consulta(titulo, sql):
    conn = conectar()
    if not conn: return

    cursor = conn.cursor()
    try:
        limpiar_consola()
        print(f"\n=== RESULTADO: {titulo} ===")
        print(f"SQL: {sql}\n")
        
        cursor.execute(sql)
        
        # Obtener nombres de columnas
        columnas = [desc[0] for desc in cursor.description]
        filas = cursor.fetchall()
        
        # Formato de tabla simple
        ancho = 20
        header = "".join([col.ljust(ancho)[:ancho] for col in columnas])
        print(header)
        print("-" * len(header))
        
        for fila in filas:
            fila_str = "".join([str(val).ljust(ancho)[:ancho] for val in fila])
            print(fila_str)
            
        print(f"\nTotal registros: {len(filas)}")
        
    except Exception as e:
        print(f"Error ejecutando consulta: {e}")
    finally:
        conn.close()
        input("\nPresione Enter para volver al menú...")

def mostrar_submenu(cat_id):
    while True:
        limpiar_consola()
        categoria = CONSULTAS[cat_id]["categoria"]
        queries = CONSULTAS[cat_id]["queries"]
        
        print(f"=== {categoria} ===")
        for i, q in enumerate(queries):
            print(f"{i+1}. {q['desc']}")
        print("0. Volver al menú principal")
        
        opcion = input("\nElija una consulta: ")
        
        if opcion == '0':
            break
        
        try:
            idx = int(opcion) - 1
            if 0 <= idx < len(queries):
                q = queries[idx]
                ejecutar_consulta(q['desc'], q['sql'])
            else:
                print("Opción no válida.")
        except ValueError:
            print("Entrada no válida.")

def menu_principal():
    while True:
        limpiar_consola()
        print("=========================================")
        print("   SISTEMA GESTOR DE BASE DE DATOS")
        print("   (Proyecto Final - Docker & Python)")
        print("=========================================")
        
        for key, val in CONSULTAS.items():
            print(f"{key}. {val['categoria']}")
        
        print("0. Salir")
        
        opcion = input("\nSeleccione una categoría: ")
        
        if opcion == '0':
            print("Saliendo...")
            break
        elif opcion in CONSULTAS:
            mostrar_submenu(opcion)
        else:
            input("Opción no válida. Enter para intentar de nuevo.")

if __name__ == "__main__":
    menu_principal()