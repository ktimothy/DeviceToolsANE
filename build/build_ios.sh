cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ../projects/ios/DeviceTools


echo "Building armv7, armv7s and arm64 architecture..."
command="xcodebuild -project DeviceTools.xcodeproj/ -arch armv7 -arch armv7s -arch arm64 -sdk iphoneos7.1"
echo $command
$command
