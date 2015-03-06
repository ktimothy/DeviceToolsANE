package com.quaternary.devicetools.functions;

import com.quaternary.devicetools.DeviceToolsExtension;
import android.content.Context;
import android.provider.Settings.System;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import android.provider.Settings.Secure;

public class GetDeviceIdFunction implements FREFunction
{
	public static final String TAG = "GetDeviceIdFunction";
	
	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		DeviceToolsExtension.extensionContext = context;
		
		Context appContext = context.getActivity().getApplicationContext();
		DeviceToolsExtension.appContext = appContext;
		
		Log.i(TAG, "in init");
		
		// Get android id
		String android_id = Secure.getString(appContext.getContentResolver(), Secure.ANDROID_ID); 
		FREObject result = null;
		
		try
		{
			result = FREObject.newObject(android_id);
		}
		catch(FREWrongThreadException ex)
		{
			Log.i(TAG, ex.toString());
		}

		return result;
	}
}
