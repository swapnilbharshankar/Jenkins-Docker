pipeline {
    agent any 
    parameters {
        choice(name: 'CHOICE', choices: ['section1', 'section2'], description: 'Pick something')
    }
    stages {
        stage ('Build Docker image')
        def customImage = docker.build("mynginx:${env.BUILD_ID}")
    }
    
}