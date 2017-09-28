pipeline {
    agent { docker 'ruby:2.2.8' } 
    stages {
        stage('Example Build') {
            steps {
                sh 'bundle install'
                sh 'bundle exec rake spec'
            }
        }
    }
}
