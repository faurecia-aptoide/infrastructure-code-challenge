# Challenge Solution

![Alt text](schema.png?raw=true "Schema")


## Docker Image

To generate the containerized image I used these commands on a ubuntu server 22.04 with docker and git installed.

Best practices dictates that a pipeline should be used to compile the code and create the image on a remote server or service. After this it should also upload it to a private repository with versioning enabled.

For this challenge I used my public DockerHub account (anfabio). So there's no need to compile the code and create the image again. But if you need you can use the script called "create_image.sh".


## Application Deployment

The solution can be up and running by executing a single script: install_minikube_and_deploy_app.sh

It will install docker and minikube to the local machine. I used a fresh ubuntu server 22.04 with 4 CPU cores, 8GB of RAM and 20GB od disk available. You can specify a custom port number as the first parameter. The default value is 8080.

The deployment create 2 Pods and a NodePort for the requests.

After the deployment is done the script will install haproxy to balance requests to the application on a custom port at localhost as requested.

If you have a browser installed it will try to open the application inside it as well as "curl" the url inside the terminal.

In the future the external balancer (haproxy) could be configured to send requests to more than one Kubernetes cluster.


To deploy using the default parameters:

curl -sL https://raw.githubusercontent.com/anfabio/infrastructure-code-challenge/master/install_minikube_and_deploy_app.sh | bash


To specify a custom port use:

curl -sL https://raw.githubusercontent.com/anfabio/infrastructure-code-challenge/master/install_minikube_and_deploy_app.sh | bash -s -- port

ex:
curl -sL https://raw.githubusercontent.com/anfabio/infrastructure-code-challenge/master/install_minikube_and_deploy_app.sh | bash -s -- 8080





# Faurecia Aptoide
## Infrastructure Code Challenge
Thank you so much for taking the time to work on our code challenge. We expect it to take approx 4h to complete and would be ideal if you can send it to us within 1 week timeframe. Please don't hesitate to contact us by email with whatever question you have about it.

### Node deployment
Our development team has built the following nodejs application that needs to be deployed and public accessible with high availability: https://github.com/nodejs/examples/tree/main/servers/express/api-with-express-and-handlebars

### Your task
Design and describe the stack for this application (a draw/schema would be nice)

Implement code to provision a local infrastructure based in Kubernetes. (Example: Minikube)

Implement code to deploy the application (any language or open source tool is permitted)

Application must be accessible on a custom port using localhost, after deploy browser should open in the website

The solution should be fault tolerance with high availability

The solution can be up and running by executing a single command/script

### We expect
The solution should be easy to manage/maintain, if this is not possible to achieve within the proposed time frame then please describe any futures changes

You should write a few lines explaining you development setup (how did you create or emulate the resources)

The code of the challenge written in a Git repository and zipped. Try to not write the entire program in one commit and version it as much as you can. For us, understanding your progress is valuable. You can also share a link to the Zip on a file sharing service in case your email provider doesn't allow for the attachment to be sent. In that case, please make sure that the file can be correctly downloaded using a incognito/private window.

### Extras / Optional
Application is deployed when provision is happening

The solution can be up and running by executing a single command/script

Design and implement a process for deploying new application versions with no downtime
