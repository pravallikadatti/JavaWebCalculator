pipeline {
    agent any
    tools {
  git 'Default'
  maven 'mvn'
  dockerTool 'docker'
}
stages {
    stage('build the code'){
        steps{
            sh 'mvn package'
        }
    }
    stage('builing the docker image'){
        steps{
            sh 'docker build -t calc .'
        }
    }
}
}
