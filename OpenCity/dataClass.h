//
//  dataClass.h
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import "customMarker.h"

@interface dataClass : NSObject{
    NSString    *token;
    BOOL        isConnected;
    CLLocation  *currentLocation;
    GMSMarker   *marker;
    customMarker *cMarker;
}

@property (nonatomic, retain) GMSMarker *marker;
@property (nonatomic, retain)NSString *token;
@property BOOL isConnected;
@property customMarker *cMarker;
@property CLLocation *currentLocation;
+(dataClass*)getInstance;

@end
