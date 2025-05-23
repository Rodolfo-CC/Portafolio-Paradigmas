+++
date = '2025-05-22T10:20:24-08:00'
draft = false
title = 'Práctica 3: Aplicación TODO en Haskell '
+++

## Tabla de Contenido

- [Tabla de Contenido](#tabla-de-contenido)
- [**Introducción**](#introducción)
- [**Descripción de la Aplicación "TODO"**](#descripción-de-la-aplicación-todo)
- [**Entorno de Desarrollo: Haskell y Stack**](#entorno-de-desarrollo-haskell-y-stack)
- [**Proceso de Desarrollo**](#proceso-de-desarrollo)
  - [**1. Creación del Proyecto**](#1-creación-del-proyecto)
  - [**2. Estructura del Proyecto**](#2-estructura-del-proyecto)
- [Implementación de Funcionalidades Clave](#implementación-de-funcionalidades-clave)
  - [**1. Módulo Principal de Lógica (`Lib.hs`)**](#1-módulo-principal-de-lógica-libhs)
  - [**2. Bucle de Interacción y Procesamiento de Comandos**](#2-bucle-de-interacción-y-procesamiento-de-comandos)
  - [**3. Gestión de Tareas (Añadir, Listar, Eliminar, Editar, Mostrar, Limpiar, Invertir)**](#3-gestión-de-tareas-añadir-listar-eliminar-editar-mostrar-limpiar-invertir)
  - [**4. Punto de Entrada de la Aplicación (`Main.hs`)**](#4-punto-de-entrada-de-la-aplicación-mainhs)
- [**Pruebas Unitarias**](#pruebas-unitarias)
- [**Compilación y Ejecución**](#compilación-y-ejecución)
- [**Conclusión**](#conclusión)

---

## **Introducción**

En este reporte voy a describir el desarrollo de una aplicación de consola para la gestión de listas de tareas (TODO list) utilizando el lenguaje de programación funcional Haskell. El objetivo principal fue comprender y estar familiarizados con los conceptos fundamentales de Haskell, su sintaxis, el manejo de entrada/salida (IO), la manipulación de listas y el uso de herramientas de desarrollo como Stack. Esta práctica se centró en la construcción de una aplicación funcional paso a paso, aplicando y adaptando conceptos de tutoriales y ejemplos existentes.

## **Descripción de la Aplicación "TODO"**

La aplicación desarrollada permite a los usuarios administrar una lista de tareas pendientes a través de una interfaz de línea de comandos. Proporciona funcionalidades básicas para crear, visualizar, modificar, eliminar e interactuar con las tareas.

La aplicación soporta los siguientes comandos principales:

-   **Añadir tarea (`+ texto_tarea`)**: Agrega una nueva tarea a la lista.
-   **Listar tareas (`l`)**: Muestra todas las tareas pendientes con un índice numérico.
-   **Eliminar tarea (`- índice`)**: Borra la tarea correspondiente al índice proporcionado.
-   **Editar tarea (`e índice`)**: Permite modificar el texto de una tarea existente.
-   **Mostrar tarea (`s índice`)**: Visualiza una tarea específica.
-   **Limpiar lista (`c`)**: Elimina todas las tareas de la lista.
-   **Invertir lista (`r`)**: Muestra las tareas en orden inverso.
-   **Salir (`q`)**: Termina la ejecución de la aplicación.

## **Entorno de Desarrollo: Haskell y Stack**

Haskell es un lenguaje de programación puramente funcional. Para este proyecto, se utilizó el compilador GHC (Glasgow Haskell Compiler).
**Stack** fue la herramienta empleada para la gestión del proyecto. Stack facilita la creación de proyectos, la gestión de dependencias, la compilación y la ejecución, asegurando un entorno de desarrollo consistente al manejar la instalación de GHC y las bibliotecas necesarias de forma aislada por proyecto.

## **Proceso de Desarrollo**

### **1. Creación del Proyecto**

Se inició un nuevo proyecto Haskell utilizando Stack con el comando:

```bash
stack new MiProyectoTodo # O el nombre que se haya usado, ej: Practica3
cd MiProyectoTodo
```

### **2. Estructura del Proyecto**

La estructura generada por Stack organiza el código fuente, los archivos de prueba y la configuración del proyecto. Los directorios y archivos más relevantes para esta práctica fueron:

-   `app/Main.hs`: Contiene el punto de entrada principal de la aplicación.
-   `src/`: Directorio para los módulos de la biblioteca. Aquí se encuentra `Lib.hs` para la lógica principal de la aplicación.
-   `test/Spec.hs`: Archivo para las pruebas unitarias.
-   `package.yaml`: Archivo de configuración del paquete, desde el cual Stack genera el archivo `.cabal` (ej. `Practica3.cabal`).
-   `stack.yaml`: Archivo de configuración específico de Stack para el proyecto.

## Implementación de Funcionalidades Clave

La lógica de la aplicación se centraliza en el módulo `Lib.hs` (ubicado en `src/`), mientras que `Main.hs` (en `app/`) sirve como un iniciador ligero.

### **1. Módulo Principal de Lógica (`Lib.hs`)**

Este módulo contiene las funciones que manejan el estado de la lista de tareas (representada como `[String]`), el procesamiento de comandos y la interacción con el usuario. Exporta funciones clave como `prompt` (el bucle principal de interacción) y `editIndex` (una función pura para modificar elementos en una lista).

### **2. Bucle de Interacción y Procesamiento de Comandos**

La función principal `prompt` en `Lib.hs` gestiona el ciclo de vida de la aplicación:

1.  Muestra un mensaje al usuario con los comandos disponibles y solicita uno.
2.  Lee la entrada del usuario.
3.  Si el comando es para editar (`e`), solicita la nueva descripción de la tarea y llama a `editTodo`.
4.  Para otros comandos, delega el procesamiento a la función `interpret`.
5.  Se llama recursivamente con el estado actualizado de la lista de tareas hasta que el usuario ingresa 'q'.

```haskell
-- Extracto simplificado del bucle en Lib.hs
module Lib (prompt, editIndex) where

import Data.List (isPrefixOf)
-- import System.IO (hFlush, stdout) -- No es estrictamente necesario si putStrLn se usa antes de getLine

type Tarea = String
type ListaTareas = [String]

prompt :: ListaTareas -> IO ()
prompt todos = do
    putStrLn ""
    putStrLn "Test todo with Haskell. You can use +(create), -(delete), s(show), e(dit), l(ist), r(everse), c(lear), q(uit) commands."
    command <- getLine
    if "e" `isPrefixOf` command
        then do
            putStrLn "What is the new todo for that?"
            newTodo <- getLine
            editTodo command todos newTodo -- Llama a la función específica para editar
        else interpret command todos

interpret :: String -> ListaTareas -> IO ()
interpret ('+' : ' ' : todo) todos = prompt (todo : todos) -- Añadir
interpret ('-' : ' ' : numStr) todos =
    case deleteOne (read numStr) todos of
        Nothing -> putStrLn "No TODO entry matches the given number" >> prompt todos
        Just todos' -> prompt todos'
interpret "l" todos = do -- Listar
    putStrLn ""
    print $ show (length todos) ++ " in total"
    mapM_ putTodo (zip [0 ..] todos)
    prompt todos
interpret "q" _ = return () -- Salir
interpret command todos = do -- Comando inválido
    putStrLn ("Invalid command: `" ++ command ++ "`")
    prompt todos

-- Función auxiliar para mostrar una tarea
putTodo :: (Int, String) -> IO ()
putTodo (n, todo) = putStrLn (show n ++ ": " ++ todo)

-- Otras funciones auxiliares como deleteOne, showOne, editTodo, editIndex, reverseTodos se definen en Lib.hs
```

### **3. Gestión de Tareas (Añadir, Listar, Eliminar, Editar, Mostrar, Limpiar, Invertir)**

-   **Añadir (`+ texto_tarea`)**: Se implementó un patrón para `'+' : ' ' : task` que añade la nueva tarea al principio de la lista (`todo : todos`).
-   **Listar (`l`)**: Muestra el total de tareas y luego utiliza `zip` para emparejar tareas con índices y `mapM_` junto con la función auxiliar `putTodo` para imprimirlas.
-   **Eliminar (`- índice`)**: Requiere convertir el índice (String) a `Int` (usando `read`). La función `deleteOne` maneja la lógica de eliminación de forma segura, devolviendo `Maybe ListaTareas` para indicar éxito o fallo (índice inválido).

    ```haskell
    -- Definición de deleteOne en Lib.hs
    deleteOne :: Int -> [a] -> Maybe [a]
    deleteOne 0 (_ : as) = Just as
    deleteOne n (a : as) = (a:) <$> deleteOne (n - 1) as -- Usando Functor instance de Maybe
    deleteOne _ [] = Nothing
    ```
-   **Editar (`e índice`)**: El comando de edición (`e índice`) primero solicita el nuevo texto de la tarea. La función `editTodo` coordina esto:
    *   Utiliza `editOne` (similar a `showOne`) para validar el índice y obtener la tarea antigua (devolviendo `Maybe Tarea`).
    *   Usa la función pura `editIndex` para crear la nueva lista de tareas. `editIndex` toma el índice, el nuevo texto y la lista original, y devuelve la lista modificada.
    *   Finalmente, muestra la tarea antigua, la nueva, y la lista actualizada.

    ```haskell
    -- Definición de editIndex en Lib.hs (exportada)
    editIndex :: Int -> a -> [a] -> [a]
    editIndex i x xs = take i xs ++ [x] ++ drop (i + 1) xs

    -- editTodo utiliza editOne y editIndex internamente
    editTodo :: String -> [String] -> String -> IO ()
    editTodo ('e' : ' ' : numStr) todos newTodo =
      case editOne (read numStr) todos newTodo of -- editOne valida el índice
        Nothing -> putStrLn "No TODO entry matches the given number" >> prompt todos
        Just oldTodo -> do
          putStrLn ""
          print $ "Old todo is " ++ oldTodo
          print $ "New todo is " ++ newTodo
          let newTodos = editIndex (read numStr :: Int) newTodo todos
          putStrLn ""
          print $ show (length newTodos) ++ " in total"
          mapM_ putTodo (zip [0 ..] newTodos)
          prompt newTodos
    editTodo _ todos _ = prompt todos -- Caso por si el formato del comando 'e' es incorrecto

    editOne :: Int -> [a] -> String -> Maybe a -- String no se usa, podría ser cualquier tipo 'b'
    editOne n todos _newTodo = -- newTodo no se usa aquí, solo se valida el índice
      if (n < 0) || (n >= length todos) -- Corregido n > length a n >= length
        then Nothing
        else Just (todos !! n)
    ```
-   **Mostrar (`s índice`)**: La función `showOne` se encarga de buscar una tarea por su índice, devolviendo `Maybe Tarea`. Si se encuentra, se imprime.

    ```haskell
    -- Definición de showOne en Lib.hs
    showOne :: Int -> [a] -> Maybe a
    showOne n todos =
      if (n < 0) || (n >= length todos) -- Corregido n > length a n >= length
        then Nothing
        else Just (todos !! n)
    ```
-   **Limpiar (`c`)**: Simplemente llama a `prompt []`, reiniciando la lista de tareas a una vacía.
-   **Invertir (`r`)**: La función `reverseTodos` implementa una inversión de la lista de tareas utilizando una función auxiliar `go` con un acumulador. La lista invertida luego se muestra de forma similar al comando `l`.

    ```haskell
    -- Definición de reverseTodos en Lib.hs
    reverseTodos :: [a] -> [a]
    reverseTodos xs = go xs []
      where
        go :: [a] -> [a] -> [a]
        go [] ys = ys
        go (x : xs') ys = go xs' (x : ys)
    ```
-   El manejo de `Maybe` en funciones como `deleteOne`, `showOne`, y `editOne` es crucial para gestionar operaciones que pueden fallar (índice inválido, formato incorrecto) de manera robusta, informando al usuario en lugar de causar un error en tiempo de ejecución.

### **4. Punto de Entrada de la Aplicación (`Main.hs`)**

El archivo `app/Main.hs` es ahora muy conciso. Importa la función `prompt` de `Lib` y la inicia con una lista de tareas vacía, después de mostrar un mensaje de bienvenida y la lista de comandos disponibles.

```haskell
-- Contenido de app/Main.hs
module Main where

import Lib (prompt)

main :: IO ()
main = do
    putStrLn "Commands:"
    putStrLn "+ <String> - Add a TODO entry"
    putStrLn "- <Int>    - Delete the numbered entry"
    putStrLn "s <Int>    - Show the numbered entry"
    putStrLn "e <Int>    - Edit the numbered entry"
    putStrLn "l          - List todo"
    putStrLn "r          - Reverse todo"
    putStrLn "c          - Clear todo"
    putStrLn "q          - Quit"
    prompt [] -- Iniciar con lista vacía
```

## **Pruebas Unitarias**

Se utilizó `test/Spec.hs` para probar funciones puras. Con la nueva estructura, funciones como `deleteOne`, `showOne`, `editIndex`, `editOne` (si se refactoriza para ser pura), y `reverseTodos` del módulo `Lib` son candidatas ideales para pruebas unitarias. Estas pruebas verifican que las funciones se comportan como se espera con entradas válidas e inválidas.

```haskell
-- Ejemplo simplificado de pruebas en Spec.hs usando Hspec
-- (Asegúrate de añadir hspec a las dependencias de test en package.yaml)
import Test.Hspec
import Lib (editIndex, deleteOne, reverseTodos, showOne) -- Asumiendo que Lib las exporta para testeo

main :: IO ()
main = hspec $ do
    describe "Lib.editIndex" $ do
        it "replaces an element at a valid index" $
            editIndex 1 "nuevo" ["a", "b", "c"] `shouldBe` ["a", "nuevo", "c"]
        it "handles index 0" $
            editIndex 0 "nuevo" ["a", "b"] `shouldBe` ["nuevo", "b"]
        -- Considerar pruebas para índices fuera de rango si se desea un comportamiento específico

    describe "Lib.deleteOne" $ do
        it "deletes an element at a valid index" $
            deleteOne 1 ["a", "b", "c"] `shouldBe` Just ["a", "c"]
        it "returns Nothing for an invalid negative index" $
            deleteOne (-1) ["a", "b", "c"] `shouldBe` Nothing
        it "returns Nothing for an out-of-bounds index" $
            deleteOne 3 ["a", "b", "c"] `shouldBe` Nothing
        it "deletes from an empty list correctly" $
            deleteOne 0 ([] :: [String]) `shouldBe` Nothing

    describe "Lib.reverseTodos" $ do
        it "reverses a list" $
            reverseTodos [1,2,3] `shouldBe` [3,2,1]
        it "reverses an empty list" $
            reverseTodos ([] :: [Int]) `shouldBe` []

    describe "Lib.showOne" $ do
        it "shows an element at a valid index" $
            showOne 1 ["a", "b", "c"] `shouldBe` Just "b"
        it "returns Nothing for an invalid index" $
            showOne 3 ["a", "b", "c"] `shouldBe` Nothing
```

## **Compilación y Ejecución**

La compilación del proyecto se realiza con:

```bash
stack build
```

Para ejecutar la aplicación (asumiendo que el ejecutable se llama `Practica3-exe` o similar, según `package.yaml`):

```bash
stack exec Practica3-exe
```

O de forma combinada:

```bash
stack run
```

Para ejecutar las pruebas:

```bash
stack test
```

## **Conclusión**

Esta práctica fue importante para obtener una comprensión básica pero sólida de Haskell y su ecosistema, incluyendo la herramienta Stack y la estructura típica de un proyecto (biblioteca en `src/` y ejecutable en `app/`). La aplicación TODO, aunque simple, permitió explorar conceptos cruciales del lenguaje como la inmutabilidad, las funciones de orden superior, el manejo de `IO`, el uso de tipos `Maybe` para la gestión de errores, y el pattern matching. Fue un reto al considerar el uso de recursos que requerían capacidades mayores a las que tenía en ese momento (como el almacenamiento disponible, aunque esta aplicación no persiste datos). Haskell ofrece una perspectiva diferente para la resolución de problemas, y aunque su adopción inicial puede ser algo compleja de entender, los beneficios en términos de robustez y expresividad son notables. La experiencia adquirida, aunque introductoria, sienta las bases para futuras exploraciones en la programación funcional.

---