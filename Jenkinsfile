pipeline{
  agent{ label 'docker' }

  stages{
    stage("start pipeline"){
      steps{
        slackSend color: '#FFFF00', message: "STARTED   :large_yellow_square:   --->   Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
      }
    }

    stage("build docker image and push it into docker hub"){

      environment{
	DOCKER_USER = credentials('docker-username')
	DOCKER_PASS = credentials('docker-password')
      }

      steps{
       sh "docker login -u \$DOCKER_USER -p \$DOCKER_PASS"
       sh "docker build -t novinano_ts:v1 ."
       sh "docker tag novinano_ts:v1 \$DOCKER_USER/novinano_ts:v1"
       sh "docker push \$DOCKER_USER/novinano_ts:v1"
       sh "docker logout"
      }
    }

    stage("clean workspace"){
      steps{
        sh "docker rmi gotechnies/php-5.6-alpine:latest"
	sh "docker rmi novinano_ts:v1"
	sh "docker rmi cimbel/novinano_ts:v1"
	sh "rm -rf ./*"
      }
    }
  }

  post {
    success{
      slackSend color: '#00ff37', message: "SUCCESS   :large_green_square:   --->   Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
      }

    failure{
      slackSend color: '#FF0000', message: "FAILED   :large_red_square:   --->   Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    }
  }
}
