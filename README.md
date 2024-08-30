<img src=".banner.svg" alt="Banner" width="600" />


Run VS Code⁠ on any machine anywhere and access it through the browser. base on [code-server](https://hub.docker.com/r/codercom/code-server)

[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
![Release Workflow Status](https://github.com/amirtaherkhani/vscoder/actions/workflows/release.yml/badge.svg?branch=main)
[![GitHub Release](https://img.shields.io/github/v/release/amirtaherkhani/vscoder?include_prereleases)](https://github.com/amirtaherkhani/vscoder/releases)
![Docker Build](https://img.shields.io/github/actions/workflow/status/amirtaherkhani/vscoder/release.yml?logo=docker&label=Docker%20Build)
![Docker Pulls](https://img.shields.io/docker/pulls/amirmoth/vscoder?logo=docker&label=Docker%20Build)
![Docker Image Size](https://img.shields.io/docker/image-size/amirmoth/vscoder/latest?logo=docker&label=Docker%20Build)





## Installation

Self-Hosting Instructions
To run your own self-hosted instance of VSCode Server using this repository, follow these steps:

Prerequisites:

Ensure Docker and Docker Compose are installed on your server.
Open necessary ports on your firewall (e.g., port 8080).
Clone the Repository:

bash
Copy code
git clone https://github.com/amirtaherkhani/vscoder.git
cd vscoder
Initialize the Setup:

Run the initialization script to set up the environment:
bash
Copy code
./init.sh
Run the Server:

bash
Copy code
docker-compose up -d
Access the Server:

Visit http://your-domain:8080 or https://your-domain (if SSL is configured).
Security Considerations:

Set up strong authentication and regularly update your Docker images to maintain security.
This process provides a fully functional, self-hosted VSCode environment.

## Deployment
Clone the repository:

bash
Copy code
git clone https://github.com/amirtaherkhani/vscoder.git
cd vscoder
Build and run the container:

bash
Copy code
docker-compose up --build
Access VSCode via http://localhost:8080.

Customization
Modify the Dockerfile or docker-compose.yml to customize the setup according to your needs.
