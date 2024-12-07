pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-docker-image') {
            steps {
                buildDockerImgage()
            }
        }
        stage('deploy-dev') {
            steps {
                deploy("DEV")
            }
        }
        stage('test-dev') {
            steps {
                runApiTests("DEV")
            }
        }
        stage('deploy-stg') {
            steps {
                deploy("STG")
            }
        }
        stage('test-stg') {
            steps {
                runApiTests("STG")
            }
        }
        stage('deploy-prd') {
            steps {
                deploy("PRD")
            }
        }
        stage('test-prd') {
            steps {
                runApiTests("PRD")
            }
        }
    }
}

def buildDockerImgage(){
    echo "Building docker image..."
    sh "docker build -t mtararujs/sample-book-app ."

    echo "Pushing image to docker registry.."
    sh "docker push mtararujs/sample-book-app"
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} env.."
}

def runApiTests(String environment){
    echo "API tests triggered on ${environment} env.."
}


