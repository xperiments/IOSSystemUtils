//
//  IOSSystemUtils.m
//  IOSSystemUtils
//
//  Created by ANEBridgeCreator on 04/02/2013.
//  Copyright (c)2013 ANEBridgeCreator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FlashRuntimeExtensions.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

#define ASSERT_ARGC_IS(fn_name, required)																	\
if(argc != (required))																						\
{																											\
DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected exactly " #required);	\
return NULL;																							\
}
#define ASSERT_ARGC_AT_LEAST(fn_name, required)																\
if(argc < (required))																						\
{																											\
DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected at least " #required);	\
return NULL;																							\
}

/****************************************************************************************
 * @method:getBrightness( ):Number
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( getBrightness )
{
	
	FREObject ane_resultFromNumber= nil;
	FRENewObjectFromDouble([UIScreen mainScreen].brightness, &ane_resultFromNumber);
	return ane_resultFromNumber;
}


/****************************************************************************************
 * @method:setBadgeNumber( badgeCount:uint):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( setBadgeNumber )
{
	
	int32_t badge_Number_C;
	if( FREGetObjectAsInt32(argv[0], &badge_Number_C) != FRE_OK ) return NULL;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge_Number_C;

	return NULL;
}


/****************************************************************************************
 * @method:setBrightness( brightness:Number):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( setBrightness )
{
	
	//  brightness:Number = argument[0];
    
	double brightness_C;
	if( FREGetObjectAsDouble(argv[0], &brightness_C) != FRE_OK ) return NULL;
    [[UIScreen mainScreen] setBrightness:brightness_C];
    
	return NULL;
}


/****************************************************************************************
 * @method:setTorchEnabled( enabled:Boolean):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( setTorchEnabled )
{
	uint32_t enabled_C;
	if( FREGetObjectAsBool(argv[0], &enabled_C) != FRE_OK ) return NULL;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode: enabled_C ? AVCaptureTorchModeOn:AVCaptureTorchModeOff];
    [device unlockForConfiguration];
    
	return NULL;
}


/****************************************************************************************
 *																						*
 *	EXTENSION & CONTEXT																	*
 *																						*
 ****************************************************************************************/

void IOSSystemUtilsContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
	static FRENamedFunction functionMap[] = {
		// METHODS
		MAP_FUNCTION( getBrightness, NULL ),
		MAP_FUNCTION( setBadgeNumber, NULL ),
		MAP_FUNCTION( setBrightness, NULL ),
		MAP_FUNCTION( setTorchEnabled, NULL )
	};
	*numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
	*functionsToSet = functionMap;
}
void IOSSystemUtilsContextFinalizer( FREContext ctx )
{
	NSLog(@"Entering IOSSystemUtilsContextFinalizer()");
	NSLog(@"Exiting IOSSystemUtilsContextFinalizer()");
	return;
}
void IOSSystemUtilsExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet )
{
	NSLog(@"Entering IOSSystemUtilsExtensionInitializer()");
	extDataToSet = NULL;  // This example does not use any extension data.
	*ctxInitializerToSet = &IOSSystemUtilsContextInitializer;
	*ctxFinalizerToSet = &IOSSystemUtilsContextFinalizer;
}
void IOSSystemUtilsExtensionFinalizer()
{
	NSLog(@"Entering IOSSystemUtilsExtensionFinalizer()");
	return;
}
