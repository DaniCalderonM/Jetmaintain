# README
Descripcion del proyecto:
Este proyecto esta basado en un caso tipo que trata sobre un empresa llamada Jetmaintain, que se dedica al mantenimiento de motores de avión.
La aplicacion permite gestionar todos los mantenimientos preventivos y correctivos de los 
motores de sus clientes.
Esta aplicacion web permite que se creen dos tipos de usuarios segun los requerimientos, siendo administrador y operadores.
Los administradores pueden realizar todo el CRUD, mientras que los operadores solo pueden crear mantenciones de los motores. Cabe mencionar que para poder realizar estas acciones los usuarios deben estar registrados y con su sesion iniciada.

La aplicacion tambien cuenta con dos vistas principales las cuales pueden ser vistas por todos lo usuarios que seria el inicio y los terminos y condiciones.
Las aplicacion se rige con el patrón de arquitectura de Software MVC (Modelo Vista 
Controlador).

Como implementarlo en un ambiente de desarrollo:
Este proyecto se puede implementar en el entorno de desarrollo VSCode, para esto tambien necesitamos pgadmin para almacenar nuestras base de datos tanto de produccion como de tests, ademas de tener configurado nuestro terminal para poder escribir los comandos correspondientes para toda la creacion y ejecucion de nuestro proyecto y muy imporante tambien tener instalado ruby y rails.
En este sentido VSCode nos brinda de todo lo necesario para hacer funcionar nuestro codigo y de manera local, lo que lo hace muy amigable para hacer todas las pruebas necesarias y una vez que este listo poder desplegarlo de la mejor forma, como por ejemplo en render o digitalocean.
Para hacerlo funcionar en VsCode necesitamos utilizar correctamente los nombres de extension de los archivos, como por ejemplo: .rb y .erb
Los pasos son los siguientes:
Crear una nueva aplicación Rails a través del terminal con los comandos y conectarla a la base datos (postgres): rails new -nombreproyecto -d postgresql
Luego abrimos el proyecto y configuramos la base de datos en la ubicacion 'config/database.yml'.
Luego creamos todos los modelos y controladores necesarios, instalamos las gemas a utilizar y luego migramos todo.
Luego se definen las rutas y posteriormente se comienza con el desarrollo de la aplicacion.
Luego se ejecuta el servidor local con el comando en la terminal 'rails s'.
Y se abre por el navegador con la url local 'http://localhost:3000' y se comienza a realizar las pruebas y depuraciones.
Tambien podemos guardar nuestro proyecto en github para mantener un registro de nuestros cambios y colaborar con otros desarrolladores si es necesario.