#!/bin/bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


# Load SDK configuration:
echo "Loading config..."
source "config.cfg"
echo "Flex SDK: " $flex_sdk
echo "ANE name: " $ane_name



# Clean and initialize temp dir files:
echo "Cleaning temp..."
mkdir temp
mkdir temp/ios
mkdir temp/mac
mkdir temp/android


# Copy built binaries for different targets and compiled SWCs to temp:
echo "Copying built binaries..."
cp ../projects/ios/DeviceTools/build/Release-iphoneos/libDeviceTools.a ./temp/ios/libDeviceTools.a
cp ../projects/android/out/libDeviceTools.jar temp/android/libDeviceTools.jar


# Now everything needed is in temp directory
cd temp


echo "Extracting library.swf from DeviceTools.swc..."
unzip -o swc/DeviceTools.swc -d ./swc
cp -rf swc/library.swf mac/library.swf
cp -rf swc/library.swf ios/library.swf
cp -rf swc/library.swf android/library.swf


echo "Extracting library.swf from DefaultDeviceTools.swc..."
unzip -o swc/DefaultDeviceTools.swc -d ./swc
cp -rf swc/library.swf .


echo "Finally making ANE..."

# Build for iOS & Android
command="${flex_sdk}/bin/adt -package -target ane DeviceTools.ane ../extension.xml \
	-swc swc/DeviceTools.swc \
	-platform default library.swf \
	-platform Android-ARM -C ./android/ . \
	-platform Android-x86 -C ./android/ . \
	-platform iPhone-ARM -C ./ios/ . \
	-platformoptions ../platformoptions.xml"
echo $command
$command


echo "Moving ANE to /ane dir..."
mv DeviceTools.ane ../../ane/
