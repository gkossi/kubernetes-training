
# Infos sur le réalisateur du projet
Session       : Bootcamp DevOps N°15 chez Eazytraining

Nom & Prénoms : GBENOU Kossi

LinkedIn      : https://www.linkedin.com/in/gkossi/

# TP N°1 : MISE EN PLACE DE L'INFRA

Dans ce TP N°1, il est question de mettre en place une infrastructure basée sur Minikube (1 Master et 1 Worker) qui va de plateforme d'exploitation de Kubernetes.

# Les Technos utilisées :

<div align="center">

<!--img src="https://github.com/Tony-Dja/Jenkins_pipeline_HEROKU_deployment/blob/672b58d62fa5d424fb7162e33546c67f3bcbebc2/screenshots/jenkins.png" width="50%" height="50%"-->

<img src="<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0 0 48 48">
<path fill="#47667f" d="M36,35.5C36,29.7,30.9,25,24.5,25S13,29.7,13,35.5S18.1,46,24.5,46S36,41.3,36,35.5z"></path><path fill="#c5cad5" d="M35.5,35c0-5.3-4.9-9.6-11-9.6s-11,4.3-11,9.6s4.9,9.6,11,9.6S35.5,40.3,35.5,35z"></path><path fill="#c5cad5" d="M5,10l19,11v22L6,30L5,10z"></path><path fill="#6d83b3" d="M43,10L24,21v22l18-13L43,10z"></path><path fill="#5a6e91" d="M24.5,44.6c0.3,0,0.5,0,0.8,0l9.8-7.1c0.2-0.8,0.4-1.6,0.4-2.4c0-0.1,0-0.2,0-0.3L24,43l-10.5-7.6 c0.1,1,0.3,2,0.7,3l8.3,6C23.2,44.5,23.8,44.6,24.5,44.6z"></path><path fill="#eaf4f8" d="M5,10l19,11l19-11L24,1L5,10z"></path><path fill="#34495e" d="M11.6 9.9L24 17l12.4-7.1L24 4 11.6 9.9zM40 28l.6-12.9L27 23v14.4L40 28zM8 28L7.4 15.1 21 23v14.4L8 28z"></path><path fill="#eaf4f8" d="M29.7 16.4L26.6 14.4 28.3 10.6 23.7 12.2 25.4 8.5 17.7 11 20.7 6.9 18.8 5.9 19.2 5.1 22.2 6.5 20.3 9.1 27.1 6.8 25.6 10.5 30.2 8.9 27.9 14 30.3 15.6z"></path><path fill="#ecf0f1" d="M28.8 27.4c.1.5-.5 2.8-.5 3.1 0 .3-.2.5-.5.6-.1-.9-.2-1.7-.3-2.6 0-.2.2-.3.4-.4.1.7.1 1.4.2 2.1 0 0 .3-1.5.4-2.3C28.5 27.7 28.6 27.5 28.8 27.4zM38.8 22.4c-.1.3-.1.8-.5 1 0-.3.1-.5.2-.7.2-.4.2-.9 0-1.3-.1-.2.1-.3.2-.4.2-.1.1.2.3.2.2-.2.1-.6.4-.7.1.1 0 .2-.1.3-.2.5-.3 1 0 1.5.1.2 0 .3-.2.4 0 0-.1.1-.2-.1C38.8 22.6 38.8 22.5 38.8 22.4zM29 30c0-.6.1-1.2.1-1.8 0-.2.1-.4.3-.4 0 .7-.1 1.4-.1 2.1 0 .2-.1.2-.2.3C29 30.2 29 30 29 30zM29.5 26.8c.2.1 0 .4 0 .5 0 .1-.1.2-.2.2-.1 0-.1-.1-.1-.2C29.1 27.2 29.3 26.7 29.5 26.8zM19.8 29.7c-.4-.3-.7-.5-1.2-.8.1.4.2.7.5.9.3.2.5.4.8.6.1.1.2.1.1.3-.1.2-.2.1-.3 0-.9-.5-1.4-1.2-1.5-2.2 0-.1 0-.2 0-.3 0-.2 0-.5.3-.6.2-.1.4.1.5.2.2.2.5.3.7.5.1.1.2.2.1.3-.1.2-.2 0-.3 0-.2-.1-.3-.2-.5-.3-.1-.1-.4-.3-.4 0 0 .3 0 .3.2.4.3.2.6.4.9.7C19.9 29.4 19.9 29.4 19.8 29.7zM18.3 29.3c.1.1-.1.3-.2.2-.4-.3-.7-.5-1.1-.8-.2-.1-.2-.3-.2-.4-.1-.7-.1-1.4-.2-2.1 0-.1 0-.1.1-.1.1.1.2.2.2.3 0 .4.1.8.1 1.2.1.7.2.9.7 1.1C17.9 28.9 18 29 18.3 29.3zM29.8 29.6c0-.7.1-1.4.1-2.1 0-.2 0-.2.3-.2.1 0 .2-.4.4-.5 0 .2 0 .4-.2.6-.2.2-.2.4-.2.6 0 .4-.1.7-.1 1.1C30.2 29.4 30.1 29.5 29.8 29.6zM35.3 25.3c-.1 0-.2 0-.1-.1 0-.5.1-2 .2-2.3 0-.1.1-.3-.1-.3-.1 0-.2.1-.2.2-.1.3-.3 2.8-.1 3.1C35.1 26 35.3 25.6 35.3 25.3zM31.6 26.1c0 0-.2.2-.2 0 0-.2 0-.3 0-.5-.2 0-.2.1-.2.3 0 .3 0 .5-.3.8 0 0-.1.2 0 .2.2.4.1.7.1 1.1 0 .2-.1.6.1.7.3.1.5-.6.5-.6-.2 0-.2-.3-.2-.5 0-.4-.1-.8.3-1.1C31.7 26.4 31.6 26.3 31.6 26.1zM37.6 21.7c-.5.4-.6 1.1-.6 1.8 0 .3 0 .8.5.6.8-.4.7-1.3.7-2.1C38.2 21.5 38 21.4 37.6 21.7zM37.5 23.5c-.1 0-.1-.3-.1-.4 0-.4.1-1.1.4-1.1.1 0 .1.1.1.2C37.9 22.6 37.8 23.5 37.5 23.5zM12.7 25.6c-.2-.1-.3-.2-.4-.4-.3-.5-.5-1-.8-1.5.3.2.7.4.8.3.2-.2-.2-.6-.3-.7-.2-.1-.4-.3-.7-.5 0 .3.1 1.3.1 1.7 0 .1.1.2-.1.2-.1 0-.2-.1-.2-.2-.1-.4-.3-2.3-.2-2.4.7.5 1.6.9 1.7 2 0 .4-.1.6-.5.6.1.3.3.5.4.8C12.7 25.4 12.9 25.5 12.7 25.6zM16.4 27.8c-.3-.2-.5-.4-.8-.6-.4-.4-.6-.9-.6-1.4 0-.3.2-.4.5-.2.2.1.4.3.6.4.1 0 .1.2.2 0 .1-.1.1-.2-.1-.3-.3-.2-.6-.4-.9-.6-.2-.1-.4-.2-.5.1-.2.7 0 1.3.3 1.9.3.5.7.7 1.1 1.1 0 0 .2.2.3 0C16.6 28 16.6 27.9 16.4 27.8z"></path><path fill="#ecf0f1" d="M10.7 22.1c-.3-.6-1.4-1.2-1.4-1.3-.4-.3-.6-.2-.7.3 0 .4.1.7.2 1.1.2.8.8 1.2 1.4 1.6.5.3.7.2.7-.3C11 23 10.9 22.3 10.7 22.1zM10.6 23.3c-.1.1-.1.2-.3.1-.7-.2-1.4-1.1-1.4-1.9 0-.1 0-.3.1-.4.2-.1.3 0 .4.1.6.4 1.1.8 1.2 1.6C10.7 23.1 10.7 23.2 10.6 23.3zM36.8 23.4c-.2-.3-.1-.6 0-.9 0-.1.2-.7-.3-.7-.3 0-.7.4-.7.7-.1.5-.2 2.8-.2 2.8.3-.2.6-.4.8-.7C36.7 24.3 36.9 23.8 36.8 23.4zM36.4 23.9c0 .3-.1.5-.4.7 0-.3 0-.5 0-.7 0-.2.1-.3.3-.3C36.4 23.6 36.4 23.8 36.4 23.9zM36.4 22.6c0 .2-.1.4-.4.6 0-.3 0-.5 0-.7 0-.1.1-.2.2-.2C36.5 22.4 36.5 22.5 36.4 22.6zM33 25.1c-.3 0-.3.3-.3.4 0 0-.1 1.6-.1 1.7-.1.1-.1.2-.2.2-.1 0-.1-.2-.1-.3 0-.4 0-.7.1-1.1 0-.1.1-.4-.1-.3-.3 0-.3.3-.3.5 0 .5-.1.9-.1 1.4 0 .3.1.6.4.4.1-.1.3-.3.3-.5.4.1.3-.3.4-.5.1-.5.1-1 .1-1.5C33.1 25.4 33.1 25.2 33 25.1zM14.2 25.1c-.1-.3-.3-.7-.4-1 0-.1-.1-.2-.2-.2-.1 0-.1.1-.2.2l-.6 1.6c0 .1.2.3.4.1.1-.1.3-1 .5-1.4l.5 1.3c-.3 0-.6-.4-.7-.3-.2.2.4.6.7.8.2.1.3.5.4.6 0 .1.2.4.4.2C14.7 26.4 14.5 25.8 14.2 25.1zM33.9 24.3c-.6.4-.6.8-.4.8.1-.1.1-.2.2-.2.1-.1.2-.2.3-.1s.1.3 0 .4c-.1.1-.1.1-.2.2-.3.3-.5.8-.5 1.2 0 .1 0 .3.1.3.1 0 .2 0 .3-.1.1-.2.3-.4.6-.5 0-.6.1-1.1.1-1.9C34.4 24.1 34.1 24.2 33.9 24.3zM33.8 26.3c-.1 0-.1 0-.1 0 0-.3.1-.4.4-.6 0 0 0 0 0 0C34.1 25.9 34 26.1 33.8 26.3z"></path>
</svg>" width="45" height="45"/>
<img src="https://cdn-icons-png.flaticon.com/512/197/197443.png" width="45"/>
<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/vagrant/vagrant-original.svg" width="45" height="45"/>
<a href="https://git-scm.com/" target="_blank">
	<img src="https://github.com/devicons/devicon/blob/v2.15.1/icons/git/git-original.svg" width="45" height="45"/>
</a>
<a href="https://www.docker.com/" target="_blank">
	<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="45" height="45"/>
</a>
<a href="https://kubernetes.io" target="_blank">
	<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain-wordmark.svg" alt="kubernetes" width="45" height="45"/>
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
