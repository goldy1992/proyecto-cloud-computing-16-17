# Vagrant, VirtualBox y Chef-Solo

Esta configuración comprende un entorno de Ubuntu con los siguientes software preinstalados:

* Java Oracle 1.8


## Requesitos Para Ejecutar La Máquina Virtual

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Chef DK](https://downloads.chef.io/chef-dk/) (asegure que está añadido al PATH de su sistema operativo)
* [Vagrant Berkshelf](https://github.com/berkshelf/vagrant-berkshelf)

## Instrucciones del Depliegue

Ejecute ```vagrant up``` desde la línea de ordenes desde esta misma carpeta. Despúes de que esté desplegado la máqina virtual, el Berkshelf instalará todo el software aútomaticamente.

