pipeline {
    agent { docker 'ruby:2.2.8' }
    stages {
        stage('Example Build') {
            steps {
                sh 'bundle install'
                sh 'git config --global user.email "you@example.com"; git config --global user.name "Your Name"'
                sh 'bundle exec rake spec'
            }
        }
    }
}
