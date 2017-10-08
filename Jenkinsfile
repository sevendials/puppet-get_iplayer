pipeline {
    agent {
        dockerfile {
          filename 'Dockerfile.jenkins'
          additionalBuildArgs '--build-arg JENKINS_PASSWD="$(getent passwd $USER)"'
          args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Unit test') {
            steps {
                sh 'git config user.email "you@example.com"'
                sh 'git config user.name "Your Name"'
                sh 'printenv'
                sh 'rake spec'
            }
        }
        stage('Acceptance test') {
            steps {
                sh 'echo rake beaker:centos-7'
            }
        }
    }
}
