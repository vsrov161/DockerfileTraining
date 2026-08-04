## Dockerfile training 
- Exercise: to create Dockerfile with dummy python project, clone it to server, run and test if it's working

## Step by step actions (VirtualBox Ubuntu 24.04 local server)
- sudo -i
- mkdir -p /opt/app && cd /opt/app
- git clone https://github.com/vsrov161/DockerfileTraining.git
- docker build -t flask_app_image . --no-cache
- docker run -d -p 80:5000 --name flask_app_cont flask_app_image

## Actions needed for VB
- Machine -> Network -> Port Forwarding -> **+** ADD NEW -> Name: Flask; Protocol: TCP; Host port: 80; Guest port: 80 -> OK
- now all set, go check http://localhost and you'll see output from container
