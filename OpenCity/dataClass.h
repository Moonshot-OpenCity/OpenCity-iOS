//
//  dataClass.h
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface dataClass : NSObject{
    NSString    *token;
    BOOL        isConnected;
    CLLocation  *currentLocation;
}

@property(nonatomic, retain)NSString *token;
@property BOOL isConnected;
@property CLLocation *currentLocation;
+(dataClass*)getInstance;

@end
