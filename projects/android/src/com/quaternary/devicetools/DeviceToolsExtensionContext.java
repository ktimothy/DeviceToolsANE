package com.quaternary.devicetools;

import java.util.HashMap;
import java.util.Map;

import com.quaternary.devicetools.functions.GetDeviceIdFunction;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class DeviceToolsExtensionContext extends FREContext {
	public static final String TAG = "DeviceToolsExtensionContext";
	
	@Override
	public void dispose() {
		Log.d(TAG,"Context disposed.");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functions = new HashMap<String, FREFunction>();
		
		functions.put("getDeviceId", new GetDeviceIdFunction());
		
		return functions;
	}
}
