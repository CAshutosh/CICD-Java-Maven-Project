DevOps CICD Project

In this DevOps CICD project I have created end to end pipeline for deploying the build artifacts to the two different servers which is Tomcat Server and Docker container.

Let's understand the complete end to end flow -  
	1. I have used Terraform to provision the infrastructure on AWS cloud.
	2. When developer will push the latest changes to GitHub, then Jenkins build will trigger and Jenkins will build the code and create artifact using maven.
	3. Once artifacts are ready then Jenkins will upload the artifacts to Nexus repository.
	4. As we are deploying the build artifacts to two different servers, that is why I have created two different ansible playbooks to download the artifacts from Nexus and deploy it to Apache Tomcat and Docker container.
	5. And I have also added static code analysis using Sonarqube.
