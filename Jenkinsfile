pipeline{
    // Directives
    agent any

    tools {
        maven "maven"
    }

    environment{
        ArtifactId = readMavenPom().getArtifactId()
        Version = readMavenPom().getVersion()
        Name = readMavenPom().getName()
        GroupId = readMavenPom().getGroupId()
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
                script{
                    def NexusRepo = Version.endsWith("SNAPSHOT") ? "WebApp-SNAPSHOT" : "WebApp-RELEASE"
                    nexusArtifactUploader artifacts: [[artifactId: "${ArtifactId}", classifier: '', file: "target/${ArtifactId}-${Version}.war", type: 'war']], credentialsId: '35e3840b-f830-4b4c-aed5-d8ab27180b03', groupId: "${GroupId}", nexusUrl: '10.0.101.214:8081', nexusVersion: 'nexus3', protocol: 'http', repository: "${NexusRepo}", version: "${Version}"
                }
            }
        }

        stage("Print Environment Variables"){
            steps{
                echo "Artifact ID is '${ArtifactId}'"
                echo "Version is '${Version}'"
                echo "Group ID is '${GroupId}'"
                echo "Name is '${Name}'"
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
