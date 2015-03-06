package com.quaternary.devicetools;

import android.content.Context;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class DeviceToolsExtension implements FREExtension {
	public static final String TAG = "DeviceToolsExtension";
	
	public static FREContext extensionContext;
	public static Context appContext;
	
	@Override
	public FREContext createContext(String contextType) {
		return new DeviceToolsExtensionContext();
	}

	@Override
	public void dispose() {
		Log.d(TAG, "Extension disposed.");
				
		appContext = null;
		extensionContext = null;
	}

	@Override
	public void initialize() {
		Log.d(TAG, "Extension initialized.");
	}
}
