## Prerequisites

Docker is required to run this project.

### Install Docker

#### Linux

```bash  
curl -sSf https://get.docker.com | sh  
```  

#### MacOS

Follow the official Docker Desktop installation guide:  
https://docs.docker.com/desktop/setup/install/mac-install/

## Setup Instructions

1) Clone the Repository and Initialize:

   #### For Linux

```bash
git clone git@github.com:andryeyev/docker-apps-example.git $HOME/develop/example/docker-apps \
   && cd $HOME/develop/example/docker-apps/.docker \
   && make init-linux \
   && make up
```  
   #### For MacOS

```bash
git clone git@github.com:andryeyev/docker-apps-example.git $HOME/develop/example/docker-apps \
   && cd $HOME/develop/example/docker-apps/.docker \
   && make init-mac \
   && make up
```
This will:

- Clone the project
- Navigate to the Docker setup directory
- Initialize required services and dependencies
- Start the Docker containers

## Available Applications:

| Application | URL                   |  
|-------------|-----------------------|  
| Nest        | http://localhost:3000 |  
| Next        | http://localhost:3001 |  
| React       | http://localhost:3002 |

### Notes

For further customization or troubleshooting, refer to the .docker/Makefile.

Use make down to stop and remove containers when needed

```bash
make stop
```  

```bash
make reload
```  

```bash
make down
```