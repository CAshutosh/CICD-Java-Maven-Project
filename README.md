SERVICES
DOCUMENTS
Untitled Document.md
PREVIEW AS 
EXPORT AS 
SAVE TO 
IMPORT FROM 
DOCUMENT NAME
Untitled Document.md
MARKDOWNPREVIEWToggle Mode
  
<p class="has-line-data" data-line-start="0" data-line-end="1">DevOps CICD Project</p>
<p class="has-line-data" data-line-start="2" data-line-end="3">In this DevOps CICD project I have created end to end pipeline for deploying the build artifacts to the two different servers which is Tomcat Server and Docker container.</p>
<p class="has-line-data" data-line-start="4" data-line-end="10">Let’s understand the complete end to end flow -<br>
1. I have used Terraform to provision the infrastructure on AWS cloud.<br>
2. When developer will push the latest changes to GitHub, then Jenkins build will trigger and Jenkins will build the code and create artifact using maven.<br>
3. Once artifacts are ready then Jenkins will upload the artifacts to Nexus repository.<br>
4. As we are deploying the build artifacts to two different servers, that is why I have created two different ansible playbooks to download the artifacts from Nexus and deploy it to Apache Tomcat and Docker container.<br>
5. And I have also added static code analysis using Sonarqube.</p>
