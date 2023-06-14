# Obtención de credenciales de acceso al GDC

La Genomic Data Commons (GDC) es una plataforma que proporciona acceso a una amplia variedad de datos genómicos y clínicos.

Mucha de la información proporcionada por la base de datos es de acceso público, no obstante hay una serie de datos a los que únicamente se puede acceder para descargarlos tras obtener una autorización específica.

En el caso de que necesitemos utilizar estos recursos de acceso controlado disponibles en la base de datos del GDC, es necesario obtener ciertas credenciales de acceso que nos permitan autenticarnos correctamente en la plataforma de manera segura y autorizada.

En este apartado del tutorial, se explicará detalladamente el proceso de obtención de credenciales de acceso a la información controlada del GDC y cómo utilizarlas desde la librería GenomicDataCommons de R.

Pasos para obtener credenciales de acceso al GDC


### a) Obtención de cuenta eRA Commons Account

El primer paso para obtener acceso a los datos disponibles en GDC es la obtención de una cuenta NIH eRA Commons.

Para obtener una cuenta eRA Commons, lo primero que hay que hacer es navegar a su sitio web [https://commons.era.nih.gov/](https://commons.era.nih.gov/) y acceder como miembro de una organización o institución.

En el caso de que pertenezcamos a una institución no reconocida o federada con este sitio, estos tres enlaces nos proporcionan la información y los requisitos necesarios para poder darla de alta:

* [Preguntas frecuentes de eRA Commons](https://era.nih.gov/faqs.htm).
* [Ayuda y tutoriales de eRA Commons](https://era.nih.gov/help-tutorials).
* [Ayuda y sistema de tickets de soporte de eRA Commons](http://grants.nih.gov/support/index.html).


### b) Obtención del acceso dbGaP

Una vez obtenida una cuenta eRA, debemos solicitar el acceso a la base de datos de Genotipos y Fenotipos (dbGaP por sus siglas en inglés).

Para ello, debemos navegar a su sitio web [Página de Login de dbGaP](https://dbgap.ncbi.nlm.nih.gov/aa/wga.cgi?page=login) y seguir las instrucciones que en ella se encuentran para obtener acceso a la plataforma y a la información controlada.

En los siguientes enlaces se nos proporciona la información para poder llevar a cabo este proceso con éxito:

* [Vídeo explicativo sobre el acceso a la información controlada](https://www.youtube.com/watch?annotation_id=annotation_747461745&feature=iv&src_vid=-3tUBeKbP5c&v=m0xp_cCO7kA)
* [Preguntas frecuentes de dbGaP](https://www.ncbi.nlm.nih.gov/books/NBK5295/)
* [Ayuda de la plataforma dbGaP](https://dbgap.ncbi.nlm.nih.gov/aa/wga.cgi?page=email&filter=from&from=login)


### c) Acceso a un proyecto de investigación

Una vez tenemos acceso a la información controlada de la plataforma dbGaP como investigadores, se nos muestra una página llamada "Mis proyectos" en la que se nos permiten dos opciones:
* Crear un nuevo proyecto de investigación (siguiendo los pasos requeridos tras hacer clic en la opción "Crear nuevo proyecto de investigación") 
* Revisar su proyecto y solicitar acceso a datos controlados (haciendo clic en "Revisar proyecto")

Una vez creado un proyecto de investigación, desde el mismo se puede solicitar el acceso a los distintos datasets existentes en la base de datos, y una vez concedido, ya podemos acceder al GDC para consultarlos.

### d) Registro en la plataforma GDC

Una vez conseguido el acceso a los datos restringidos, el siguiente paso es crear una aplicación en GDC para poder obtener un Token que nos permita autenticarnos desde R con la plataforma.

Para crear una aplicación, debemos seguir estos pasos una vez hayamos iniciado sesión en la plataforma:

* Navegamos hasta la sección de "Aplicaciones" o "Aplicaciones de desarrollador" en la plataforma.
* Hacemos clic en el botón "Crear una nueva aplicación".
* Proporcionamos un nombre descriptivo para la aplicación y una breve descripción.
* Se te proporcionará un identificador único de la aplicación y un token para autenticarnos con una duración máxima de 30 días. Estos datos serán los necesarios para la autenticación en el siguiente paso.

### e) Autenticación desde R utilizando la librería GenomicDataCommons para acceder a la información controlada

El token proporcionado nos permite acceder a la información controlada para poder descargarla y operar con ella sin restricciones.

Al tratarse de una clave de autenticación secreta y cambiante en el tiempo, la librería GenomicDataCommons contempla que el Token esté informado a nivel de sistema en una variable de entorno llamada *GDC_TOKEN*, en un fichero llamado *GDC_TOKEN_FILE* o en un fichero oculto llamado *.gdc_token*

Con el fin de automatizar el acceso al mismo, la librería nos proporciona la función *gdc_token()*, que nos automatiza la consulta del mismo en los elementos comentados anteriormente.

Una vez definido el correspondiente token a nivel de sistema, podemos comprobar que la función lo devuelve correctamente con una instrucción como la siguiente:

```{r}
token = try(gdc_token(),silent=TRUE)
token
```

Una vez tenemos el token debidamente reconocido, veremos posteriormente como utilizarlo para poder descargar la información de acceso restringido.