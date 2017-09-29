pipeline {
    agent {
        dockerfile true
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
