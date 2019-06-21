# -*- mode: ruby -*-
# vi: set ft=ruby :

#Hay que tener claro que que llamamos al moduclo configure de vagrant y esta forma de referenciarlo
#sera sustituida por el alias config que esta entre |BLOQUE| de esta forma podemos componer una
#forma sencilla de componer nombres para hacer mas sencilla la configuracion mientras se accede a 
#los distintos modulos de configuracion de Vagrant.
Vagrant.configure("2") do |config|
	config.vm.define "web_1" do |web_1|
		web_1.vm.box = "ubuntu/trusty64"
  		web_1.vm.synced_folder "./www_1", "/var/www/html"
  		##config.vm.synced_folder "./www", "/var/www/html"	
		##Este comando quiere decir la que provision para la maquina virtual, desde la "shell" es script.sh
  		web_1.vm.provision "shell", path: "script.sh"
#Vagrant.configure.vm.provider
  		web_1.vm.provider :virtualbox do |vb1|
       			##customize usará vboxmanage modifyvm --name demo-00
       			vb1.customize [ 'modifyvm', :id, '--name', 'www_1' ]
       			##customize usará vboxmanage modifyvm --cpus 1
       			vb1.customize [ 'modifyvm', :id, '--cpus', '1']
      			##customize usará vboxmanage modifyvm --memory 720
       			vb1.customize [ 'modifyvm', :id, '--memory', '720']
			##customize usará vboxmanage modifyvm --cpuexecutioncap 60
			vb1.customize [ 'modifyvm', :id, '--cpuexecutioncap', '60']
			##vboxmanage modifyvm --natpf1 natpfrule,tcp,,8080,,80
			vb1.customize [ 'modifyvm', :id, '--natpf1', 'natpfrule,tcp,,8080,,80']
		end
	end

	config.vm.define "web_2" do |web_2|
		web_2.vm.box = "ubuntu/trusty64"
  		web_2.vm.synced_folder "./www_2", "/var/www/html"
  		##config.vm.synced_folder "./www", "/var/www/html"	
		##Este comando quiere decir la que provision para la maquina virtual, desde la "shell" es script.sh
  		web_2.vm.provision "shell", path: "script.sh"
#Vagrant.configure.vm.provider
  		web_2.vm.provider :virtualbox do |vb2|
       			##customize usará vboxmanage modifyvm --name demo-00
       			vb2.customize [ 'modifyvm', :id, '--name', 'www_2' ]
       			##customize usará vboxmanage modifyvm --cpus 1
       			vb2.customize [ 'modifyvm', :id, '--cpus', '1']
      			##customize usará vboxmanage modifyvm --memory 720
       			vb2.customize [ 'modifyvm', :id, '--memory', '720']
			##customize usará vboxmanage modifyvm --cpuexecutioncap 60
			vb2.customize [ 'modifyvm', :id, '--cpuexecutioncap', '60']
			##vboxmanage modifyvm --natpf1 natpfrule,tcp,,8008,,80
			vb2.customize [ 'modifyvm', :id, '--natpf1', 'natpfrule,tcp,,8008,,80']
		end
	end
end

