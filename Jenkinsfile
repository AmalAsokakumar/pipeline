pipeline{
agent any
    tools{
        maven 'my-maven'
    }
    stages{
        stage ('fetch code'){
            steps{
                //git branch: 'pipeline', credentialsId: 'git-cred', url: 'https://github.com/comrider/pipeline.git'
                git branch: 'pipeline', credentialsId: 'git-cred', url: 'https://github.com/comrider/pipeline.git'
                echo 'git repo found'
                //sh 'mvn clean sonar:sonar'
            }
        }
        stage('maven install'){
            steps{
                sh 'mvn clean install -DskipTests'
            }
            post{
                success{
                    echo 'bild success'
                    archiveArtifacts artifacts: '**/*.jar'
                }
            }
        }
        stage('unit test'){
            steps{
                sh 'mvn test'
            }
        }
    }
}
