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
                withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhubpassword')]) {
                    bat "docker login -u ritamdey.1998@gmail.com --password $dockerhubpassword "
                }
            }
        }
        stage('Push image to docker hub'){
            steps{
                script{
                   bat 'docker push ritamde23/devops-integration:latest'
                }
            }
        }
        stage('Deploy to K8s'){
            steps{
                script{
                    bat kubernetesDeploy (configs: 'kubernetes/deployment.yml', kubeconfigId: 'k8config')
                }
            }
        }
    }
}