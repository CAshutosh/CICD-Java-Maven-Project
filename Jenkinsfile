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
                    nexusArtifactUploader artifacts: 
                    [
                      [
                        artifactId: "${ArtifactId}",
                        classifier: '',
                        file: "target/${ArtifactId}-${Version}.war",
                        type: 'war'
                      ]
                    ],
                      credentialsId: 'df7a0d88-962d-47a4-8aaa-5682b00ec44c',
                      groupId: "${GroupId}",
                      nexusUrl: '54.83.182.4:8081',
                      nexusVersion: 'nexus3',
                      protocol: 'http',
                      repository: "${NexusRepo}",
                      version: "${Version}"
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
                sshPublisher(publishers:
                    [sshPublisherDesc(
                        configName: 'Ansible_Controller',
                        transfers:
                            [sshTransfer(
                                cleanRemote: false,
                                execCommand: 'ansible-playbook /opt/playbooks/DownloadAndDeployArtifacts.yaml -i /opt/playbooks/hosts',
                                execTimeout: 120000,
                                )
                            ],
                            usePromotionTimestamp: false,
                            useWorkspaceInPromotion: false,
                            verbose: false
                        )
                    ]
                )
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
