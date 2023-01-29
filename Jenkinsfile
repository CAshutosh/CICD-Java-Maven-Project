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
                      credentialsId: '6c211ea1-7e53-4ab8-8c37-e295055b2dd2',
                      groupId: "${GroupId}",
                      nexusUrl: '3.238.80.102:8081',
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

        // stage("Deploy to Tomcat"){
        //     steps{
        //         echo 'Deploying.......'
        //         sshPublisher(publishers:
        //             [sshPublisherDesc(
        //                 configName: 'Ansible_Controller',
        //                 transfers:
        //                     [sshTransfer(
        //                         cleanRemote: false,
        //                         execCommand: 'ansible-playbook /opt/playbooks/DownloadAndDeployArtifactsTomcat.yaml -i /opt/playbooks/hosts',
        //                         execTimeout: 120000,
        //                         )
        //                     ],
        //                     usePromotionTimestamp: false,
        //                     useWorkspaceInPromotion: false,
        //                     verbose: false
        //                 )
        //             ]
        //         )
        //     }
        // }
        
    //     stage("Deploy to Docker"){
    //         steps{
    //             echo 'Deploying.......'
    //             sshPublisher(publishers:
    //                 [sshPublisherDesc(
    //                     configName: 'Ansible_Controller',
    //                     transfers:
    //                         [sshTransfer(
    //                             cleanRemote: false,
    //                             execCommand: 'ansible-playbook /opt/playbooks/DownloadAndDeployArtifactsToDocker.yaml -i /opt/playbooks/hosts',
    //                             execTimeout: 120000,
    //                             )
    //                         ],
    //                         usePromotionTimestamp: false,
    //                         useWorkspaceInPromotion: false,
    //                         verbose: false
    //                     )
    //                 ]
    //             )
    //         }
    //     }
    // }
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
