
<!--Comentario xd-->


## **Introducción**

Durante esta práctica, exploramos diversos temas de desarrollo web para crear la base de nuestro portafolio para la materia de paradigmas de la programación. La práctica se dividió en 3 sesiones.

1. **Introducción a Markdown**
2. **Uso de Git y GitHub**
3. **Creación de páginas estáticas**

## **Sesión 1: Introducción a Markdown**

Un resultado clave de esta práctica fue adquirir la habilidad de emplear diversos formatos de texto y su correcta aplicación para una presentación clara y concisa mediante el uso de Hugo. El sistema puede indicar posibles inconsistencias mediante líneas amarillas debajo del texto, las cuales no afectan la visualización, pero se aconseja adherirse a las normas del lenguaje. Los formatos aprendidos se detallan a continuación.

* ### Encabezados

En la primera etapa, se utilizaron títulos para encabezar el texto, diferenciándolos por el número de "#" empleados, siendo el de un "#" el principal. Se puede hacer hasta con 5 hashtags.

# Encabezado con 1 hashtag

## Encabezado con 2 hashtag

### Encabezado con 3 hashtag

#### Encabezado con 4 hashtag

##### Encabezado con 5 hashtag

* ### Textos

Pasamos a darle formato al texto, basado en los diferentes tipos de formato que podemos implementar en un texto sencillo:

<!--ITALICA-->
*intalica*: usando asteriscos al inicio y al final del texto.

_intalica_ usando guiones bajos al inicio y al final del texto.

<!--ITALICA-->
**negrita** usando doble asterisco al inicio y al final del texto.

__negrita__ usando doble guion bajo al inicio y al final del texto.

<!--TACHADO-->
~~tachado~~ usando doble tilde al inicio y al final del texto.

<!--SUBRAYADO (no soportado por markdown)-->
<u>subrayado</u> usando etiquetas HTML.

> Notese que el formato de subrayado no se proyecta en el sitio, esto se debe a que Markdown no soporta este tipo de formato para textos. Aqui se usa el formato para .HTML, pero como estamos trabajando con un archivo .md, el sitio no lo visualizará.

* ### Listas

Se dividen en dos tipos:

**Listas ordenadas:** donde se le asigna un número a cada elemento de la lista.

1. Elemento 1
2. Elemento 2
3. Elemento 3
   1. Elemento 3.1
   2. Elemento 3.2
      1. Elemento 3.2.1
4. Elemento 4

**Listas desordenadas:** donde se utiliza un asterisco para indicar que es un elemento de la lista.
  
* Elemento 1
* Elemento 2
* Elemento 3
  * Elemento 3.1
  * Elemento 3.2
  * Elemento 3.3
    * Elemento 3.3.1
* Elemento 4


* ### Enlaces e imagenes

Markdown nos permite implementar enlaces e imagenes de forma sencilla, siguen un formato similar, pero con algunas diferencias. Ambos nos permiten agregar texto alternativo que podemos visualizar al pasar nuestro cursor por encima de dicho enlace o imagen.

Ambos requieren de un enlace que les permita redirigir a otra página o para poder acceder a la imagen, aunque tambien podemos implementar imagenes de forma local accediendo a la ruta de dicha imagen.

De igual forma, las imagenes tambien nos permiten asignarles algun enlace donde, al hacer clic en la imagen, nos redirigirá a la página que queramos.

<!--ENLACES-->
* [Google](https://www.google.com "Google")

* [UABC](https://www.uabc.mx "Sitio web de la UABC")

***

> La imagen a continuación fue obtenida desde internet, obteniendo la ruta de la imagen donde fue publicada.

<!--IMAGENES-->

> La imagen a continuación fue asignada de forma local y se le adjunto un enlace a google.

[![Gato gordo](./images/original.jpg)](https://www.google.com)

* ### Código
  
Markdown simplifica la inserción de código, ya sea mediante dos comillas simples para porciones de texto o tres pares de comillas simples para bloques de código. Es posible indicar el formato o lenguaje del texto dentro de los bloques de tres comillas, lo que permite aplicar el formato correspondiente al código.
<!--CODIGO-->

`Simple linea de texto, usando dos comillas al inicio y al final.`

```txt
Texto en formato .txt
```

```python
print("formato .py")
```

```c
#include <stdio.h>

int main()
{
    printf("formato .c");

    return 0;
}
```

```html
<h1>formato .html</h1>
```

* ### Tablas

<!--TABLAS-->
| Columna 1 | Columna 2 | Columna 3 |
|-----------|-----------|-----------|
| Elemento 1 | Elemento 2 | Elemento 3 |
| Elemento 4 | Elemento 5 | Elemento 6 |

* ### Notas

<!--NOTAS-->
> Esto es una nota

* ### Lista

<!--TAREAS-->
* [x] Primera tarea
* [ ] Segunda tarea
* [x] Tercera tarea
* [ ] Cuarta tarea

<!--DIVISORES HORIZONTALES-->
***

---

___

El resultado más obvio, fue el archivo que se esta visualizando en este momento, usando el formato de Markdown y presentarlo usando la herramienta de Hugo, toda la estructura de este sitio está hecha por medio del uso de markdown.

---

## **Sesión 2: Uso de Git y Github**

Durante esta sesión, se adquirió conocimiento en el uso de Git, un sistema de control de versiones esencial para la gestión del desarrollo de proyectos y el seguimiento de las versiones. Se dominó el uso de la terminal Git Bash para llevar a cabo operaciones como la adición, eliminación y actualización de proyectos, con la capacidad de visualizar las versiones guardadas. Asimismo, se exploró GitHub, una plataforma en línea que facilita la carga y el intercambio de proyectos mediante la creación de repositorios. La terminal Git Bash permitió la ejecución de diversas acciones.

- `git add .` para agregar todos los cambios realizados en el proyecto.
- `git commit -m "mensaje_del_commit"` para guardar los cambios con un mensaje descriptivo.
- `git push origin master` para subir los cambios a Github.

Asi mismo, existen otros comandos que se usan comunmente al usar Git y Github, por ejemplo:

- `git status` para ver el estado de los cambios realizados en el proyecto.
- `git log` para ver el historial de commits realizados en el repositorio.
- `git pull origin master` para descargar los cambios de Github al repositorio local.
- `git branch nombre_de_la_rama` para crear una nueva rama.
- `git checkout nombre_de_la_rama` para cambiar de rama.
- `git merge nombre_de_la_rama` para mezclar los cambios de una rama con la actual.
- `git remote add origin https://github.com/usuario/repositorio.git` para agregar un repositorio remoto.

Los cambios,  visualizarlo desde nuestro perfil de Github. Donde tenemos un repositorio dedicado a este proyecto.

---

## **Sesión 3: Creación de páginas estáticas**

En esta sesion, aprendimos a utilizar un generador de sitios web llamado _Hugo_, el cual nos permite crear páginas web estáticas de manera rápida y sencilla.
Además, se integró GitHub Actions para automatizar el proceso de construcción del sitio web y facilitar la visualización de sus distintas versiones.


GitHub Actions es una potente herramienta de automatización que posibilita la creación de flujos de trabajo adaptados a las necesidades de cada aplicación. Su utilidad se maximiza al trabajar con Hugo, ya que permite configurar un flujo de trabajo que compila y despliega automáticamente el sitio web ante cualquier modificación en el repositorio. La integración con GitHub Pages simplifica aún más el proceso, al permitir la publicación directa del sitio desde el repositorio, lo que se traduce en un desarrollo y despliegue más eficientes y fluidos.

---

## **Conclusión**

A lo largo de estas sesiones, se adquirió un conocimiento práctico sobre la creación de sitios web estáticos, empleando herramientas como Hugo y Markdown, y se exploró el uso de las funcionalidades que ofrece Git, tales como repositorios, GitHub Actions y GitHub Pages.

---

**Fecha:** 14 de marzo de 2025  
**Materia:** Paradigmas de la Programación
**Profesor:** M. I. Jose Carlos Gallegos Mariscal


---

+++
date = '2025-02-21T10:20:06-08:00'
draft = false
title = 'Practica1: elementos básicos de los lenguajes de programación'
+++

- [Encabezado con 1 hashtag](#encabezado-con-1-hashtag)
  - [Encabezado con 2 hashtag](#encabezado-con-2-hashtag)
    - [Encabezado con 3 hashtag](#encabezado-con-3-hashtag)
      - [Encabezado con 4 hashtag](#encabezado-con-4-hashtag)
        - [Encabezado con 5 hashtag](#encabezado-con-5-hashtag)
  - [**Sesión 2: Uso de Git y Github**](#sesión-2-uso-de-git-y-github)
  - [**Sesión 3: Creación de páginas estáticas**](#sesión-3-creación-de-páginas-estáticas)
  - [**Conclusión**](#conclusión)
  - [**Introducción**](#introducción-1)
  - [**Análisis**](#análisis)
    - [**1. Nombres (Identificadores)**](#1-nombres-identificadores)
    - [**2. Objetos**](#2-objetos)
    - [**3. Entornos**](#3-entornos)
    - [**4. Bloques**](#4-bloques)
    - [**5. Alcance (Scope)**](#5-alcance-scope)
    - [**6. Administración de Memoria**](#6-administración-de-memoria)
      - [**Memoria Estática**](#memoria-estática)
      - [**Memoria Automática**](#memoria-automática)
      - [**Memoria Dinámica**](#memoria-dinámica)
    - [**7. Expresiones**](#7-expresiones)
    - [**8. Comandos (Sentencias)**](#8-comandos-sentencias)
    - [**9. Secuencia**](#9-secuencia)
    - [**10. Selección (Condicionales)**](#10-selección-condicionales)
    - [**11. Iteración (Bucles)**](#11-iteración-bucles)
    - [**12. Recursión**](#12-recursión)
    - [**13. Subprogramas (Funciones)**](#13-subprogramas-funciones)
    - [**14. Tipos de Datos**](#14-tipos-de-datos)
  - [**Conclusión**](#conclusión-1)

---

## **Introducción**

En esta práctica se analiza detalladamente un programa en C, con el objetivo de desglosar y comprender los componentes fundamentales de los lenguajes de programación. Se exploran aspectos como la definición y uso de identificadores, la manipulación de objetos y entornos, la estructuración del código mediante bloques, y la gestión de la memoria (estática, automática y dinámica). Además, se estudian las expresiones, sentencias de control y estructuras de repetición que permiten un flujo de ejecución ordenado y modular.

---

## **Análisis**

### **1. Nombres (Identificadores)**

Los identificadores son los nombres asignados a variables, funciones, constantes y otros elementos del programa. Sirven para que el código sea legible y autoexplicativo. En este ejemplo destacan:

- **Variables:** Nombres como `library`, `members`, `bookCount` y `memberCount` indican claramente su función y contenido.
- **Funciones:** Ejemplos como `addBook`, `displayBooks`, `saveLibraryToFile` y `loadLibraryFromFile` facilitan la comprensión de las operaciones que se realizan.
- **Constantes:** Los nombres de constantes como `FICTION`, `NON_FICTION`, `SCIENCE`, entre otros, permiten diferenciar categorías o estados dentro del programa.

Además, se incluyen elementos como:

- **MEMORY_MANAGEMENT_H:** Un identificador para el archivo de cabecera, que evita la inclusión repetida del mismo archivo en el proceso de compilación.
- **MEMORY_MANAGEMENT_DISPLAY:** Una macro que controla la visualización de información referente al manejo de la memoria.
- **heap_allocations:** Variables externas que llevan el conteo de las asignaciones y liberaciones en el heap, facilitando el monitoreo del uso de la memoria.

Esta nomenclatura ordenada contribuye a un código claro y mantenible.

### **2. Objetos**

En C, un objeto se define como una región de memoria con un tipo específico. En este programa se distinguen:

- **Estructuras:** Las definiciones de `book_t` y `member_t` agrupan datos relacionados (por ejemplo, atributos de un libro o de un miembro) en un solo bloque.
- **Punteros:** Se utilizan para gestionar y acceder dinámicamente a la memoria, como en el caso del puntero `book_t *library`.
- **Manejo de archivos:** El uso de `FILE *` permite la interacción con archivos, facilitando operaciones de lectura y escritura de datos.

Estos objetos permiten representar de forma concreta los elementos del dominio del problema.

### **3. Entornos**

El entorno de ejecución determina dónde y cómo se almacenan las variables, lo que afecta su visibilidad y tiempo de vida:

- **Variables Globales:** Elementos como `heap_allocations` y `stack_allocations` están disponibles en todo el programa, lo que permite un seguimiento global del uso de la memoria.
- **Variables Locales:** Declaradas dentro de funciones (por ejemplo, `choice` en `main`), tienen un alcance limitado al bloque donde se definen.
- **Segmentos de Memoria:** Las variables se organizan en segmentos (como BSS para variables no inicializadas), lo que optimiza el manejo de la memoria durante la ejecución.

### **4. Bloques**

Los bloques en C se definen mediante llaves `{}` y se utilizan para agrupar instrucciones que se ejecutan juntas. Esto es esencial para:

- Delimitar el ámbito de las variables.
- Organizar el código en secciones lógicas, como el cuerpo de una función.

Por ejemplo:

```c
void addBook(book_t **library, int* count) {
    // Código de la función
}
```

Este bloque delimita el código específico para agregar un libro, aislando sus variables y lógica.

### **5. Alcance (Scope)**

El alcance define la región del programa en la que una variable es accesible:

- **Alcance Global:** Variables definidas fuera de funciones, disponibles en todo el programa, como los contadores de memoria.
- **Alcance Local:** Variables definidas dentro de funciones o bloques, accesibles únicamente en ese contexto, lo que ayuda a evitar conflictos y errores.

Este concepto es clave para una gestión adecuada de la memoria y para mantener un código modular.

### **6. Administración de Memoria**

El programa gestiona la memoria de manera integral mediante tres métodos:

#### **Memoria Estática**

- Se asigna durante la compilación y permanece disponible durante toda la ejecución del programa.
- Ejemplo: Variables globales como `heap_allocations` se asignan de forma estática, almacenándose en el segmento de datos.

#### **Memoria Automática**

- Se asigna en el stack al entrar en un bloque o función y se libera automáticamente al salir.
- Ejemplo: Variables locales en `main()` (como `bookCount`, `memberCount` y `choice`) se gestionan de forma automática.

#### **Memoria Dinámica**

- Se asigna y libera manualmente usando funciones como `malloc`, `realloc` y `free`, permitiendo una gestión flexible según las necesidades del programa.
- Ejemplos de uso:
  - En `addBook()`, se asigna memoria para un nuevo libro:
  
    ```c
    book_t *new_book = (book_t *)malloc(sizeof(book_t));
    incrementHeapAllocations(new_book, sizeof(book_t));
    ```
  
  - Funciones como `addMember()`, `issueBook()`, y las funciones de liberación (`freeLibrary()` y `freeMembers()`) gestionan adecuadamente el ciclo de vida de la memoria dinámica.

El correcto uso de estos tres tipos de memoria es fundamental para optimizar el rendimiento y evitar fugas de memoria.

### **7. Expresiones**

Las expresiones en C son combinaciones de operadores y operandos que producen un valor. En el programa se destacan:

- **Comparaciones:** Como en `current->id == bookID`, que evalúa condiciones.
- **Asignaciones:** Por ejemplo, `new_book->next = *library` asigna una referencia a un nuevo objeto.
- **Operaciones Aritméticas:** Se utilizan para modificar valores, como en `bookFound->quantity--`.

Estas expresiones son la base para la lógica de procesamiento y toma de decisiones dentro del programa.

### **8. Comandos (Sentencias)**

Las sentencias son las instrucciones que indican qué acción debe realizar el programa. Algunos ejemplos incluyen:

- **Declaración de Variables:** `int choice = 0;`
- **Llamadas a Funciones:** Como `addBook(&library, &bookCount);` para modularizar la funcionalidad.
- **Sentencias de Retorno:** `return 0;` que indican el final de la ejecución de una función.

Estas instrucciones definen el flujo y la estructura operativa del código.

### **9. Secuencia**

El programa sigue un flujo de ejecución lineal, en el que las instrucciones se ejecutan en el orden en que aparecen, a menos que sean modificadas por estructuras de control (condicionales, bucles, etc.). Esto asegura que cada parte del código se ejecute de manera ordenada y predecible.

### **10. Selección (Condicionales)**

Para tomar decisiones, el código utiliza estructuras condicionales como `if`, `else` y `switch`. Estas permiten ejecutar diferentes bloques de código según se cumplan determinadas condiciones. Por ejemplo:

```c
switch (choice) {
    case 1:
        addBook(&library, &bookCount);
        break;
    case 2:
        displayBooks(library);
        break;
}
```

Esta estructura facilita la ejecución de tareas específicas según la opción seleccionada por el usuario.

### **11. Iteración (Bucles)**

Los bucles permiten repetir un conjunto de instrucciones mientras se cumpla una condición, lo que es esencial para recorrer estructuras de datos y procesar información de forma repetitiva. Ejemplo:

```c
while (current) {
    if (current->id == bookID) {
        return current;
    }
    current = current->next;
}
```

Este bucle recorre una lista enlazada hasta encontrar un libro con un identificador específico.

### **12. Recursión**

La recursión es una técnica en la que una función se llama a sí misma para resolver problemas de forma iterativa. En este ejemplo, la función para mostrar libros recorre la lista llamándose recursivamente:

```c
void displayBooksRecursive(book_t *library) {
    if (!library) return;
    printf("%s\n", library->title);
    displayBooksRecursive(library->next);
}
```

Esta técnica simplifica la solución de problemas que tienen una estructura naturalmente recursiva.

### **13. Subprogramas (Funciones)**

Las funciones son bloques de código independientes que realizan tareas específicas. Su uso permite:

- Modularizar el código, facilitando la lectura y el mantenimiento.
- Reutilizar lógica en diferentes partes del programa sin duplicación.

Cada subprograma está diseñado para cumplir una función concreta, lo que mejora la organización general del código.

### **14. Tipos de Datos**

El programa utiliza tanto tipos de datos primitivos como definidos por el usuario:

- **Primitivos:** Tipos básicos como `int`, `char` y `size_t`, que son fundamentales para cualquier operación aritmética o lógica.
- **Tipos Definidos por el Usuario:** Se incluyen enumeraciones (por ejemplo, `genre_t` para los géneros de libros) y estructuras (`book_t` y `member_t`) que permiten modelar datos complejos de manera organizada.

Esta combinación asegura que la información se maneje de forma adecuada y que el programa pueda representar distintos tipos de datos según las necesidades.

---

## **Conclusión**

El programa en C analizado en esta práctica ejemplifica de manera clara cómo se integran los conceptos fundamentales de la programación: desde la correcta definición de identificadores y la estructuración en bloques hasta la sofisticada gestión de la memoria (estática, automática y dinámica). La utilización de expresiones, sentencias, condicionales, bucles y recursión demuestra un manejo integral del flujo de ejecución, mientras que la modularidad proporcionada por las funciones favorece la organización y reutilización del código. En conjunto, estos elementos permiten comprender de forma profunda la estructura y el comportamiento de un programa en C, sentando las bases para el aprendizaje y la aplicación de paradigmas de programación.

---

**Fecha:** 14 de marzo de 2025  
**Materia:** Paradigmas de la Programación  
**Profesor:** M. I. Jose Carlos Gallegos Mariscal  
**Alumno:** Rodolfo Cabello Cuahutle