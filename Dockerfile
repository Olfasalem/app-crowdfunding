# Utilisez une image de base avec Flutter et Dart préinstallés
FROM cirrusci/flutter:stable AS build

# Définissez le répertoire de travail
WORKDIR /app

# Copiez les fichiers nécessaires dans le conteneur
COPY pubspec.yaml .
COPY lib/ lib/
COPY assets/ assets/

# Exécutez `flutter pub get` pour installer les dépendances
RUN flutter pub get

# Construisez l'application Flutter
RUN flutter build apk --release

# Utilisez une image plus légère pour l'étape finale
FROM nginx:alpine

# Copiez l'APK construit depuis l'étape précédente
COPY --from=build /app/build/app/outputs/flutter-apk/app-release.apk /usr/share/nginx/html/app-release.apk

# Exposez le port 80
EXPOSE 80

# Démarrez le serveur nginx
CMD ["nginx", "-g", "daemon off;"]
