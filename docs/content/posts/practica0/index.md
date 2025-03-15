
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

