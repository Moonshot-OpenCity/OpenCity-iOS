//
//  mapView.h
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "viewPostit.h"

@interface mapView : UIViewController

@property (strong, nonatomic) NSMutableDictionary *postItList;

-(void)changeCamera;
-(void)addMarker;

@end