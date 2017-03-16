//
//  IMCHeader.h
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#ifndef IMCHeader_h
#define IMCHeader_h

#ifndef DEFINE_SHARED_INSTANCE_GCD_USING_BLOCK
#define DEFINE_SHARED_INSTANCE_GCD_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject;
#endif

#define IMCLog(format, ...) NSLog(@"[IMCoder] %@", [NSString stringWithFormat:format, ## __VA_ARGS__])
#define IS_OS_LOWER_THAN_7    ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define IS_IPAD  (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)

#endif /* IMCHeader_h */
