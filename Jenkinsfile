pipeline{
    agent any
    tools {
        gradle 'gradle_8_4'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_id')
    }
    stages{
        stage('Build Gradle'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ritam1998/Devops-testing']])
                bat "./gradlew clean build"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t ritamde23/devops-integration:latest .'
                }
            }
        }
        stage('Login'){
            steps{
                echo $DOCKERHUB_CREDENTIALS
            }
        }
        stage('Push image to docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhubpassword')]) {
                        echo ${dockerhubpassword}
//                         bat 'docker login -u ritamdey.1998@gmail.com -p ${dockerhubpassword} '
                        bat 'docker push ritamde23/devops-integration:latest'
                    }
                }
            }
        }
    }
}