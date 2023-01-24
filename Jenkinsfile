pipeline{
    // Directives
    agent any
    tools {
        maven 'maven'
    }
    stages{
        stage("Build"){
            steps{
                sh 'mvn clean install package'
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