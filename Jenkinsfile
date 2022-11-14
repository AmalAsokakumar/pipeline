pipeline{
    agent any
    tools {
        maven 'my-mvn'
    }
    environment{
        TEST = 'test'
    }
    stages{
        stage('build'){
            steps{
                echo "building the java app "
                sh 'printenv'
                //sh 'mvn clean package' 
            }
        }
    }
}