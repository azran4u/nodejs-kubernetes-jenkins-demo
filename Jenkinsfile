#!groovy

IMAGE_NAME = "eyala/nodejs-hello:${BUILD_NUMBER}"
NAMESPACE = "dev"

node {
     
    stage ('Clean Workspace') {
        deleteDir()
    }    
    
    stage ('Checkout') {
        checkout scm
    }
    
    stage ('Install dependencies') {
        sh "npm install"
        sh "npm i -g typescript"
    }

    stage ('Build') {
        sh "npm run build"
    }
    
    stage('Build Docker image and Push') {
        withCredentials([usernamePassword(credentialsId:'94e3417c-5722-40d5-a852-93227cb2ad68', passwordVariable:'DOCKERHUB_PASS', usernameVariable:'DOCKERHUB_USER')]) {
            if ("${env.BRANCH_NAME}" == 'master') {
                sh "docker login -u ${DOCKERHUB_USER} -p ${DOCKERHUB_PASS}"
                sh "docker build -t ${IMAGE_NAME} ."
                sh "docker push ${IMAGE_NAME}"
                sh "docker rmi ${IMAGE_NAME}"
            }
        }
    }


    stage('Deploy to Kubernetes') {
        if ("${env.BRANCH_NAME}" == 'master') {
            sh "sed -i 's/BUILD_NUMBER/${BUILD_NUMBER}/g' k8s/nodejs-hello-world.yaml"                
            sh "kubectl apply -f k8s/nodejs-hello-world.yaml --namespace ${NAMESPACE}"
        }
    }
    
    stage ('Clean Workspace') {
        deleteDir()
    }    
}
