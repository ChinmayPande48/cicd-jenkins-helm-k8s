pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ChinmayPande48/cicd-jenkins-helm-k8s'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t hello-fastapi:v2 .
                '''
            }
        }

        stage('Deploy with Helm') {
            steps {
                sh '''
                helm upgrade --install hello-fastapi ./helm-chart --set image.tag=v2
                '''
            }
        }
    }
}

/*
pipeline {
  agent any

  environment {
    IMAGE_NAME = "hello-fastapi"
    TAG = "v${env.BUILD_NUMBER}"
    CHART_DIR = "helm-chart/hello-chart"
    RELEASE_NAME = "fastapi-release"
    NAMESPACE = "default"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image in Minikube') {
      steps {
        sh """
          echo "Setting Docker env to Minikube"
          eval \$(minikube -p minikube docker-env)
          docker build -t ${IMAGE_NAME}:${TAG} .
        """
      }
    }

    stage('Deploy with Helm') {
      steps {
        sh """
          helm upgrade --install ${RELEASE_NAME} ${CHART_DIR} \
            --set image.repository=${IMAGE_NAME} \
            --set image.tag=${TAG} \
            --namespace ${NAMESPACE} --create-namespace
        """
      }
    }
  }

  post {
    success {
      echo "Successfully deployed ${IMAGE_NAME}:${TAG} to Minikube"
    }
    failure {
      echo "Deployment failed!"
    }
  }
}
*/
