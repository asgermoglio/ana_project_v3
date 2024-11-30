pipeline {
    agent any

    environment {
        COMPANY = 'ana'
    }

    parameters {
        string(name: 'USERNAME', defaultValue: 'TestUser', description: 'Input your username')
        choice(name: 'MODE', choices: ['Test', 'Production'])
        booleanParam(name: 'CONSENT', description: 'are you sure?')
        choice(name: 'REDEPLOY_CONFIRM', choices: ['yes', 'no'])
    }

    stages {

        // New stage for testing
        stage('Test') {
            steps {
                echo "------------------------------------------------------------------"
                echo "STARTING TEST"
                sh 'mvn clean:clean'
                sh 'mvn dependency:copy-dependencies'
                sh 'mvn compiler:compile'
                sh 'timeout 10s mvn spring-boot:run'
                sh 'mvn spring-boot:stop'
                echo "TEST COMPLETED"
                echo "------------------------------------------------------------------"
                echo "------------------------------------------------------------------"
            }
        }

        // New stage for packaging and archive
        stage('Package & Archive') {
            steps {
                echo "------------------------------------------------------------------"
                echo "PACKAGING <-------------------------------------------------------"
                sh 'mvn package' // Assuming your project uses maven-war-plugin
                echo "------------------------------------------------------------------"

            }
        }

        // New stage for redeployment with manual approval
        stage('Redeploy (On Approval)') {
                    when {
                        expression { return params.CONSENT } // Only proceed if user consented (boolean check)
                    }
                    steps {
                        // Simplified input definition
                        input message: 'Are you sure you want to redeploy?'

                        // Redeployment steps based on your environment (e.g., using a deploy tool)
                        // Example: Assuming a deploy script named "deploy.sh"
                        script {
                            if (params.REDEPLOY_CONFIRM == 'yes') {
                                sh 'sh deploy.sh'
                            } else {
                                echo 'Redeployment cancelled.'
                            }
                        }
                    }
        }

        stage('Execution') {
            steps {
                echo "Hello ${params.USERNAME} from ${COMPANY}"
                echo "Would you like to execute the project in ${params.MODE} mode"
                echo "and has given the consent ${params.CONSENT}"
            }
        }

        stage('GetProject') {
            steps {
                git 'https://github.com/asgermoglio/ana_project_v3.git'
            }
        }

        stage ('build') {
            steps {
                sh 'mvn clean:clean'
                sh 'mvn dependency:copy-dependencies'
                sh 'mvn compiler:compile'
            }
        }

        stage ('Exec') {
            steps {
                sh 'mvn spring-boot:run'
            }
        }

    }
}
