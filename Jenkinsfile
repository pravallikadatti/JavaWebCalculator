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
    stage('transfer the code'){
        steps{
            nexusArtifactUploader artifacts: [[artifactId: 'webapp', classifier: '', file: '/var/lib/jenkins/workspace/pipeline/JavaWebCalculator/target/webapp-0.1.war', type: 'war']], credentialsId: 'nexus', groupId: 'com.web.cal', nexusUrl: '18.132.37.116:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '0.1'
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

