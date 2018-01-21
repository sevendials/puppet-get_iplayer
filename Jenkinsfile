pipeline {
    agent {
        dockerfile {
          filename 'Dockerfile.jenkins'
          additionalBuildArgs '--build-arg JENKINS_PASSWD="$(getent passwd $USER)" --build-arg JENKINS_USER="$USER" --build-arg DOCKER_GROUP="$(getent group docker)"'
          args '-v /var/run/docker.sock:/run/docker.sock'
        }
    }
    stages {
        stage('Unit test') {
            steps {
                sh 'git config user.email "you@example.com"'
                sh 'git config user.name "Your Name"'
                sh 'printenv'
                sh 'rake spec_prep'
                sh 'puppet module --list --modulepath=spec/fixtures/modules'
                sh 'rake spec_standalone'
            }
        }
        stage('Acceptance test') {
            steps {
                sh 'sg docker "rake beaker:centos-7"'
            }
        }
    }
}
