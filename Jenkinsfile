pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Récupération du code source depuis le référentiel Git
                git 'https://github.com/Olfasalem/app-crowdfunding.git'
            }
        }

        stage('Build Flutter App') {
            steps {
                // Construction de l'application Flutter
                sh 'flutter pub get'
                sh 'flutter build apk' // Vous pouvez changer cela selon vos besoins (apk, ipa, etc.)
            }
        }

        stage('Run Tests') {
            steps {
                // Exécution des tests (facultatif)
                sh 'flutter test'
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archiver les artefacts (APK, IPA, etc.)
                archiveArtifacts artifacts: '**/build/app/outputs/flutter-apk/*.apk', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                // Mettez ici les étapes de déploiement de votre application
                // Cela peut inclure le déploiement sur un serveur, le téléchargement sur un store d'applications, etc.
            }
        }
    }
    
    post {
        always {
            // Nettoyer les artefacts temporaires, si nécessaire
            cleanWs()
        }
    }
}
