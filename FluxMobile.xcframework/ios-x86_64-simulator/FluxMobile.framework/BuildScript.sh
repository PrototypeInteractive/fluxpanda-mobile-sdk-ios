#!/bin/sh

#  BuildScript.sh
#  FluxMobile
#
#  Created by Shahbaz Sajjad on 08/10/2021.
#
# build framework for simulators
mkdir build
# build framework for simulators
xcodebuild clean build \
    -project FluxMobile.xcodeproj \
    -scheme FluxMobile \
    -configuration Release \
    -arch x86_64 \
    -sdk iphonesimulator \
    -derivedDataPath derived_data
# create folder to store compiled framework for simulator
mkdir build/simulator
# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphonesimulator/FluxMobile.framework build/simulator
#build framework for devices
xcodebuild clean build \
    -project FluxMobile.xcodeproj \
    -scheme FluxMobile \
    -configuration Release \
    -arch arm64 \
    -sdk iphoneos \
    -derivedDataPath derived_data
# create folder to store compiled framework for simulator
mkdir build/devices
# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphoneos/FluxMobile.framework build/devices
# create xcframework from both frameworks
xcodebuild -create-xcframework \
    -framework "./build/devices/FluxMobile.framework" \
    -framework "./build/simulator/FluxMobile.framework" \
    -output "./build/FluxMobile.xcframework"
