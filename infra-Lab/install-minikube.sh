#!/bin/bash

#-----------------------------------------------------------------------------------------------------
# SCRIPT D'INSTALLATION DES OUTILS POUR LES LABS KUBERNETES VIA MINIKUBE
#	Prérequis:
#	- Git: pour versionner le code source
#	- Docker: pour conteneuriser les applications afin d'utiliser les concepts de microservices
#	- Minikube: pour la mise en place d'un cluster Kubernetes (1 Master et 1 Worker)
#	- Jenkins: pour la réalisation du pipeline CI/CD
#	- Kubernetes: pour l'orchestration des conteneurs
# 	Repository utile : https://github.com/diranetafen/cursus-devops.git
#--------------------------------------------------------------------------------------------------------

#---1. mise à jour du système----------------------------------------------------------------------------
sudo yum update && sudo yum upgrade -y

#---2. installation de quelques paquets et dépendances nécessaires---------------------------------------
#installation de epel-release (extra package for enterprise linux)
sudo yum install -y epel-release
#installation d'autres paquets et dépendances nécessaires
sudo yum install -y curl wget yum-transport-https
#On va installer les paquets qui vont permettre d'installer la machine virtuelle MINIKUBE qui contient KUBERNETES
sudo yum install -y git libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
#On va installer le paquet permettant de faire le forwarding (mécanisme permettant d'avoir accès aux ressources du cluster à partir de l'extérieur)
sudo yum install -y socat
#On va installer le paquet permettant de gérer l'utilisation du processeur sur notre machine
sudo yum install -y conntrack

#---3. INSTALLATION DE DOCKER----------------------------------------------------------------------------
#Récupérer le script d'installation de docker
curl -fsSL https://get.docker.com -o get-docker.sh
#Inspecter le contenu du script pour des raisons de sécurité (Optionnel)
cat get-docker.sh
#Vérifier les étape qui seront effectuées lorsque le script sera exécuté (pour des raison de sécurité)
sh get-docker.sh --dry-run
#Exécuter le script en mode root
sudo sh get-docker.sh
#Ajouter l'utilisateur vagrant au groupe docker
sudo usermod -aG docker vagrant
#Activer le démarrage automatique du service docker au démarrage de la machine
sudo systemctl enable docker
#Démarrer le service docker
sudo systemctl start docker


#---6. INSTALLATION DE MINIKUBE--------------------------------------------------------
# https://kubernetes.io/fr/docs/tasks/tools/install-minikube/

#On va Récupérer minikube
sudo wget https://storage.googleapis.com/minikube/releases/v1.28.0/minikube-linux-amd64
#On va le rendre exécutable
sudo chmod +x minikube-linux-amd64
#On va déplacer minikube dans le répertoire des binaires sous linux
sudo mv minikube-linux-amd64 /usr/bin/minikube
#On va Récupérer l'utilitaire de ligne de commande de minikube (kubectl)
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.0/bin/linux/amd64/kubectl
#On va le rendre exécutable
sudo chmod +x kubectl
#On va déplacer minikube dans le répertoire des binaires sous linux
sudo mv kubectl  /usr/bin/
#On va configurer le forwarding pour l'accès réseau
sudo su
sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
exit
#On va activer le service docker au démarrage
sudo systemctl enable docker.service
#On va installer minikube à partir du fichier rendu exécutable
su - vagrant -c "minikube start --driver=none --kubernetes-version v1.23.0"
yum install bash-completion -y
echo 'source <(kubectl completion bash)' >> ~vagrant/.bashrc
echo 'alias k=kubectl' >> ~vagrant/.bashrc
echo 'complete -F __start_kubectl k' >> ~vagrant/.bashrc


#---8. INSTALLATION DU SHELL ZSH-------------------------------------------------------------------------
if [[ !(-z "$ENABLE_ZSH")  &&  ($ENABLE_ZSH == "true") ]]
then
    echo "We are going to install zsh"
    sudo yum -y install zsh git
    echo "vagrant" | chsh -s /bin/zsh vagrant
    su - vagrant  -c  'echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
    su - vagrant  -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    sed -i 's/^plugins=/#&/' /home/vagrant/.zshrc
    echo "plugins=(git docker docker-compose helm kubectl kubectx minikube colored-man-pages aliases copyfile  copypath dotenv zsh-syntax-highlighting jsontools)" >> /home/vagrant/.zshrc
    sed -i "s/^ZSH_THEME=.*/ZSH_THEME='agnoster'/g"  /home/vagrant/.zshrc
else
    echo "The zsh is not installed on this server"
fi


IS_MINIKUBE_UP=$(curl -k https://localhost:8443/livez?verbose | grep -i "livez check passed")

if [[ ($IS_MINIKUBE_UP == "livez check passed") ]]
then
    echo -e "Everything is Good, minikube is ready. \nFor this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
else
    echo "Error, your minikube server (Kubernetes) is not running"
fi