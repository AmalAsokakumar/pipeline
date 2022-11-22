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
        stage('integration test'){
            steps {
                sh 'mvn verify  -DskipUnitTests'
            }
        }
        stage('code analysis with checkstyle'){
            steps{
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                success{
                    echo "Generated Analysis Result"
                }
            }
        }
        stage('code analysis with sonarcube'){
            environment {
                scanneHome = tool 'sonar'
            }
            steps{
                withSonarQubeEnv('sq1'){
                sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                    -Dsonar.projectName=vprofile-repo \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=src/ \
                    -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                    -Dsonar.junit.reportsPath=target/surefire-reports/ \
                    -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                    -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
                timeout(time: 10, unit: 'MINUTES'){
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}

