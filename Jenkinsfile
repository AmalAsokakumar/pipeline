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
        }
    }
}