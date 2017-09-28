pipeline {
    agent {
        dockerfile {
            dir 'jenkins'
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
