#!/bin/sh

#  BuildScript.sh
#  FluxMobile
#
#  Created by Shahbaz Sajjad on 08/10/2021.
#
# build framework for simulators
xcodebuild archive \
  -scheme FluxMobile \
  -sdk iphonesimulator \
  -archivePath "archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO
#build framework for devices
xcodebuild archive \
  -scheme FluxMobile \
  -sdk iphoneos \
  -archivePath "archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO
# create xcframework from both frameworks
xcodebuild -create-xcframework \
    -framework archives/ios_devices.xcarchive/Products/Library/Frameworks/FluxMobile.framework \
   -framework archives/ios_simulators.xcarchive/Products/Library/Frameworks/FluxMobile.framework \
  -output FluxMobile.xcframework
