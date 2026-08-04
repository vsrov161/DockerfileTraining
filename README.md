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

## Some screenshots from lab
<img width="361" height="321" alt="image" src="https://github.com/user-attachments/assets/dfc427c3-e7a3-40b3-82c4-146fc7d37bc9" />
<img width="1878" height="629" alt="image" src="https://github.com/user-attachments/assets/5c1a9303-7f16-42f2-aea5-d1c81378b8d8" />
<img width="1787" height="266" alt="image" src="https://github.com/user-attachments/assets/a3a9aab8-9adb-4d3a-9340-974f27a87f88" />
<img width="1418" height="190" alt="image" src="https://github.com/user-attachments/assets/76701481-dbf1-47be-87c8-6a6d6c6b03c3" />
<img width="592" height="318" alt="image" src="https://github.com/user-attachments/assets/94620d74-a972-44a8-9e42-3f3fb464efe6" />
