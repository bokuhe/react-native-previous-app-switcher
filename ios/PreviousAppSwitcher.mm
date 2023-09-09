#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(PreviousAppSwitcher, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return false;  // only do this if your module initialization relies on calling UIKit!
}

RCT_EXTERN_METHOD(switchBack: (RCTPromiseResolveBlock)resolver rejecter: (RCTPromiseRejectBlock)rejecter)

@end
