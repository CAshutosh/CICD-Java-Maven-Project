pipeline{
    // Directives
    agent any
    tools {
        maven "maven"
    }
    stages{
        stage("Build"){
            steps{
                sh "mvn clean install package"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

        stage("Test"){
            steps{
                echo 'Tseting.......'
            }
        }

        stage("publish to nexus"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'WebApp', classifier: '', file: 'target/WebApp-0.0.2-SNAPSHOT.war', type: 'war']], credentialsId: '5939076f-5683-42d7-8edc-7c7f0775159f', groupId: 'com.devops', nexusUrl: '10.0.101.80:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'WebAPP-SNAPSHOT', version: '0.0.2-SNAPSHOT'
            }
        }

        stage("TestDeploy"){
            steps{
                echo 'Deploying.......'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
