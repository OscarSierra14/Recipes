# Recipes
 - En el siguiente proyecto se encuentra una app de recetas que consume APIS desde la plataforma mockable.io en ella encontraras.
 
 # Que se encuentra en la app 👇🏻
 
 1. Vista inicial Home que te brinda el listado de recetas junto con un buscador que permite hacer filtrado de estas recetas en cuestion, de igual forma se habilita la opcion de pull to refresh en el listado de esta misma view.
 2. Vista de detalle, a esta se accede danto click a cualquiera de las recetas del listado de Home.
 3. Mapa de la region en donde se origina la receta usando un marcador para mayor exactitud.
 
# Arquitectura 

- Se implementa VIPER para modular las funcionalidades en esta la construccion de vistas se configura de forma programatica.

# Librerias externas

- Como administrador de dependencias de usa Swift Package Manager (SPM) en ella implementamos SDWebImageView y Alamofire librerias que permiten 
1. Desgargar imagenes de forma azyncrona sin exceder el cupo de memoria
2. Hacer consumos de APIS las cuales se consumen en el proyecto.

# Como corro el proyecto ?

Para correr el proyecto es necesario validar que las dependencias han sido descargadas satisfactoriamente, cumpliendo esto es solo ejecutar (COMMAND + R)
