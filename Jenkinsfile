pipeline {
    agent any 
    tools {
  git 'Default'
  maven 'mvn'
}
stages {
    stage ('clone the job'){
        steps{
        git 'https://github.com/anilkumar3577/JavaWebCalculator.git'
        }
    }
    stage ('build the job'){
        steps{
        sh 'mvn package'
        }
    }
    stage ('test the job'){
        steps{
          withSonarQubeEnv('sonar'){
        sh 'mvn sonar:sonar'
          }
        }
    }
    stage('transfer the artifacts'){
        steps{
           nexusArtifactUploader artifacts: [[artifactId: 'webapp', classifier: '', file: '/var/lib/jenkins/workspace/pipeline/target/webapp-0.1.war', type: 'war']], credentialsId: 'nexus', groupId: 'com.web.cal', nexusUrl: '3.8.233.41:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'repo1', version: '0.1'
        }
    }
stage('deploy the job'){
    steps {
    sshagent(['tomcat']) {
    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipeline/target/webapp-0.1.war ec2-user@18.171.233.34:/home/ec2-user/apache-tomcat-8.5.100/webapps'
}
    }
}
}
}
