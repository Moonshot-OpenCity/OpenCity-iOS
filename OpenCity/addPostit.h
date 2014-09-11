//
//  addPostit.h
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface addPostit : UIViewController

@property (strong, nonatomic) GMSGeocoder *geocoder;
@property (strong, nonatomic) GMSReverseGeocodeResponse *response;

-(void)setGeocoder:(GMSGeocoder *)geocoder;
-(void)setResponseData:(GMSReverseGeocodeResponse *)response;

@end
