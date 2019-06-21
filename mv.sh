#!/bin/bash

##En este escrito de bash vamos a realizar automatización de la creación de una
##maquina virtual con comandos de VBoxManage. Quizá por completitud deberíamos
##comprobar inicialmente si existe tal programa en el sistema, pero no es el
##objetivo de este script ser funcional, solo ser efectivo. Por tanto haremos
##todas las tareas SIN TENER EN CUENTA LOS ERRORES

#Creación de un disco Virtual y dinámico para la máquina, tomando su nombre
#como parámetro
VBoxManage createhd --filename MV.vdi --size 12000


#El tipo de máquinas Virtuales se podría también pasar como parametro, pero lo vamos a dejar fijo Ubuntu_64. Con esto la creación de una máquina virtual pero aún falta hacer las asociaciones
VBoxManage createvm --name MV --ostype "Linux26_64" --register

#Añadimos un controlador SATA al disco duro virtual creado
VBoxManage storagectl MV --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach MV --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium MV.vdi

#Añadimos un controlador IDE para la máquina virtual creada y como no, la imagen de SO
VBoxManage storagectl MV --name "IDE Controller" --add ide
VBoxManage storageattach MV --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium /home/jose/Descargas/lmde-2-201701-mate-32bit.iso

#Añadimos ciertas configuraciones por defecto que nos harán la vida más fácil cuando la encendemos por primera vez
VBoxManage modifyvm MV --ioapic on #soporte para I/O APIC
VBoxManage modifyvm MV --boot1 dvd --boot2 disk --boot3 none --boot4 none #Secuencia de medios para iniciar
VBoxManage modifyvm MV --memory 1024 --vram 128 #memoria de la máquina y memoria de video
VBoxManage modifyvm MV --nic1 bridged --bridgeadapter1 e1000g0 #tipo de conexión de red con la máquina anfitriona


