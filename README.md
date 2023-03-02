Pipeline Overview -

Our CI/CD pipeline is designed to automate the build and deployment process for our application using DevOps tools. The pipeline consists of the following stages:

1. Build: This stage builds the project using Maven by running the mvn clean install package command. The resulting WAR file is stored in the target directory.

2. Publish to Nexus: This stage publishes the WAR file to a Nexus repository. The repository name is determined based on whether the version of the project ends with "SNAPSHOT" or not.

3. Print Environment Variables: This stage prints the values of the Maven environment variables for the project, including the Artifact ID, Version, Group ID, and Name.

4. Deploy to Tomcat: This stage deploys the WAR file to a Tomcat server using Ansible. It runs an Ansible playbook that downloads the WAR file and deploys it to Tomcat.

5. Deploy to Docker: This stage deploys the WAR file to a Docker container using Ansible. It runs an Ansible playbook that downloads the WAR file and deploys it to the Docker container.

We are using Terraform to provision our infrastructure.

<img width="800" src="https://user-images.githubusercontent.com/123365436/216541124-22db2972-f2a2-47dd-b075-e2b5fa25f914.PNG">
