# devops-novinano
This is a small automatization for 
app which was created by wordpress \
\
Here is a Jenkinsfile (what to do when start build)\
and it has the following steps:
* Build a docker image
* Push image to dockerhub
* Deploy infrastructure
* Deploy app in kubernetes
* Clean workspace
* Push notification of build's status

Dockerfile for creating application's image. \
\
Kubernetes as a platform where deploys app. \
\
Nginx as a reverse proxy for Jenkins master. \
\
Infrastructure as a code written by using Terraform in AWS cloud. \
I have used such resources as:
* AWS ECS
* VPC
* IAM policy and roles
* Cluster node group
* Security group

\
The workflow have next steps:
* Do some changes into remote repo
* Webhook trigerred jenkins build
* Start building (steps described above)
