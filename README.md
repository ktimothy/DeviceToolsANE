DeviceTools ANE
=====

Useful tools for mobile applications, written in AIR.
Currently this AIR Native Extension (ANE) only gets the device id (UUID).


Supported Platforms
=====

- iOS 6, 7, 8 32bit, 64bit (armv7, armv7s, arm64)
- Android ARMv7, x86


Building ANE
=====

- Get to build directory
- Rename config.cfg.example to config.cfg and fill in all neccessary paths
- Execute build/build.sh
- Result is in ane directory


Usage
=====

Simply add the ane/DeviceTools.ane as a library to your AIR project.
Device id can be obtained by calling
```actionscript
DeviceTools.getDeviceId();
```
