set -e

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

rm -rf temp
mkdir temp

# Run targets one by one:
./build_android.sh
./build_ios.sh
./build_flash.sh
./build_ane.sh

# Clean:
rm -rf temp
