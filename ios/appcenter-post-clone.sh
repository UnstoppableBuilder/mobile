#!/usr/bin/env bash
#Place this script in project/ios/

echo "Running script"

echo "Current folder = 'pwd'"
ls

echo "Uninstalling all CocoaPods versions"
sudo gem uninstall cocoapods --all --executables



cd ..
git clone -b beta https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor
flutter pub get
echo "Installed flutter to `pwd`/flutter"
#COCOAPODS_VER=`sed -n -e 's/^COCOAPODS: \([0-9.]*\)/\1/p' Podfile.lock`

echo "Installing CocoaPods version "
sudo gem install cocoapods

# fail if any command fails
set -e
# debug log
set -x

pod setup


flutter build ios --release --no-codesign