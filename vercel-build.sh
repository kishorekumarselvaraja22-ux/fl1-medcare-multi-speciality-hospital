#!/bin/bash
set -e
echo "=== Starting Flutter Web Build on Vercel ==="
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
else
  echo "Flutter SDK already exists."
fi
export PATH="$PATH:$PWD/flutter/bin"
echo "Configuring Flutter..."
flutter config --enable-web
flutter doctor
echo "Installing dependencies..."
flutter pub get
echo "Building web project..."
flutter build web --release
echo "=== Build Completed ==="
