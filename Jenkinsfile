pipeline {
    agent any 
//    parameters {
//        choice(name: 'CHOICE', choices: ['section1', 'section2'], description: 'Pick something')
//    }
    stages {
        stage ('Build Docker image') {
            steps {
                echo 'Starting to build docker image'
                script {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                }
            }
        }
        stage ('Change the Variable') {
            steps {
                echo "Changing the Variables"
                script {
                    sed -i s/^image_name.*/'my-image:${env.BUILD_ID}'/g main.yml
                }
            }
        }
    }
    
}