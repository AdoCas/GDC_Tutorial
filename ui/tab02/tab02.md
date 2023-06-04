# Obtención de credenciales de acceso al GDC

Introducción
La Genomic Data Commons (GDC) es una plataforma que proporciona acceso a una amplia variedad de datos genómicos y clínicos. Con el fin de acceder y utilizar los recursos disponibles en la GDC desde el entorno de programación R, es necesario obtener credenciales de acceso. Estas credenciales permiten autenticarse correctamente en la plataforma y acceder a los datos requeridos de manera segura y autorizada. En este apartado del tutorial, se explicará detalladamente el proceso de obtención de credenciales de acceso al GDC utilizando la librería GenomicDataCommons de R.

Pasos para obtener credenciales de acceso al GDC

### a) Registro en la plataforma GDC

El primer paso para obtener credenciales de acceso al GDC es registrarse en la plataforma. Para ello, es necesario visitar el sitio web oficial de la GDC e iniciar el proceso de registro. Proporciona la información solicitada, como tu nombre, dirección de correo electrónico y una contraseña segura. Asegúrate de leer y aceptar los términos y condiciones de uso de la plataforma.

### b) Creación de una aplicación en la GDC

Una vez que te hayas registrado en la plataforma, el siguiente paso es crear una aplicación en la GDC. Esta aplicación actuará como una interfaz entre tu código en R y la plataforma.

Para crear una aplicación, sigue estos pasos:

* Inicia sesión en la GDC con las credenciales que creaste en el paso anterior.
* Navega hasta la sección de "Aplicaciones" o "Aplicaciones de desarrollador" en la plataforma.
* Haz clic en el botón "Crear una nueva aplicación" o en un enlace similar.
* Proporciona un nombre descriptivo para tu aplicación y, opcionalmente, una descripción breve.
* Se te proporcionará un identificador único de la aplicación y un secreto de cliente. Estos datos serán necesarios para la autenticación en el siguiente paso.

### c) Autenticación en R utilizando la librería GenomicDataCommons

Una vez que hayas creado tu aplicación en la GDC, puedes proceder a autenticarte en R utilizando la librería GenomicDataCommons. Sigue estos pasos:

Asegúrate de tener la librería GenomicDataCommons instalada en tu entorno de R. Si no la tienes instalada, puedes hacerlo siguiendo los pasos detallados en el punto anterior de este tutorial

Importa la librería GenomicDataCommons en tu script de R utilizando el comando library(GenomicDataCommons).
Utiliza la función gdc_login() para iniciar el proceso de autenticación. Esta función tomará como argumentos el identificador de la aplicación y el secreto de cliente que obtuviste al crear la aplicación en la GDC. Por ejemplo:

```{r}
gdc_login(app_id = "tu_identificador_de_aplicacion", app_secret = "tu_secreto_de_cliente")
```

Una vez que hayas llamado a la función gdc_login(), se abrirá un navegador web en el que se te pedirá que inicies sesión en la plataforma GDC con las credenciales que proporcionaste durante el registro.

Después de iniciar sesión correctamente, se generará un token de acceso que se almacenará en tu entorno de R.

¡Enhorabuena! Ahora estás autenticado en la plataforma GDC y puedes comenzar a utilizar la librería GenomicDataCommons para acceder a los datos genómicos y realizar análisis en R.