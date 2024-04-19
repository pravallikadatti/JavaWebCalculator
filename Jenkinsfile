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

    stage('tagging the docker image'){
        steps{
            withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            
            sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} && docker tag calc anilkumare/calc'
        }
        }
    }
    stage('pushing the docker image'){
        steps{
            sh 'docker push anilkumare/calc'
        }
    }
    stage('running the docker container'){
        steps{
            sh 'docker run -dt --name con -p 8083:8080 anilkumare/calc '
        }
    }
}
}
