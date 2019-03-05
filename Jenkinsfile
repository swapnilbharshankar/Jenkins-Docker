pipeline {
    agent any 
//    parameters {
//        choice(name: 'CHOICE', choices: ['section1', 'section2'], description: 'Pick something')
//    }
    stages {
        stage ('Checkout Git') {
            steps {
                checkout scm
            }
        }
        stage ('Build Docker image') {
            environment {
                DOCKER_CREDENTIALS =credentials('docker_login')
            }
            steps {
                echo 'Starting to build docker image'
                script {
//                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage = docker.build("${env.DOCKER_CREDENTIALS_USR}/my-image:${env.BUILD_ID}")
                }
            }
        }
        stage ('VAR') {
            steps {
                echo "Define Vars"
                script {
                    def docker_image = sh (script: "docker images | awk '{print $1":"$2}' | awk 'NR==2'", returnStdout: true)
                    echo "${docker_image}"
                }
            }
        }
        stage ('Change the Variable') {
            steps {
                echo "Changing the Variables"
                script {
                    echo "${customImage}"
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
                            customImage.push("${env.BUILD_NUMBER}")
                            customImage.push('latest')
                        }
                    }
                }
            }
        }
    }
}