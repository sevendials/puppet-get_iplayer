pipeline {
    agent {
        dockerfile {
            additionalBuildArgs '-f Dockerfile.jenkins'
        }
    }
    stages {
        stage('Unit test') {
            steps {
                sh 'bundle exec rake spec'
            }
        }
    }
}
