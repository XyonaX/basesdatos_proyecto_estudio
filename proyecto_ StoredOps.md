# Proyecto de Estudio!

**Universidad Nacional del Nordeste**

**Facultad de Ciencias Exactas Naturales y Agrimensura** 

**Carrera: Licenciatura en Sistemas de Información** 
    
# StoredOps
**Procedimientos y funciones almacenadas**

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Garcia Brenda
 - Leguiza Cecilia Agustina
 - Pinto Espíndola Malen Aymará
 - Vargas Portillo Jonatan Ezequiel

**Año**: 2024

# Índice

1. [Universidad Nacional del Nordeste](#universidad-nacional-del-nordeste)
   
   1.1 [Facultad de Ciencias Exactas Naturales y Agrimensura](#facultad-de-ciencias-exactas-naturales-y-agrimensura)
   
   1.2 [Carrera: Licenciatura en Sistemas de Información](#carrera-licenciatura-en-sistemas-de-información)

2. [StoredOps: Procedimientos y funciones almacenadas](#storedops-procedimientos-y-funciones-almacenadas)
   
   
   2.1 [Asignatura: Bases de Datos I (FaCENA-UNNE)](#asignatura-bases-de-datos-i-facena-unne)
   
   
   2.2 [Integrantes](#integrantes)
   
   2.3 [Año: 2024](#año-2024)

3. [CAPÍTULO I: INTRODUCCIÓN](#capítulo-i-introducción)
   
   3.1 [Procedimientos y funciones almacenadas](#procedimientos-y-funciones-almacenadas)
   
   3.2 [Problema de Investigación](#problema-de-investigación)
   
   3.3 [Alcance del proyecto](#alcance-del-proyecto)
   
   3.4 [Objetivo General](#objetivo-general)
   
   3.5 [Objetivos Específicos](#objetivos-específicos)

4. [CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS](#capítulo-iv-desarrollo-del-tema--presentación-de-resultados)

   4.1 [Diagrama relacional](#diagrama-relacional)
   
   4.2 [Diccionario de datos](#diccionario-de-datos)
   
   4.3 [Acceso al script del proyecto](#acceso-al-script-del-proyecto)

## CAPÍTULO I: INTRODUCCIÓN

### Procedimientos y funciones almacenadas

En este proyecto, abordaremos el uso de procedimientos y funciones almacenadas en bases de datos, centrándonos en cómo estas herramientas optimizan y estructuran la lógica de negocio dentro del propio sistema de gestión de bases de datos (SGBD). Los procedimientos almacenados permiten ejecutar conjuntos de instrucciones SQL de manera eficiente y segura, mientras que las funciones almacenadas proporcionan resultados específicos a partir de parámetros de entrada, mejorando la modularidad y reutilización del código.
El trabajo se centrará en la implementación de operaciones CRUD (Crear, Leer, Actualizar y Eliminar) para gestionar los datos dentro de la base de datos de manera estructurada, asegurando consistencia y eficiencia. También exploraremos las diferencias entre procedimientos y funciones, y su impacto en el rendimiento del sistema y la facilidad de mantenimiento.

### Problema de Investigación

El problema que aborda este trabajo es la necesidad de una mejor gestión de la información en concesionarias de vehículos, donde se manejan grandes cantidades de datos relacionados con clientes, empleados, vehículos, pedidos y ventas. La gestión manual o a través de sistemas no integrados genera errores, duplicación de datos y dificultades en el acceso a información clave para las operaciones diarias.
El problema se puede plantear en las siguientes preguntas de investigación:
-   ¿Cómo diseñar una base de datos eficiente que permita la gestión centralizada de            clientes, empleados, pedidos y ventas?
-   ¿Cómo aplicar roles y permisos a nivel de usuarios para garantizar la seguridad y           confidencialidad de los datos?
-   ¿Cómo mejorar el rendimiento de las consultas y transacciones en el sistema mediante la     implementación de índices y optimización de consultas?

### Alcance del proyecto

El alcance del trabajo incluye el diseño, implementación y optimización de una base de datos relacional utilizando SQL Server. Se abordarán las áreas esenciales de la concesionaria, tales como la gestión de clientes, empleados, vehículos, pedidos y ventas, y se incluirán mecanismos de seguridad y control de acceso. El sistema no abordará aspectos adicionales como la integración con sistemas externos o la implementación de interfaces de usuario avanzadas. El enfoque principal es la creación de la estructura de base de datos y la eficiencia en la gestión de la información.

### Objetivo General

Desarrollar una base de datos relacional para una concesionaria de vehículos que permita gestionar de manera eficiente las operaciones de la empresa, incluyendo la administración de empleados, clientes, vehículos, pedidos y ventas. El sistema será implementado utilizando SQL Server, aplicando conceptos de roles, permisos, procedimientos almacenados y optimización de consultas.

### Objetivos Específicos
-   1) Diseñar un modelo de datos que integre todas las entidades relevantes de la concesionaria, tales como clientes, empleados, vehículos, pedidos y facturas.
-   2) Implementar procedimientos almacenados y funciones para realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) sobre los datos de la concesionaria.
-   3) Aplicar roles y permisos de usuarios para garantizar la seguridad de los datos, permitiendo el acceso controlado a información confidencial según el perfil del usuario.
-   4) Optimizar las consultas a través de la creación de índices adecuados que mejoren el rendimiento del sistema y reduzcan los tiempos de respuesta en operaciones complejas.
-   5) Validar la integridad de los datos mediante la implementación de restricciones y relaciones entre tablas, garantizando la consistencia del modelo.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 

### Diagrama relacional
![diagrama_relacional](https://github.com/XyonaX/basesdatos_proyecto_estudio/blob/main/doc/imagen_relacional.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


> Acceder a la siguiente carpeta para la descripción completa del script [scripts](script/script_ddl_proyecto.sql)


