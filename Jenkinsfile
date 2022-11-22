pipeline{
agent any
    tools{
        maven 'my-maven'
    }
    stages{
        stage('maven install'){
            steps{
                sh 'mvn clean install'
            }
            post{
                success{
                    echo 'bild success'
                    sh 'archiveArtifacts artifacrs: '**/*.jar'
                }
            }
        }
    }
}
