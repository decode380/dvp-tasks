# Gestor de tareas para Double V Partners



## Ejecutar servicios

### Consideraciones

- Tener disponible puertos 1443, 8080 y 8081 en el equipo para que se puedan ejecutar los 3 servicios.
- No se necesita ninguna configuración para poder correr el proyecto siempre y cuando se tenga docker y docker compose instalado en el equipo.

### Pasos
- Clonar repositorio añadiendo submodulos:

    `git clone --recursive https://github.com/decode380/dvp-tasks.git`

- Ejecutar servicios con docker compose:

    `docker compose up -d`

## Consumir servicios

- La base de datos de SQL Server se mantendrá servida en el puerto 1433 para poder utilizar cualquier administrador de base de datos con cualquiera de los dos usuarios preconfigurados en el levantamiento al `localhost:1433`:
    - usuario 'sa' con contraseña 'dvpTasks1234.'
    - usuario 'dvp_tasks' con contraseña 'DvpT4sk5'

- La web API está servida en el puerto 8081 al `http://localhost:8080/swagger/index.html` donde se podrá ver la documentación de swagger o consumir la API al `http://localhost:8080/`

- El front de React se encuentra servido en el puerto 8081 al `http://localhost:8081/login`


## Documentación

La documentación de las tecnologías y patrones implementados en los proyectos de la API y Front se encuentran en el respectivo repositorio (submodulos de este repositorio como principal).
