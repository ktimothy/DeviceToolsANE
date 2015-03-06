#include <stdlib.h> // pulls in declaration of malloc, free
#include <string.h>

#include <UIKit/UIKit.h>

#include "FlashRuntimeExtensions.h"


FREContext eventContext;

FREObject getDeviceId(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    FREObject result;
    
    FRENewObjectFromUTF8( strlen((const char*)[uniqueIdentifier UTF8String]) + 1, (const uint8_t*)[uniqueIdentifier UTF8String], &result);
    
    return result;
}


void DeviceToolsExtensionContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "getDeviceId";
    func[0].functionData = NULL;
    func[0].function = &getDeviceId;
    
    *functionsToSet = func;
}

void DeviceToolsExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &DeviceToolsExtensionContextInitializer;
}
