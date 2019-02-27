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
//                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage = docker.build("${env.DOCKER_CREDENTIALS_USR}/my-image:${env.BUILD_ID}")
                }
            }
        }
        stage ('Change the Variable') {
            steps {
                echo "Changing the Variables"
                script {
                    sh """sed -i s/^image_name.*/'image_name: my-image:${env.BUILD_ID}'/g main.yml"""
                }
            }
        }
        stage ('Push Image to Dockerhub') {
            environment {
                DOCKER_CREDENTIALS = credentials('docker_login')
            }
            steps {
                echo "Pushing Image to Dockerhub"
                script {
                    stage ('Push') {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker_login') {
                            customImage.push('latest')
                        }
                    }
                }
            }
        }
    }
}