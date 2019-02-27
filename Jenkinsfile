pipeline {
    agent any 
    parameters {
        choice(name: 'CHOICE', choices: ['section1', 'section2'], description: 'Pick something')
    }
    stages {
        checkout scm
        stage ('Build Docker image')
        def customImage = docker.build("mynginx:${env.BUILD_ID}")
    }
    
}