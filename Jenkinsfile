pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('building-docker-image') {
            steps {
                buildDockerImage()
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

def buildDockerImage(){
    echo "Building docker image.."
    sh "docker build -t sofjadimcuka/sample-book-app ."

    echo "Pushing image to docker registry.."
    sh "docker push sofjadimcuka/sample-book-app ."
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} env...."
    String lowerCaseEnv = environment.toLowerCase()
    sh "docker compose up -d sample-book-app-${lowerCaseEnv}"
    sh "docker compose rm sample-book-app-${lowerCaseEnv}"
    sh "docker compose up -d sample-book-app-${lowerCaseEnv}"
} 

def runApiTests(String environment){
    echo "API tests triggered on ${environment} env.."
} 
