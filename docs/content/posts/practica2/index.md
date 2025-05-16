+++
date = '2025-02-21T10:19:41-08:00'
draft = true
title = 'Practica2 Python '
+++


## **Introducción**

En este análisis, exploraremos un script de Python que implementa un sistema básico de gestión de bibliotecas. Examinaremos detalladamente los elementos fundamentales del lenguaje tal como se aplican en este código, identificando componentes clave como identificadores, objetos, espacios de nombres, bloques de código, alcance, y gestión de memoria (con énfasis en las características propias de Python y en la simulación incorporada). Además, abordaremos las estructuras de control, los tipos de datos utilizados y los principios de programación orientada a objetos presentes en la implementación.

---

## **Análisis**

### 1-.Identificadores en Python

Los **identificadores** son nombres utilizados para referirse a variables, funciones, clases, métodos, módulos y otros objetos en Python. Deben seguir las reglas de nomenclatura del lenguaje: comenzar con una letra (A–Z o a–z) o un guion bajo (`_`), seguidos de letras, dígitos (0–9) o guiones bajos. No pueden coincidir con palabras clave del lenguaje.

En el script analizado se utilizan diversos identificadores que respetan las convenciones de estilo recomendadas por PEP 8:

- **Nombres de clases:** `Genre`, `Book`, `DigitalBook`, `Member`, `Library`.  
  *Convención:* `PascalCase`

- **Nombres de funciones y métodos:** `__init__`, `__del__`, `to_dict`, `from_dict`, `add_book`, `display_books`, `main`.  
  *Convención:* `snake_case`

- **Nombres de variables y atributos:** `book_id`, `title`, `author`, `publication_year`, `genre`, `quantity`, `file_format`, `member_id`, `name`, `issued_books`, `library`, `choice`, `book`, `member`.  
  *Convención:* `snake_case`

- **Nombres de módulos:** `json`, `memory_management`.  
  *Convención:* `snake_case`

- **Atributos de clase (constantes):** `Genre.FICTION`, `Genre.NON_FICTION`, etc.  
  *Convención:* `UPPERCASE` (para constantes, aunque en este caso son atributos de clase usados como constantes)



### 2.-Objetos en Python

En Python, *todo* es un objeto. Cada elemento en el lenguaje es una instancia de una clase (ya sea definida por el usuario o incorporada), y posee una **identidad**, un **tipo** y un **valor** (o estado).

En el script analizado, se utilizan diversos objetos de distintas clases y tipos:

- **Instancias de clases definidas por el usuario:**
  - `Book(...)`, `DigitalBook(...)`: Objetos que representan libros físicos o digitales.
  - `Member(...)`: Objetos que representan a los miembros de la biblioteca.
  - `Library()`: Objeto encargado de gestionar las colecciones de libros y miembros.

- **Instancias de tipos incorporados:**
  - **Enteros (`int`):** `book_id`, `publication_year`, `quantity`, `choice`.
  - **Cadenas de texto (`str`):** `title`, `author`, `genre`, `file_format`, `name`, `"library.json"`.
  - **Listas (`list`):** `self.books`, `self.members`, `member.issued_books`, `Genre.all_genres()`.
  - **Diccionarios (`dict`):** Retornos de métodos como `to_dict()`, y variables como `books_data`, `members_data`.
  - **Booleanos (`bool`):** Resultados de comparaciones como `book.id == book_id` o verificaciones como `is_digital`.
  - **`None`:** Valor de retorno cuando no se encuentra un objeto, por ejemplo en `find_book_by_id`.

- **Otros objetos:**
  - **Clases:** `Book`, `Library`, `Genre`, etc.
  - **Funciones:** `main`, funciones auxiliares definidas en el script.
  - **Métodos:** `add_book`, `display_books`, `to_dict`, entre otros.


### 3.- Entornos

Python utiliza **espacios de nombres** (*namespaces*) para organizar los identificadores y evitar colisiones entre nombres. Un espacio de nombres es un mapeo que asocia nombres (identificadores) con objetos. Estos espacios son gestionados por el entorno de ejecución de Python en distintos niveles.

En el script analizado, se pueden identificar los siguientes tipos de espacios de nombres:

- **Espacio de nombres incorporado:**  
  Incluye funciones, tipos y excepciones predefinidas del lenguaje, accesibles desde cualquier parte del programa.  
  Ejemplos: `print`, `int`, `input`, `len`, `FileNotFoundError`.

- **Espacio de nombres global (nivel de módulo):**  
  Corresponde al nivel del archivo fuente (por ejemplo, `biblioteca.py`).  
  Contiene definiciones como:
  - Clases: `Book`, `Library`, `Member`, etc.
  - Funciones: `main`.
  - Importaciones de módulos: `import json`, `import memory_management`.  
  En este script no hay variables globales explícitas, aparte de los módulos importados.

- **Espacio de nombres local:**  
  Se crea dentro de funciones o métodos y contiene los nombres definidos solo dentro de ese bloque.  
  Ejemplos:
  - En el método `add_book`, el parámetro `book` es un identificador local.
  - En la función `main`, variables como `library`, `choice`, `book_id`, `member`, entre otras, existen únicamente en su contexto local.


Python busca nombres siguiendo la regla **LEGB**: Local -> Enclosing function locals -> Global -> Built-in.

### **4. Bloques (Indentación)**

A diferencia de C o Java que usan llaves `{ }`, Python utiliza la **indentación** (espacios o tabulaciones) para definir bloques de código. Esto se aplica a:

- Definiciones de clases (`class Library:`).
- Definiciones de funciones/métodos (`def add_book(self, book):`).
- Estructuras de control (`if`, `elif`, `else`, `for`, `while`, `try`, `except`, `with`).

```python
# Ejemplo de bloque if/elif/else en main()
if choice == 1:
    # Bloque indentado para la opción 1
    book_id = int(input("Ingresa ID del libro: "))
    # ... más código indentado
elif choice == 2:
    # Bloque indentado para la opción 2
    library.display_books()
else:
    # Bloque indentado para la opción inválida
    print("Esta no es una opcion valida!!!\n")
```

La indentación coherente es sintácticamente **obligatoria** en Python.

### **5. Alcance (Scope)**

El alcance determina la visibilidad de un identificador (dónde se puede acceder a él). Está directamente relacionado con los espacios de nombres y la regla LEGB.

- **Alcance global:** Los nombres definidos a nivel de módulo (clases `Book`, `Library`, función `main`) son accesibles globalmente *dentro* del módulo.
- **Alcance local:** Los nombres definidos dentro de una función/método son locales a esa función (ej: `book_id`, `title` dentro del `if choice == 1` en `main`). Los parámetros de funciones/métodos (`self`, `book` en `add_book`) también son locales.
- **Alcance de instancia:** Los atributos definidos con `self.` (ej: `self.books`, `self.title`) pertenecen a la instancia específica de la clase y son accesibles a través de `self` dentro de los métodos de instancia.

### **6. Administración de memoria**

Python gestiona la memoria de forma automática, lo cual difiere significativamente de la gestión manual en C.

#### **Memoria automática (Stack y Heap en Python)**

- Python utiliza principalmente la **asignación en el heap** para los objetos. Las variables en Python son referencias (similares a punteros, pero gestionadas) a estos objetos en el heap.
- Las referencias locales (variables dentro de funciones) y los marcos de llamada de funciones residen en la **pila (stack)**. Cuando una función termina, su marco de pila se destruye, eliminando las referencias locales.
- **Recolección de Basura (Garbage Collection):** Python usa principalmente el **conteo de referencias**. Cuando el contador de referencias de un objeto llega a cero (ninguna variable se refiere a él), su memoria puede ser liberada. Python también tiene un **recolector de basura cíclico** para detectar y liberar objetos involucrados en ciclos de referencia.

#### **Simulación de gestión manual**

- La gestión de memoria realizada en este script **No representa la gestión de memoria real y manual de Python.**
- El script utiliza un módulo externo `memory_management` y llama a `memory_management.increment_heap_allocations(1)` en los `__init__` y `memory_management.increment_heap_deallocations(1)` en los `__del__`.
- El método `__del__` (destructor) en Python **no es determinista**. No se garantiza cuándo (o incluso si) será llamado por el recolector de basura. No debe usarse para la gestión de recursos críticos que requieren liberación inmediata (para eso se usan contextos `with` o `try...finally`). Su uso aquí para rastrear deallocaciones es conceptual.

Python abstrae la gestión de memoria del programador, pero el script añade un seguimiento explícito simulado.

### **7. Expresiones**

Las expresiones son combinaciones de valores, variables, operadores y llamadas a funciones/métodos que se evalúan para producir un valor:

- **Aritméticas:** `book.quantity - 1`, `len(member.issued_books)`.
- **Comparación:** `book.id == book_id`, `book.quantity > 0`, `"file_format" in data`.
- **Lógicas:** `book and member and book.quantity > 0`.
- **Acceso a atributos:** `book.title`, `self.members`.
- **Llamadas a métodos/funciones:** `book.to_dict()`, `int(input(...))`, `json.load(file)`.
- **Creación de literales:** `"Ficcion"`, `101`, `[]`, `{}`.
- **Comprensión de listas:** `[book.to_dict() for book in self.books]`

### **8. Sentencias (Comandos)**

Las sentencias son unidades completas de ejecución. Realizan una acción:

- **Asignación:** `self.id = book_id`, `book = Book(...)`.
- **Importación:** `import json`.
- **Definición de Clase:** `class Book:`
- **Definición de función/método:** `def add_book(self, book):`
- **Llamada a procedimiento (función/método sin retorno relevante usado):** `print(...)`, `self.books.append(book)`, `memory_management.display_memory_usage()`.
- **Control de flujo:** `if`, `for`, `while`, `break`, `return`.
- **Manejo de excepciones:** `try...except`.
- **Gestión de contexto:** `with open(...) as file:`.

### **9. Secuencia**

El flujo de ejecución del programa es secuencial por defecto. Las sentencias se ejecutan una tras otra en el orden en que aparecen en el script, a menos que una estructura de control (condicional, bucle, llamada a función, excepción) altere este flujo.

### **10. Selección (Condicionales)**

Se utilizan `if`, `elif` (else if) y `else` para ejecutar bloques de código basados en si una condición es verdadera o falsa.

- En `main`: El `if/elif/else` principal para manejar las opciones del menú.
- En `issue_book` y `return_book`: `if book and member and ...` para verificar si el libro y el miembro existen y cumplen las condiciones.
- En `load_library_from_file`: `if "file_format" in data` para decidir si crear un `Book` o un `DigitalBook`.
- En `display_books`: `if not self.books:` para manejar el caso de biblioteca vacía.

También se usa una expresión condicional (ternaria) en `main`:
`is_digital = input("Es un libro digital? (s/n): ").lower() == 's'`

### **11. Iteración (Bucles)**

Los bucles permiten repetir bloques de código.

- **`while` loop:** En `main`, el `while True:` crea el bucle principal del menú, que se ejecuta hasta que `choice == 8` causa un `break`.
- **`for` loop:**
  - En `display_books`, `display_members`, `find_book_by_id`, `find_member_by_id`: Se itera sobre las listas `self.books` o `self.members`.
  - En `display_members` y `search_member`: Se itera sobre `member.issued_books`.
  - En `save_library_to_file` y `save_members_to_file`: Se usan comprensiones de lista (que implican iteración) para crear las listas de diccionarios.
  - En `load_library_from_file` y `load_members_from_file`: Se usan comprensiones de lista para crear los objetos `Book`/`Member` a partir de los datos cargados.

### **12. Recursión**

La recursión ocurre cuando una función se llama a sí misma. Este script **no utiliza recursión** en su lógica principal. Todas las iteraciones se realizan mediante bucles `for` y `while`. Python soporta recursión, pero tiene un límite de profundidad de recursión para prevenir desbordamientos de pila.

### **13. Funciones y métodos (Subprogramas)**

El código está modularizado usando funciones y métodos, lo que mejora la organización, reutilización y legibilidad.

- **Función:** `main()` es la función principal que orquesta la interacción con el usuario y la biblioteca.
- **Métodos de instancia:** La mayoría de los métodos dentro de las clases (`__init__`, `to_dict`, `add_book`, `issue_book`, etc.). Operan sobre los datos de una instancia específica (`self`).
- **Métodos estáticos (`@staticmethod`):** `Book.from_dict`, `DigitalBook.from_dict`, `Member.from_dict`. No están ligados a una instancia (`self`) ni a la clase (`cls`). Se usan como funciones de utilidad relacionadas con la clase, a menudo para crear instancias desde otros formatos de datos.
- **Métodos de Clase (`@classmethod`):** `Genre.all_genres`. Están ligados a la clase (`cls`) en lugar de a la instancia (`self`). Útil para operaciones que involucran a la clase misma.
- **Método especial (`__init__`, `__del__`):** Métodos con doble guion bajo tienen significados especiales en Python (constructor, destructor en este caso).

### **14. Tipos de datos**

Python es un lenguaje de **tipado dinámico**, lo que significa que el tipo de una variable se determina en tiempo de ejecución. Sin embargo, los *valores* sí tienen tipos definidos.

- **Tipos incorporados usados:**
  - `int`: Para identificadores numéricos, años, cantidades.
  - `str`: Para títulos, nombres, autores, géneros, formatos de archivo, nombres de archivo.
  - `list`: Para almacenar colecciones de libros, miembros y libros prestados.
  - `dict`: Para la representación serializada de objetos (en JSON).
  - `bool`: Para resultados de comparaciones y flags (`is_digital`).
  - `NoneType` (el tipo del valor `None`): Usado para indicar la ausencia de un valor (ej., libro no encontrado).
- **Tipos definidos por el usuario (Clases):**
  - `Genre`: Actúa como un enumerador (aunque implementado con atributos de clase).
  - `Book`: Define la estructura y comportamiento de un libro.
  - `DigitalBook`: Define un tipo especializado de `Book`.
  - `Member`: Define la estructura y comportamiento de un miembro.
  - `Library`: Define la estructura y comportamiento de la biblioteca como un todo.

### **15. Programación Orientada a Objetos (POO)**

El script está fuertemente basado en principios POO:

- **Abstracción:** Las clases `Book`, `Member`, `Library` modelan entidades del mundo real (o del dominio del problema), ocultando los detalles internos y exponiendo interfaces (métodos).
- **Encapsulamiento:** Los datos (atributos como `title`, `author`, `issued_books`) y las operaciones sobre esos datos (métodos como `add_book`, `issue_book`) están agrupados dentro de las clases.
- **Herencia:** `DigitalBook` hereda de `Book`, reutilizando la funcionalidad de `Book` y añadiendo/modificando la suya propia (atributo `file_format`, método `to_dict` sobreescrito). Se usa `super().__init__(...)` y `super().to_dict()` para invocar la implementación de la clase padre.
- **Polimorfismo:** Aunque no se explota extensamente, el método `to_dict` es un ejemplo. La forma en que un objeto se convierte a diccionario depende de si es un `Book` o un `DigitalBook`. La carga desde JSON (`load_library_from_file`) también demuestra polimorfismo al crear el tipo correcto de objeto (`Book` o `DigitalBook`) basado en los datos.

### **16. Módulos e importaciones**

El script utiliza módulos para organizar el código y reutilizar funcionalidades:

- **`import json`:** Importa el módulo estándar de Python para trabajar con datos en formato JSON (serializar/deserializar objetos `Book` y `Member`).
- **`from memory_management import memory_management`:** Importa un objeto específico (`memory_management`) desde un módulo local (presumiblemente `memory_management.py`). Esto permite usar `memory_management.increment_heap_allocations(...)` directamente.

### **17. Manejo de errores**

Se implementa manejo básico de errores usando bloques `try...except`:

- En `load_library_from_file` y `load_members_from_file`: Se usa `try...except FileNotFoundError` para manejar el caso en que los archivos `library.json` o `members.json` no existan al iniciar el programa, evitando que el programa falle y mostrando un mensaje informativo.
- La conversión de input a entero (`int(input(...))`) podría fallar si el usuario ingresa texto no numérico. Este error **no** se maneja explícitamente con `try...except`, por lo que el programa se detendría con un `ValueError` en ese caso.

---

## **Conclusión**

El script nos muestra muchos conceptos fundamentales del lenguaje Python. Utiliza POO para modelar el dominio del problema (libros, miembros, biblioteca) con clases, herencia y encapsulamiento. Emplea tipos de datos incorporados (listas, diccionarios, strings, ints) y definidos por el usuario (clases). Gestiona el flujo del programa mediante estructuras de control estándar (bucles, condicionales). La administración de memoria es manejada automáticamente por Python, aunque el script incluye una capa de *simulación* de seguimiento de memoria con fines demostrativos. El uso de módulos (`json`) y el manejo básico de excepciones (`try...except`) también son evidentes.

---