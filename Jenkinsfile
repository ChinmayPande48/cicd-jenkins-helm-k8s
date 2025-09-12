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