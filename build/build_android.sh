cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ../projects/android

echo "Loading config..."
source "../../build/config.cfg"
echo "Android SDK: " $android_sdk
echo "Android version: " $android_version
echo "Java version: " $java_version


echo "Preparing out dir..."
mkdir -p out
rm -rf out/*


echo "Compiling java...";
javac_command="javac \
	-target ${java_version} -source ${java_version} \
	-cp $android_sdk/platforms/android-${android_version}/android.jar:$flex_sdk/lib/android/FlashRuntimeExtensions.jar:src/com/quaternary/devicetools \
	-d out \
	`find . -name *.java`"
echo $javac_command
$javac_command


echo "Creating JAR..."
cd out
jar_command="jar cvf libDeviceTools.jar ."
echo $jar_command
$jar_command
