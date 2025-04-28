pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Parida-L/Ateja-test-off.git'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Playwright Tests') {
            steps {
                sh 'npx playwright test'
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: 'playwright-report/**', allowEmptyArchive: true
                junit 'results/playwright-report.xml'
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé.'
        }
    }
}
