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
    
    stage('deploy the code'){
        steps{
            sshagent(['tomcatt']) {
               sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipeline/JavaWebCalculator/target/webapp-0.1.war' 		

}
        }
    }
    
}  
}

