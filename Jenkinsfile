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
    stage('logging into the docker hub'){
        steps{
        withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh 'docker login -u DOCKER_USERNAME -p DOCKER_PASSWORD'
}
        }
    }
    stage('tagging the docker image'){
        steps{
            sh 'docker tag calc anilkumare/calc'
        }
    }
    stage('tagging the docker image'){
        steps{
            sh 'docker push anilkumare/calc'
        }
    }
}
}
