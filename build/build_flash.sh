cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


echo "Loading config..."
source "config.cfg"
echo "Flex SDK: " $flex_sdk

mkdir -p "temp/swc"

echo "Generating swc..."
command="${flex_sdk}/bin/acompc -load-config+=swc-config.xml"
echo $command
$command


echo "Building default target..."
command="${flex_sdk}/bin/acompc -load-config+=default-swc-config.xml"
echo $command
$command
