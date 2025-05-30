# Práctica IV: El Paradigma Lógico (Prolog)

Este reporte resume los conceptos clave del paradigma de programación lógica, con un enfoque en Prolog, basados en la presentación Práctica IV

## 1. Introducción al Paradigma Lógico

El paradigma lógico se diferencia de otros paradigmas como el funcional. Mientras que la programación funcional se centra en la evaluación de funciones (ej. `main(){ procedure1(); procedure2(); return }`), la programación lógica se basa en:

* Una **Base de Conocimientos** (Knowledge Base): Contiene hechos y reglas.
* Una **Pregunta** (Question): Lo que se desea saber.
* Una **Máquina** (Machine): El motor de inferencia que utiliza la base de conocimientos para encontrar una respuesta.
* Una **Respuesta** (Answer).

(Referencia: Slide 2)

## 2. Componentes Fundamentales de Prolog

### 2.1. Hechos (Facts)

Los hechos son afirmaciones que se consideran verdaderas sobre el dominio del problema. Son la base del conocimiento.

* **Ejemplos en lenguaje natural (Slide 3):**

  * Tom es un gato.
  * A Jorge le encanta comer pasta.
  * Tiene el pelo negro.
  * A Paty le encanta jugar.
  * Juan es perezoso.
* **Guía para escribir hechos (Slide 4):**

  * Los nombres de propiedades/relaciones empiezan con minúsculas.
  * El nombre de la relación aparece como primer término.
  * Los objetos aparecen como argumentos separados por comas y entre paréntesis.
  * Un punto `.` debe terminar un hecho.
  * Los objetos también empiezan con minúsculas, pueden ser números o cadenas entre comillas (ej. `color(penink, 'red')`).
  * Un hecho también se denomina predicado o cláusula (ej. `phoneno(agnibha, 1122334455).`).
* **Sintaxis general (Slide 5):**

  ```prolog

  relation(object1, object2...).

  ```
* **Ejemplos en Prolog (Slide 6):**

  ```prolog

  cat(tom).

  loves_to_eat(jorge, pasta).

  of_color(hair, black).

  loves_to_play_games(paty).

  lazy(juan).

  ```

### 2.2. Reglas (Rules)

Las reglas permiten inferir nuevos hechos a partir de los existentes. Definen relaciones condicionales.

* **Ejemplos en lenguaje natural (Slide 7):**

  * Lili se alegra si baila.
  * Tom tiene hambre si busca comida.
  * Jack y Bili son amigos si a ambos les encanta jugar al críquet.
  * Irá a jugar si la escuela está cerrada y él está libre.
* **Sintaxis general (Slide 8):**

  Una regla tiene la forma `cabeza :- cuerpo.` que se lee como "cabeza es verdadera si cuerpo es verdadero".

  ```prolog

  rule_name(object1, object2, ...) :- fact/rule(object1, object2, ...).

  ```

  * La coma `,` representa una conjunción (Y lógico).
  * El punto y coma `;` representa una disyunción (O lógico).

    * `P :- Q;R.` es equivalente a:

      ```prolog

      P :- Q.

      P :- R.

      ```
    * `P :- Q,R;S,T,U.` es entendida como:

      `P :- (Q,R);(S,T,U).` o:

      ```prolog

      P :- Q,R.

      P :- S,T,U.

      ```
* **Ejemplos en Prolog (Slide 9):**

  ```prolog

  happy(lili) :- dances(lili).

  hungry(tom) :- search_for_food(tom).

  friends(jack, bili) :- lovesCricket(jack), lovesCricket(bili).

  goToPlay(ryan) :- isClosed(school), free(ryan).

  ```

### 2.3. Consultas (Queries)

Las consultas son preguntas que se hacen al sistema Prolog sobre la base de conocimientos. Prolog intentará satisfacer la consulta utilizando los hechos y reglas.

* **Ejemplos en lenguaje natural (Slide 10):**

  * ¿Es Tom un gato?
  * ¿A Juan le encanta la pasta?
  * ¿Está feliz Lili?
  * ¿Irá Ryan a jugar?

### 2.4. Base de Conocimientos (Knowledge Base - KB)

Una KB es un archivo (generalmente con extensión `.pl`) que contiene un conjunto de hechos y reglas.

* **Ejemplo KB #1 (kb1.pl - Slide 11):**

  ```prolog

  girl(priya).

  girl(natasha).

  girl(jasmin).

  can_cook(priya).

  ```
* **Ejemplo KB #2 (Slide 12):**

  ```prolog

  sing_a_song(ana).

  listens_to_music(rodrigo).

  listens_to_music(ana) :- sing_a_song(ana).

  happy(ana) :- sing_a_song(ana).

  happy(rodrigo) :- listens_to_music(rodrigo).

  plays_guitar(rodrigo) :- listens_to_music(rodrigo).

  ```
* **Ejemplo KB #3 (Slide 13):**

  ```prolog

  can_cook(priya).

  can_cook(jasmin).

  can_cook(timoteo).

  likes(priya,jasmin) :- can_cook(jasmin).

  likes(priya,timoteo) :- can_cook(timoteo).

  ```

## 3. Relaciones en Prolog

Prolog especifica relaciones entre objetos y sus propiedades.

* Una afirmación como «José tiene una bicicleta» declara una relación de propiedad entre `josé` y `bicicleta`.
* Una pregunta como «¿Tiene José una bicicleta?» intenta averiguar sobre esa relación.
* Se busca la correspondencia entre Hecho y Consulta. (Slide 15)

### 3.1. Tipos de Relaciones

Algunas relaciones pueden ser reglas que determinan una relación incluso si no está definida explícitamente como un hecho.

* **Ejemplo: Relación fraternal (Slide 16):** Dos personas son hermanos si:

  1. Ambos son varones.
  2. Tienen el mismo progenitor.
* **KB #4 (Definiendo `brother` - Slide 17):**

  ```prolog

  parent(simon, pedro).

  parent(simon, raj).

  male(pedro).

  male(raj).


  brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), male(Y).

  % Nota: Esta definición puede dar relaciones duplicadas si se consulta

  % y no se considera que X e Y deben ser diferentes.

  ```
* **Revisión de relaciones (Slide 18):** Para solucionar relaciones entre A y B, considerar:

  * A y B son varones (para hermanos).
  * Tienen el mismo padre/madre.
  * A y B no son iguales (`X \== Y`).

### 3.2. Árbol de Relaciones Familiares (Ejemplo Extendido)

* **Hechos base (Slide 19):**

  ```prolog

  parent(pam, bob).

  parent(tom, bob).

  parent(tom, liz).

  parent(bob, ann).

  parent(bob, pat).

  parent(pat, jim).

  parent(pete, jim).

  ```

  (Se acompaña de un diagrama de árbol genealógico).
* **Hechos de género (Slide 20):**

  ```prolog

  female(pam). male(tom). male(bob). female(liz).

  female(pat). female(ann). male(jim).

  % Alternativamente:

  % sex(pam, feminine). sex(tom, masculine). ...

  ```
* **Definición de `mother` y `sister` (Slides 21-22):**

  (Diagramas ilustran las relaciones)

  ```prolog

  mother(X,Y) :- parent(X,Y), female(X).

  sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), X \== Y.

  ```
* **KB #5 (family.pl - Slide 23):** Combina hechos de `parent`, `male`, `female` y reglas para `mother`, `father`, `haschild`, `sister`, `brother`.

  ```prolog

  % ... (hechos de parent, male, female) ...

  mother(X,Y):- parent(X,Y), female(X).

  father(X,Y):- parent(X,Y), male(X).

  haschild(X):- parent(X,_). % _ es una variable anónima

  sister(X,Y):- parent(Z,X), parent(Z,Y), female(X), X\==Y.

  brother(X,Y):- parent(Z,X), parent(Z,Y), male(X), X\==Y.

  ```

### 3.3. Nuevas Relaciones y Recursión

* **Relaciones de abuelos (Slide 24):**

  ```prolog

  grandparent(X,Z) :- parent(X,Y), parent(Y,Z).

  grandmother(X,Z) :- mother(X,Y), parent(Y,Z).

  grandfather(X,Z) :- father(X,Y), parent(Y,Z).

  % Otras:

  % wife(X,Y) :- parent(X,Z),parent(Y,Z), female(X),male(Y). % Nota: esto define padres de un mismo hijo

  % uncle(X,Z) :- brother(X,Y), parent(Y,Z).

  ```
* **KB #6 (family_ext.pl - Slide 25):** Extiende `family.pl` con estas nuevas relaciones.
* **Recursión en relaciones familiares: `predecessor` (Slides 27-29):**

  Un predecesor `X` de `Z` es:

  1. Un padre directo de `Z`. (Caso base)
  2. Un padre de algún `Y`, donde `Y` es un predecesor de `Z`. (Caso recursivo)

  ```prolog

  % KB #7 (family_rec.pl)

  % % copia el contenido de family.pl aquí ...

  predecessor(X,Z) :- parent(X,Z).

  predecessor(X,Z) :- parent(X,Y), predecessor(Y,Z).

  ```

## 4. Objetos de Datos en Prolog (Términos)

Prolog manipula términos, que pueden ser:

* **Diagrama (Slide 30):**

  * Data Objects

    * Simple Objects

      * Constants

        * Atoms
        * Numbers
      * Variables
    * Structures
* **Ejemplos (Slide 31):**

  * **Átomos:**`tom`, `pat`, `x100`, `x_45` (secuencias de letras, dígitos, `_`, comenzando con minúscula).
  * **Cadenas especiales:**`:-`, `=======>`, `...`, `.` , `::=` (secuencias de caracteres especiales).
  * **Cadenas de caracteres:**`'Rubai'`, `'Hello, World!'` (cualquier secuencia entre comillas simples).
  * **Números:**`100`, `1235`, `2000.45` (enteros y reales).
  * **Variables:**`X`, `Y`, `Xval`, `_X` (secuencias de letras, dígitos, `_`, comenzando con mayúscula o `_`). `_` es la variable anónima.
  * **Estructuras (términos compuestos):**`día(9, jun, 2017)`, `punto(10, 25)` (un functor seguido de argumentos entre paréntesis).
* **Variables Anónimas (Slide 32 - `var_anon.pl`):** Se usan cuando el valor de una variable no es relevante.

  ```prolog

  hates(jim,tom).

  hates(pat,bob).

  % Consulta: ¿Quién odia a Tom?

  % ?- hates(X, tom).

  % X = jim ;

  % X = peter.

  % Consulta: ¿Hay alguien a quien Tom odie? (No nos importa quién)

  % ?- hates(tom, _).

  ```

## 5. Operadores

### 5.1. Operadores de Comparación (Slide 33)

Usados para comparar valores numéricos o términos.

* `X > Y`: X es mayor que Y
* `X < Y`: X es menor que Y
* `X >= Y`: X es mayor o igual que Y
* `X =< Y`: X es menor o igual que Y (nótese `=<` en lugar de `<=`)
* `X =:= Y`: Los valores de X e Y son iguales (evaluación aritmética).
* `X =\= Y`: Los valores de X e Y no son iguales (evaluación aritmética).

### 5.2. Operadores Aritméticos (Slide 34)

* `+`: Suma
* `-`: Resta
* `*`: Multiplicación
* `/`: División (resultado real)
* `**`: Potencia
* `//`: División de enteros
* `mod`: Módulo
* **Evaluación Aritmética (Slide 35 - `operadores.pl`):** El operador `is` se usa para asignar el resultado de una expresión aritmética a una variable.

  ```prolog

  calc :- X is 100 + 200, write('100 + 200 is '), write(X), nl,

          Y is 400 - 150, write('400 - 150 is '), write(Y), nl,

          Z is 10 * 300, write('10 * 300 is '), write(Z), nl,

          A is 100 / 30, write('100 / 30 is '), write(A), nl,

          B is 100 // 30, write('100 // 30 is '), write(B), nl,

          C is 100 ** 2, write('100 ** 2 is '), write(C), nl,

          D is 100 mod 30, write('100 mod 30 is '), write(D), nl.

  ```

## 6. Control de Flujo

### 6.1. Bucles (Loops)

Los bucles en Prolog se implementan típicamente mediante recursión.

* **Ejemplo: Contar hasta 10 (Slide 36 - `loop.pl`):**

  ```prolog

  count_to_10(10) :- write(10), nl. % Caso base

  count_to_10(X) :-

      write(X), nl,

      Y is X + 1,

      count_to_10(Y).    % Llamada recursiva

  ```
* **Rango con bucles (usando `between/3`) (Slide 37 - `loop.pl`):**

  `between(Low, High, Value)` genera números entre `Low` y `High`.

  ```prolog

  count_down(L, H) :-

      between(0, H, Y), % Y va de 0 a H-L (asumiendo L=0 para el ejemplo)

      Z is H - Y,

      write(Z), nl.


  count_up(L, H) :-

      between(0, H, Y), % Y va de 0 a H-L

      Z is L + Y,

      write(Z), nl.

  % Nota: la interpretación de L y H en between(L,H,Y) es que Y se instancia

  % a valores desde L hasta H. El ejemplo del slide parece usar Y como un contador.

  % Una forma más directa sería:

  % count_up(L,H) :- forall(between(L,H,X), (write(X), nl)).

  ```

### 6.2. Toma de Decisiones (If-Then-Else)

Se implementa mediante cláusulas separadas o usando predicados de corte y fallo.

* **Ejemplo (Slide 38 - `option.pl`):**

  * **If-Then-Else simple:**

    ```prolog

    gt(X,Y) :- X >= Y, write('X is greater or equal'). % If X >= Y Then ...

    gt(X,Y) :- X < Y, write('X is smaller').           % Else (If X < Y) Then ...

    ```
  * **If-Elif-Else:**

    ```prolog

    gte(X,Y) :- X > Y, write('X is greater').

    gte(X,Y) :- X =:= Y, write('X and Y are same').

    gte(X,Y) :- X < Y, write('X is smaller').

    ```

### 6.3. Conjunciones (Y lógico) y Disyunciones (O lógico)

* **Conjunción (`,`)**: Todas las sub-metas deben ser verdaderas.
* **Disyunción (`;`)**: Al menos una de las sub-metas debe ser verdadera.
* **Ejemplo (Slide 39 - `conj_disj.pl`):**

  ```prolog

  parent(jhon,bob).

  parent(lili,bob).

  male(jhon).

  female(lili).


  % Conjunction Logic

  father(X,Y) :- parent(X,Y), male(X). % X es padre de Y SI X es parent de Y Y X es male.


  % Disjunction Logic

  child_of(X,Y) :- father(Y,X); mother(Y,X). % X es hijo de Y SI Y es padre de X O Y es madre de X.

  % (Asumiendo que mother/2 está definida)

  ```

## 7. Listas en Prolog

Las listas son estructuras de datos fundamentales en Prolog.

* **Representación (Slide 41):**

  * Una lista es una secuencia ordenada de elementos.
  * Ej: `[rojo, verde, azul, blanco, oscuro]`
  * Puede estar vacía: `[]`.
  * Se compone de una **cabeza** (primer elemento) y una **cola** (resto de la lista).
  * Notación `[Cabeza | Cola]`.

    * `[a, b, c] = [a | [b, c]]`
    * `[a, b, c] = [a, b | [c]]`
    * `[a, b, c] = [a, b, c | []]`

### 7.1. Operaciones Básicas con Listas (Slides 42-44 - `list_basics.pl`)

* **Comprobación de membresía (`list_member/2`):**

  ```prolog

  list_member(X, [X|_]).

  list_member(X, [_|Tail]) :- list_member(X, Tail).

  ```
* **Cálculo de longitud (`list_length/2`):**

  ```prolog

  list_length([], 0).

  list_length([_|Tail], N) :- list_length(Tail, N1), N is N1 + 1.

  ```
* **Concatenación (`list_concat/3`):**

  ```prolog

  list_concat([], L, L).

  list_concat([X1|L1], L2, [X1|L3]) :- list_concat(L1, L2, L3).

  ```
* **Añadir elemento (append - `list_append/3`):** (El slide lo llama `list_append` pero la semántica es más como `prepend` si `T` es la lista original, o `append_if_not_member`)

  ```prolog

  % list_append(A,T,T) :- list_member(A,T),!. % Si A es miembro de T, T no cambia.

  % list_append(A,T,[A|T]).                  % Si no, A se añade al principio de T.

  % Nota: El predicado estándar append/3 concatena dos listas.

  ```
* **Eliminar elemento (`list_delete/3`):**

  ```prolog

  list_delete(X, [X|Tail], Tail). % Elimina la primera ocurrencia

  list_delete(X, [Y|Tail], [Y|NewTail]) :- list_delete(X, Tail, NewTail).

  % El slide tiene:

  % list_delete(X, [X], []).

  % list_delete(X, [X|L1], L1).

  % list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

  ```
* **Insertar elemento (`list_insert/3`):** (El slide lo define en términos de `list_delete`)

  ```prolog

  list_insert(X,L,R) :- list_delete(X,R,L). % R es L con X insertado.

  ```

### 7.2. Operaciones de Reposicionamiento de Elementos (Slides 45-46 - `list_repos.pl`)

* **Permutación (`list_perm/2`):**

  ```prolog

  list_perm([], []).

  list_perm(L, [X|P]) :- list_delete(X, L, L1), list_perm(L1, P).

  ```
* **Inversión (`list_rev/2`):**

  ```prolog

  list_rev([], []).

  list_rev([Head|Tail], Reversed) :-

      list_rev(Tail, RevTail),

      list_concat(RevTail, [Head], Reversed). % list_concat es append/3

  ```
* **Desplazamiento (rotar a la izquierda - `list_shift/2`):**

  ```prolog

  list_shift([Head|Tail], Shifted) :- list_concat(Tail, [Head], Shifted).

  ```
* **Verificar orden (`list_order/1`):**

  ```prolog

  list_order([]).

  list_order([_]).

  list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).

  % El slide tiene:

  % list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).

  % list_order([X]). % Caso base para un elemento, implícito en la recursión.

  ```
* **Subconjunto (`list_subset/2`):**

  ```prolog

  list_subset([], []).

  list_subset([Head|Tail], [Head|Subset]) :- list_subset(Tail, Subset). % Incluir Head

  list_subset([_|Tail], Subset) :- list_subset(Tail, Subset).         % No incluir Head

  ```
* **Unión (`list_union/3`):**

  ```prolog

  list_union([], Z, Z).

  list_union([X|Y], Z, W) :- list_member(X,Z), list_union(Y,Z,W).

  list_union([X|Y], Z, [X|W]) :- \+ list_member(X,Z), list_union(Y,Z,W).

  ```
* **Intersección (`list_intersect/3`):**

  ```prolog

  list_intersect([], _, []).

  list_intersect([X|Y], Z, [X|W]) :- list_member(X,Z), list_intersect(Y,Z,W).

  list_intersect([_|Y], Z, W) :- \+ list_member(X,Z), list_intersect(Y,Z,W). % Corrección: X no está definido aquí.

  % Una mejor definición:

  % list_intersect([], _, []).

  % list_intersect([X|RestL1], L2, [X|RestIntersection]) :-

  %    member(X, L2), !,

  %    list_intersect(RestL1, L2, RestIntersection).

  % list_intersect([_|RestL1], L2, Intersection) :-

  %    list_intersect(RestL1, L2, Intersection).

  ```

### 7.3. Otras Operaciones con Listas (Slides 47-48 - `list_misc.pl`)

* **Longitud par/impar:**

  ```prolog

  list_even_len([]).

  list_even_len([_|Tail]) :- list_odd_len(Tail). % Error en slide, debe ser [_,_|Tail] o usar contador


  list_odd_len([_]).

  list_odd_len([_|Tail]) :- list_even_len(Tail). % Error en slide

  % Correcto usando la definición del slide:

  list_even_len([]).

  list_even_len([H|T]) :- list_odd_len(T). % Si T es impar, H|T es par


  list_odd_len([_]). % Una lista de un elemento es impar

  list_odd_len([H|T]) :- list_even_len(T). % Si T es par, H|T es impar

  ```
* **Dividir lista en dos (`list_divide/3`):**

  ```prolog

  list_divide([], [], []).

  list_divide([X], [X], []).

  list_divide([X,Y|Tail], [X|List1], [Y|List2]) :- list_divide(Tail, List1, List2).

  ```
* **Máximo de dos números (`max_of_two/3`):**

  ```prolog

  max_of_two(X,Y,X) :- X >= Y.

  max_of_two(X,Y,Y) :- X < Y.

  ```
* **Máximo elemento de una lista (`list_max_elem/2`):**

  ```prolog

  list_max_elem([X], X).

  list_max_elem([X,Y|Rest], Max) :-

      list_max_elem([Y|Rest], MaxRest),

      max_of_two(X, MaxRest, Max). % O directamente: max_of_two(X,Y,TempMax), list_max_elem([TempMax|Rest], Max)

  ```
* **Suma de elementos de una lista (`list_sum/2`):**

  ```prolog

  list_sum([], 0).

  list_sum([Head|Tail], Sum) :-

      list_sum(Tail, SumTemp),

      Sum is Head + SumTemp.

  ```

## 8. Entradas y Salidas (Slide 49)

Prolog maneja entradas y salidas para:

* Manejo general de E/S.
* Manejo de archivos.
* Leer líneas y términos de archivos externos.
* Manipulación de caracteres.
* Construcción y descomposición de átomos.
* Consultar archivos Prolog.

## 9. Predicados Integrados

Prolog ofrece una variedad de predicados predefinidos.

### 9.1. Predicados de Tipo y Estado (Slides 50-51)

* `var(X)`: Verdadero si X es una variable no instanciada.
* `nonvar(X)`: Verdadero si X no es una variable o está instanciada.
* `atom(X)`: Verdadero si X es un átomo.
* `number(X)`: Verdadero si X es un número (entero o real).
* `integer(X)`: Verdadero si X es un entero.
* `float(X)`: Verdadero si X es un número real (flotante).
* `atomic(X)`: Verdadero si X es un átomo o un número.
* `compound(X)`: Verdadero si X es un término compuesto (estructura).
* `ground(X)`: Verdadero si X no contiene variables no instanciadas.

### 9.2. Predicados Matemáticos (Slides 52-53)

* `random(L, H, X)`: X se instancia a un valor aleatorio entre L y H.
* `between(L, H, X)`: X se instancia sucesivamente a valores entre L y H.
* `succ(X, Y)`: Y es X + 1 (o X es Y - 1).
* `abs(X)`: Valor absoluto de X.
* `max(X, Y)`: El mayor entre X e Y.
* `min(X, Y)`: El menor entre X e Y.
* `round(X)`: Redondea X al entero más cercano.
* `truncate(X)`: Trunca X (elimina la parte decimal).
* `floor(X)`: Redondea X hacia abajo al entero más cercano.
* `ceiling(X)`: Redondea X hacia arriba al entero más cercano.
* `sqrt(X)`: Raíz cuadrada de X.

## 10. Seguimiento de la Salida (Debugging) (Slide 26)

Prolog permite rastrear la ejecución para depuración:

* `trace.` : Activa el modo de rastreo. Muestra las metas que Prolog intenta satisfacer.
* `notrace.` : Desactiva el modo de rastreo.

Ejemplo: Rastreando `¿Pam es madre de quién?` (`mother(pam, Y).`)

La salida del rastreo tomaría `X = pam` e `Y` como variable, y `Y` sería `bob` como respuesta.

## 11. Temas Avanzados (Mencionados para Tercera Sesión - Slide 55)

* Estructuras de datos y recursión (profundización).
* Backtracking (mecanismo fundamental de Prolog).
* `Diferente` y `no` (negación).
* Estudio de caso: Árbol.
* Programas básicos:

  * Mínimo y máximo.
  * Circuitos resistivos.
  * Segmentos de recta.
  * Torre de Hanoi.
  * Listas enlazadas.
  * El mono y el plátano (problema clásico de IA).

Este reporte cubre los aspectos fundamentales de Prolog presentados, desde su estructura básica de hechos y reglas hasta operaciones más complejas con listas y control de flujo.
