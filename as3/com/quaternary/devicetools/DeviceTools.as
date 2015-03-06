package com.quaternary.devicetools
{
    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;

    public class DeviceTools
    {
        private static var _context:ExtensionContext;
        private static var _exceptionListener:Function;

        public function DeviceTools()
        {
            throw new Error("DeviceTools instantiation is not allowed!");
        }

        /**
         * Sets the exception listener
         *
         * @param listener Listener function that takes e:StatusEvent as argument
         */
        public static function setExceptionListener(listener:Function):void
        {
            if (_exceptionListener && _context)
            {
                _context.removeEventListener(StatusEvent.STATUS, _exceptionListener);
            }

            _exceptionListener = listener;

            if (_context)
            {
                _context.addEventListener(StatusEvent.STATUS, _exceptionListener);
            }
        }

        private static function getContext():ExtensionContext
        {
            if(_context != null) return _context;

            _context = ExtensionContext.createExtensionContext("com.quaternary.devicetools.DeviceTools", null);

            if (_exceptionListener != null)
            {
                _context.addEventListener(StatusEvent.STATUS, _exceptionListener);
            }

            return _context;
        }

        /**
         * Whether or not is it possible to run JS code on the current device
         */
        public static function get isSupported():Boolean
        {
            try
            {
                return getContext() != null;
            }
            catch(error:*)
            {
                trace(error);
            }

            return false;
        }

        public static function getDeviceId():String
        {
            if(_context == null) getContext();

            var result:String = _context.call("getDeviceId") as String;

            return result;
        }

        /**
         * Frees extension memory and unloads JS engine
         */
        public static function dispose():void
        {
            if(_context == null) return;

            if (_exceptionListener != null)
            {
                _context.removeEventListener(StatusEvent.STATUS, _exceptionListener);
            }

            _exceptionListener = null;

            _context.dispose();
            _context = null;
        }
    }
}
