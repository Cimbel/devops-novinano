pipeline{
  agent{ label 'docker' }

  stages{
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

    stage("delete unnecessary images"){
      steps{
        sh "docker rmi gotechnies/php-5.6-alpine:latest"
	sh "docker rmi novinano_ts:v1"
	sh "docker rmi cimbel/novinano_ts:v1"
      }
    }
  }
}
