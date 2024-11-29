pipeline {
    agent any

    environment {
        COMPANY = 'ana'
    }

    parameters {
        string(name: 'USERNAME', defaultValue: 'TestUser', description: 'Input your username')
        choice(name: 'MODE', choices: ['Test', 'Production'])
        booleanParam(name: 'CONSENT', description: 'are you sure?')
    }

    stages {

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
