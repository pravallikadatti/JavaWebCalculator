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
            withSonarQubeEnv('sonar') {
                sh 'mvn sonar:sonar'
}
        }
    }
    stages {
    stage('transfer the code'){
        steps{
            
        }
    }
    
}  
}

