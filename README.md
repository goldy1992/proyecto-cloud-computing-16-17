# Aplicación de Comida a Domicilio Para Empresa de Multicadena

## Introducción al Problema

Hoy en día se ha vuelto más común ver cadenas de restaurantes que ofrecen el servicio de comida a domicilio. Empresas tales como [Dominos](http://www.dominospizza.es) tienen una forma de pedido donde puedes seleccionar una tienda que está cerca y hacer tu pedido desde tu casa. Estas empresas han invertido dinero para hacer una aplicación propria que permite que el usuario pueda pedir desde el móvil. El problema es que puede ser que las empresas start up no tengan el dinero suficiente para emplear a un equipo de desarrolladores para crear una aplicación así. Sería bueno si fuera un sistema disponible para poder hacer esto. Tal sistema tendría una aplicación que sería el punto de venta que enviaría el pedido a un API el cual redireccionaría el pedido al restaurante más cercano depende de la ubicación del usuario.

## Solución
Mi solución es crear una aplicación móvil que usa un punto de venta para hacer el pedido. La aplicación enviará el pedido junto con la ubicación a un API en la nube. Este API comunicará con varios micro servicios para encontrar el restaurante más cercano a la ubicación del usuario. Uno de los servicios sería el Location Manager el cual devolverá el restaurante más conveniente para hacer el pedido. Luego el API enviará el pedido al restaurante escodigo el devolver el response al usuario. Abajo hay un diagrama ilustrando la idea.


![diagrama](diagram.jpg)

Esto enseña el sistema básico. Para partirlo en más microservicios, se podría hacer un micosrvicio para verificar cuales son los restaurantes que están abiertos actualmente o tal vez un microservicio para verificar que todas las cosas en el pedido están en stock.


## La Arquitectura

### Aplicación Del Usuario
Se podría usar varias tecnologías para crear la aplicación y el punto de venta pero a efectos de este proyecto usaré el [Android SDK](https://developer.android.com/studio/index.html?hl=es-419) para comunicar con el API que estará desplegado en la nube. Usaré Android porque me daré la oportunidad de trabajar con el API lo cual he querido hacer por mucho tiempo.

La aplicación usará el API para enviar el pedido ademñas de reuperar los datos más actuales del menú.

### Restful API
Casi cualquier lenguaje de programación (dentro de los límites de lo razonable) tiene la funcionalidad de poder crear un API Restful. Sería fácil para mi crear el API using Java Spring desde que llevo un año trabajando con esa marca de trabajo. Sin embargo me gustaría experimentar con el Node js desde que estos días está muy de moda.

### Menu Service
El menú del restaurante se guardará en un microservicio a que la aplicación usuario y los sistemas de cada restaurante contactarán. El API the este servicio permitirá que los usuarios administrativos puedan cambiar los itemes en el menú. El menú mismo se guardará en un base de datos. Para simplificar todo, usaré el [MongoDB](https://www.mongodb.com/) porque tiene una forma con que es muy fácil interactuar y no hace falta que uses SQL.

### Sistema de Restaurante
El sistema de cada restaurante será lo mismo pero desplegado en la nube independientemente de los demás con su propia base de datos. El API del sistema tendrá la responsibilidad de pasar los pedidos para que el sistema las pueda procesar, y devolver los resultados al API REST principal. El sistema conectará a una base de datos que guardará el menú, recuperado del Menu Service, y el total de cada item.

### Location Service
Este servicio tendrá una base de datos que guardará la dirección IP de cada restaurante de la empresa junta con su ubicación. El servicio usará la ubicación del usuario, dado por el API REST, para encontrar el restaurante más cercano y devolver la dirección IP del restaurante óptimo. La base de datos será muy simple así que se puede usar el [MongoDB](https://www.mongodb.com/) y para calcular el restaurante más óptimo, pasará las ubicaciones al [Google Maps API](https://developers.google.com/maps/?hl=es-419) el cual devolvará el resultado. 

## Provisionamiento
Cuando deplegue mi aplicación en la nube, querré alguna forma automatica para instalar el sistema operativo y configurar. Para lograr eso usaré el software [Chef](https://www.chef.io/) para automatizar el proceso. He elegido Chef porque se puede usar para un sistema de solo una máquina o también para sistemas de más de uno. Es más, hay un [supermercado de recetas](https://supermarket.chef.io/) probado previamente y disponibles para usar, que instalan y configuran todo el software que quiero usar en una variedad de sistemas operativos. Eso es decir que me hará falta escribir poco código para crear mi infrastructura.