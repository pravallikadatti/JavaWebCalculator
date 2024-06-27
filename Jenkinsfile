pipeline {
    agent any
    tools {
  git 'Default'
  maven 'maven'
}
stages {
    stage('build the code'){
        steps{
            sh 'mvn package'
        }
    }
    stage('test the code'){
        steps{
            withSonarQubeEnv(credentialsId: 'sonar') {
                sh 'mvn sonar:sonar'
}
        }
    }
    
}  
}

