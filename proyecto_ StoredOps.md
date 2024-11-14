
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



1. [CAPÍTULO I: INTRODUCCIÓN](#capítulo-i-introducción)
   
   1.1 [Procedimientos y funciones almacenadas](#procedimientos-y-funciones-almacenadas)
   
   1.2 [Problema de Investigación](#problema-de-investigación)
   
   1.3 [Alcance del proyecto](#alcance-del-proyecto)
   
   1.4 [Objetivo General](#objetivo-general)
   
   1.5 [Objetivos Específicos](#objetivos-específicos)

4. [CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS](#capítulo-iv-desarrollo-del-tema--presentación-de-resultados)

   4.1 [Diagrama relacional](#diagrama-relacional)
   
   4.2 [Diccionario de datos](#diccionario-de-datos)
   
   4.3 [Acceso al script del proyecto](#acceso-al-script-del-proyecto)

## CAPÍTULO I: INTRODUCCIÓN

### Procedimientos y funciones almacenadas

La gestión eficiente de la información es esencial para las concesionarias de vehículos, donde se manejan grandes volúmenes de datos relacionados con clientes, empleados, vehículos, pedidos y ventas. La dependencia de procesos manuales o sistemas no integrados genera errores, duplicación de datos y dificultades en el acceso a información clave, afectando la operación diaria. Este Trabajo Práctico propone el diseño e implementación de una base de datos relacional en SQL Server, que permita centralizar y optimizar la administración de la información, garantizando seguridad mediante roles y permisos, mejorando el rendimiento de consultas y transacciones, y asegurando la integridad de los datos. El proyecto busca responder a las necesidades inmediatas de la concesionaria, sentando las bases para una gestión más eficaz y escalable.

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

## Capítulo II Marco Conceptual 
En el ámbito de las bases de datos, la gestión eficiente y segura de la información requiere un entendimiento claro de varios conceptos fundamentales que guían su diseño y operación. A continuación, se presenta un marco conceptual que abarca los temas de manejo de permisos a nivel de usuarios, procedimientos y funciones almacenadas, optimización de consultas mediante índices y manejo de transacciones, incluyendo las transacciones anidadas. Manejo de permisos a nivel de usuarios La administración de permisos en una base de datos implica definir y gestionar los derechos de acceso y las restricciones asignadas a diferentes usuarios o roles. Esto se realiza mediante mecanismos como privilegios (SELECT, INSERT, UPDATE, DELETE) y roles predefinidos o personalizados, que garantizan la protección de los datos frente a accesos no autorizados. Este concepto es fundamental para asegurar la integridad, confidencialidad y disponibilidad de los datos, permitiendo un control granular sobre quién puede realizar acciones específicas en la base de datos. Procedimientos y funciones almacenadas Los procedimientos almacenados y las funciones son bloques de código predefinidos que se ejecutan en el servidor de la base de datos, optimizando el desempeño y la seguridad del sistema. Los procedimientos almacenados suelen utilizarse para ejecutar tareas complejas o recurrentes, mientras que las funciones devuelven un valor específico en función de parámetros de entrada. Ambos elementos promueven la reutilización del código, reducen la carga de la red y garantizan que las reglas de negocio se ejecuten de manera centralizada y consistente. Optimización de consultas a través de índices Los índices son estructuras auxiliares que mejoran la velocidad de acceso a los datos en una base de datos, reduciendo el tiempo de búsqueda para consultas frecuentes. Al crear índices en columnas clave, se optimizan operaciones como búsquedas, filtros y ordenamientos. Sin embargo, un uso excesivo o inapropiado de índices puede afectar el rendimiento en operaciones de escritura, como inserciones o actualizaciones. El diseño adecuado de índices balancea eficiencia y costo computacional. Manejo de transacciones y transacciones anidadas Las transacciones son unidades de trabajo indivisibles que aseguran la consistencia de la base de datos mediante las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad). Dentro de este marco, las transacciones anidadas permiten manejar operaciones dependientes entre sí, encapsulando transacciones menores dentro de una principal. Este enfoque es útil en procesos complejos, ya que facilita el manejo de errores y garantiza que los cambios sean reversibles si una parte del proceso falla, sin comprometer la integridad general de los datos. En conjunto, estos conceptos forman la base para un manejo eficiente y seguro de bases de datos modernas, impactando directamente en la calidad del desarrollo de sistemas de información y su alineación con objetivos organizacionales. 
## Capítulo III: Metodología seguida 
### Descripción de cómo se realizó el Trabajo Práctico
Para la realización de este trabajo, se siguieron diversos pasos que permitieron implementar y evaluar conceptos clave de bases de datos en SQL Server, tales como el manejo de permisos a nivel de usuario, el uso de procedimientos y funciones almacenadas, la optimización de consultas a través de índices y el manejo de transacciones. 
***Pasos Seguidos:*** 
1. Configuración de Usuarios y Permisos: El primer paso consistió en la creación y configuración de usuarios en la base de datos, asignándoles permisos específicos según el rol que desempeñan (Administrador, Vendedor y Cajero). Esto se hizo a través de comandos SQL como CREATE LOGIN, CREATE USER, y GRANT, siguiendo una estructura de roles que permite administrar el acceso a diferentes funcionalidades de la base de datos de manera eficiente. 

2. Implementación de Procedimientos y Funciones Almacenadas: Posteriormente, se implementaron procedimientos y funciones almacenadas que permiten realizar operaciones específicas en la base de datos de forma modular y reutilizable. Se diseñaron procedimientos que permiten consultar, insertar y manipular datos, y funciones que procesan y devuelven valores específicos dentro de consultas SQL. 
3. Optimización de Consultas mediante Índices: Para mejorar la eficiencia de las consultas, se crearon índices en columnas clave de las tablas. Esto incluyó tanto índices agrupados como índices de cobertura en columnas utilizadas frecuentemente en las consultas. El impacto de estos índices fue evaluado mediante pruebas de rendimiento antes y después de su implementación. 
4. Implementación de Transacciones y Manejo de Errores: Por último, se implementaron transacciones y transacciones anidadas para asegurar la atomicidad y consistencia de las operaciones en la base de datos. Se usaron comandos como BEGIN TRANSACTION, COMMIT, y ROLLBACK para controlar la ejecución de conjuntos de operaciones y garantizar la reversibilidad en caso de errores. 
***Dificultades Encontradas:***
Durante la implementación, se presentaron algunas dificultades en la configuración de permisos detallados para usuarios específicos, así como en el ajuste de índices que no afectaran negativamente el rendimiento de las inserciones. La integración de transacciones anidadas también requirió ajustes debido a los límites en la implementación de SQL Server para transacciones anidadas. 
### Herramientas (Instrumentos y Procedimientos) 
***Instrumentos y Procedimientos Utilizados:*** 
1. SQL Server Management Studio (SSMS): Herramienta principal utilizada para gestionar y probar los comandos SQL implementados, incluyendo la creación de usuarios, configuración de permisos, y optimización de índices. 
2. Consultas SQL y Scripts: Se desarrollaron scripts para automatizar la creación de usuarios, asignación de roles, y configuración de permisos. Además, se escribieron procedimientos almacenados y funciones para facilitar la gestión de los datos de la base de datos de la concesionaria. 
3. Pruebas de Rendimiento: Se realizaron pruebas antes y después de la creación de índices para medir los tiempos de respuesta en consultas, lo cual permitió evaluar la efectividad de los índices. 
4. Método de Revisión Bibliográfica: La consulta de documentación oficial y guías sobre SQL Server fue fundamental para comprender las mejores prácticas y aplicarlas correctamente en cada etapa del proyecto.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 

### Diagrama relacional
![diagrama_relacional](https://github.com/XyonaX/basesdatos_proyecto_estudio/blob/main/doc/esquema_relacional.jpeg)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


> Acceder a la siguiente carpeta para la descripción completa del script [scripts](script/script_ddl_proyecto.sql)

> Acceder a la siguiente carpeta para el script del lote de datos [scripts](script/script_insert_proyecto.sql)

> [Manejo de permisos a nivel de usuarios de base de datos](script/tema01_Manejo_de_permisos_a_nivel_de_usuarios/tema_Manejo_de_permisos_a_nivel_de_usuarios_de_base_de_datos.md) 

> [Procedimientos y funciones almacenadas](script/tema02_Procedimientos_y_funciones_almacenadas/Procedimientos_Funciones_Almacenadas.md)

> [Optimización de consultas a través de índices](script/tema03_Optimizacion_de_consultas_a_traves_de_indices/optimizacion_de_consultas_a_traves_de_indices.md)

> [Manejo de transacciones y transacciones anidadas](script/tema04_Manejo_de_transacciones_y_transacciones_anidadas/manejo_de_transacciones_y_transacciones_anidadas.md)

