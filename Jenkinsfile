pipeline {
    agent any
    tools {
  git 'Default'
  maven 'maven'
}

    stages {
        stage('clone the code') {
            steps {
                sh 'git clone https://github.com/pravallikadatti/JavaWebCalculator.git'
            }
        }
        
        stage('build the code') {
            steps {
                sh 'mvn -f /var/lib/jenkins/workspace/java/JavaWebCalculator/pom.xml package'
            }
        }
        
        stage('test the code') {
            steps {
                withSonarQubeEnv('sonar') {
              sh 'mvn -f /var/lib/jenkins/workspace/java/JavaWebCalculator/pom.xml sonar:sonar'
}
            }
        }
        stage('send the code') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'webapp', classifier: '', file: '/var/lib/jenkins/workspace/java/JavaWebCalculator/target/webapp-0.1.war', type: 'war']], credentialsId: 'nex', groupId: 'com.web.cal', nexusUrl: '13.43.217.248:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '0.1'
            }
        }
        stage('deploy the job') {
            steps {
                sshagent(['tom']) {
           sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/java/JavaWebCalculator/target/webapp-0.1.war /home/ec2-user/apache-tomcat-8.5.100/webapps'	

                }
                
        }    }
    }
}
