package com.quaternary.devicetools
{
    public class DeviceTools
    {
        public function DeviceTools()
        {
            throw new Error("DeviceTools instantiation is not allowed!");
        }

        public static function setExceptionListener(listener:Function):void
        {            
        }

        public static function get isSupported():Boolean
        {
            return false;
        }

        public static function getDeviceId():String
        {            
            return null;
        }

        public static function dispose():void
        {            
        }
    }
}
