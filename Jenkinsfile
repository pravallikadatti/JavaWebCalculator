pipeline {
    agent any
    
  tools {
  maven 'mvn'
  git 'Default'
  }
    stages {
        stage ('clone job') {
            steps {
              git 'https://github.com/anilkumar3577/JavaWebCalculator.git'  
            }
        }
        stage ('build') {
            steps {
             sh 'mvn package'  
            }
        }
        stage ('deploy') {
            steps {
             sshagent(['tomcat']) {
           sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/job-1/webapp/target/webapp-0.1.war ec2-user@13.40.127.56:/home/ec2-user/apache-tomcat-8.5.93/webapps'
   }
            }
        }
    }
}
