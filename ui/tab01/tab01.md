# Instalación del paquete GenomicDataCommons

La instalación del paquete GenomicDataCommons es un paso esencial para poder utilizar sus funcionalidades en el entorno de programación R. Este paquete, que forma parte de Bioconductor, proporciona una interfaz para acceder y analizar datos genómicos de la plataforma Genomic Data Commons (GDC).

Para realizar una instalación correcta, se deben seguir los siguientes pasos:

### a) Verificación de la versión de R:

Antes de proceder con la instalación del paquete GenomicDataCommons, es importante asegurarse de tener una versión actualizada de R. Esto es importante debido a que algunas funcionalidades del paquete pueden requerir características específicas de versiones recientes de R.

Para verificar la versión de R, se puede ejecutar el siguiente código en la consola de R:

```{r}
R.Version()$version.string
```

Estos ejemplos se han desarrollado utilizando la versión de R 4.2.3.


### b) Instalación de paquetes dependientes: 

GenomicDataCommons tiene dependencias adicionales que deben estar instaladas previamente para asegurar su correcto funcionamiento.

Algunos de estos paquetes incluyen httr, jsonlite, curl y digest. Estos paquetes se utilizan para realizar solicitudes HTTP, manipular datos en formato JSON y realizar operaciones criptográficas, respectivamente. Para instalar estos paquetes, se puede utilizar la función install.packages() de la siguiente manera:

```{r}
install.packages(c("httr", "jsonlite", "curl", "digest"))
```

### c) Instalación del paquete GenomicDataCommons

Una vez que las dependencias están instaladas, se puede proceder a la instalación del paquete GenomicDataCommons utilizando la función BiocManager::install(), que permite instalar paquetes desde el repositorio oficial de Bioconductor. Si no tienes instalado BiocManager, puedes instalarlo ejecutando el siguiente código:

```{r}
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
```

Después de tener BiocManager instalado, debemos ejecutar la siguiente línea de código para instalar el componente GenomicDataCommons:

```{r}
BiocManager::install("GenomicDataCommons")
```

### d) Carga del paquete GenomicDataCommons:

Una vez que la instalación se ha completado con éxito, se puede cargar el paquete GenomicDataCommons utilizando la función library():

```{r}
library(GenomicDataCommons)
```

Con estos pasos, se ha completado la instalación del paquete GenomicDataCommons y se encuentra listo para ser utilizado en R.

Es importante destacar que, durante el proceso de instalación, pueden surgir dificultades como problemas de dependencias faltantes o conflictos de versiones. En caso de enfrentar dificultades, es recomendable consultar la documentación oficial del paquete GenomicDataCommons, así como buscar ayuda en foros y comunidades en línea especializadas en R y Bioconductor. Además, es importante mantener actualizadas tanto R como las dependencias y paquetes utilizados, ya que las nuevas versiones pueden corregir errores y ofrecer mejoras en las funcionalidades.

Ahora que el paquete GenomicDataCommons está correctamente instalado, puedes explorar su documentación y comenzar a utilizar sus funciones para acceder y analizar datos genómicos de la plataforma GDC en R.