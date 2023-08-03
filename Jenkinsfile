pipeline {
	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('alfredrozay')
	}

	stages {
		stage("GitHub Checkout") {
			steps {
				git branch: 'main', url: 'https://github.com/alfredrozay1/troubleshooting-jenkins.git'
			}
		}

		stage("Docker Build") {
			steps {
				sh "docker image build -t alfredrozay/alfred-things ."
			}
		}

		stage("Authenticate to DockerHub") {
			steps {
				echo 'Authenticating...'
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
				echo 'Login complete...'
			}
		}

		stage("Tag Image and Push to DockerHub") {
			steps {
				echo 'tagging...'
				sh "docker tag alfredrozay/alfred-things docker.io/alfredrozay/alfred-new-app:$BUILD_ID"
				echo 'pushing...'
				sh "docker push docker.io/alfredrozay/alfred-new-app:$BUILD_ID"
			}
		}

		stage("Logout") {
			steps{
				sh 'docker image rmi -f $(docker image ls -aq)'
				sh 'docker logout'
				echo 'Logout successful!'
			}
		}

	}

}