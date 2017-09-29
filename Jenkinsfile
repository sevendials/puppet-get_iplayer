pipeline {
    agent {
        dockerfile {
          filename 'Dockerfile.jenkins'
          additionalBuildArgs '--build-arg JENKINS_PASSWD="$(getent passwd $USER)"'
        }
    }
    stages {
        stage('Unit test') {
            steps {
                sh 'git config user.email "you@example.com"'
                sh 'git config user.name "Your Name"'
                sh 'bundle exec rake spec'
            }
        }
    }
}
