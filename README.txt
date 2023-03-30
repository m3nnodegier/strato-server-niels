https://www.strato.nl/faq/server/de-eerste-stappen-met-je-linux-vps/

https://www.strato.nl/faq/server/ssh-keys-aanmaken-om-in-te-loggen-op-je-strato-vps-linux/

key-passphrase = niels (all lowercase)

root wachtwoord: eVnjAHelCG9qEAMFJtGK

- install docker engine: https://docs.docker.com/engine/install/ubuntu/

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
apt install docker-compose
systemctl start docker

adduser niels  (password: niels)
visudo -> add following line: niels ALL=(ALL:ALL) ALL

Uiteindelijk user niels niet gebruikt, maar wel de user space /home/niels

- file aangemaakt die heet docker-compose.yml
  deze file bevat twee dockers 1 post-gress database en 2 pgadmin met bij behorende wachtwoorden etc.
  
start de content van de docker-file op met : 

cd /home/niels
docker-compose up -d (-d van deamon mode)
( als de docker image niet beschikbaar is wordt deze vanzelf opgehaald )

gestartte docker bekijken: 
docker-compose ps

docker stoppen: 
cd /home/niels
docker-compose down 



handig docker commando's:

docker image ls                 - laat gedownloaded images ziet
docker image rm <image-id>      - verwijder een docker image
docker container ls             - laat alle draaiende containers zien, bijna zelfde als docker-compose. Docker-compose laat alleen docker van docker-compose.yaml zien
docker container stop <docker-id> - stop een docker container, maar verwijderd de container niet
docker container rm <docker-id> - verwijderd een docker 
docker volume ls                - laat alle volume zien
docker volume rm <volume name/id> - verwijderen van volume

voorbeelden van docker-files etc....met react
https://github.com/docker/awesome-compose/tree/master/react-rust-postgres
