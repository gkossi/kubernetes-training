
# Infos sur le réalisateur du projet
Session       : Bootcamp DevOps N°15 chez Eazytraining

Nom & Prénoms : GBENOU Kossi

LinkedIn      : https://www.linkedin.com/in/gkossi/

# TP N°1 : MISE EN PLACE DE L'INFRA

Dans ce TP N°1, il est question de mettre en place une infrastructure basée sur Minikube (1 Master et 1 Worker) qui va de plateforme d'exploitation de Kubernetes.

# Les Technos utilisées :

<div align="center">

<!--img src="https://github.com/Tony-Dja/Jenkins_pipeline_HEROKU_deployment/blob/672b58d62fa5d424fb7162e33546c67f3bcbebc2/screenshots/jenkins.png" width="50%" height="50%"-->

<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/virtualbox/virtualbox-original.svg" width="45" height="45"/>
<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/vagrant/vagrant-original.svg" width="45" height="45"/>
<a href="https://git-scm.com/" target="_blank">
	<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/git/git-original.svg" width="45" height="45"/>
</a>
<a href="https://www.docker.com/" target="_blank">
	<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="45" height="45"/>
	<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/docker/docker-original.svg" width="45" height="45"/>
</a>
<a href="https://kubernetes.io" target="_blank">
	<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain-wordmark.svg" alt="kubernetes" width="45" height="45"/>
	<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/kubernetes/kubernetes-original.svg" width="45" height="45"/>
</a>
<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/centos/centos-original.svg" width="45" height="45"/> 
<a href="https://www.gnu.org/software/bash/" target="_blank"> 
	<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/bash/bash-original.svg" alt="bash" width="45" height="45"/>  
</a>
</div>

<br />
<div align="center">

![Static Badge](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)       ![Static Badge](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)        ![Static Badge](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)     ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)     ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)

</div>


- VirtualBox : est un hyperviseur de type 2 qui va servir de provisioner à utiliser pour créer une VM
- Vagrant : c'est un gestionnaire d'infrastructure as Code qui va servir à configurer notre infra sous forme de code
- Vagrantfile: ce fichier contient tous les paramètres utilisés pour créer la machine virtuelle
- install-minikube.sh: ce fichier contient le script d'installation de Docker et de Docker-compose
- Git     : pour versionner le code source
- Docker  : pour conteneuriser les applications afin d'utiliser les concepts de microservices
- Minikube: pour la mise en place d'un cluster Kubernetes (1 Master et 1 Worker)
- Kubectl : la ligne de commande pour exploiter Kubernetes à partir de Minikube

My job is to :
1) Use Virtualbox as a hypervisor for the virtual machine creation
2) Use Vagrant as infrastructure provisioner to manage the VM
3) Install Docker and Docker-compose on the VM 
4) Build one container for each module (Backend & Fronted)
5) Make the containers interact with each other
6) Provide a private registry to store images


# My work plan

Here's my plan for this project:

- Firstly, I'm setting up my infrastructure from the code to be driven with the Vagrant tool (***Vagrantfile*** and ***install_docker-centos***). This will be a VM running the Centos7 OS with Docker and Docker-compose.

- Secondly, I'm going to do the build and make the necessary tests. This stage will involve several actions on my part.

- Then, as soon as the tests are correct, I proceed with the deployment



# The files and their roles

My delivery contain five main files : ***Vagrantfile***, ***install_docker-centos.sh***, ***Dockerfile***, ***docker-compose.yml*** and ***private-registry.yml***

- Vagrantfile: this file contains all the parameters used to create the virtual machine
- install_docker-centos.sh: this file contains the Docker and Docker-compose installation script




## Step N°1 : Building images

1) Enter the API directory and build it's container image :

```bash
#Enter the directory
cd ./mini-projet-docker/simple_api

#Buil the image
docker build -t student-list-api-image .

#Verify that the image is built and present localy
docker images
```
> ![1-docker images] ![](images/docker-images.jpg)
