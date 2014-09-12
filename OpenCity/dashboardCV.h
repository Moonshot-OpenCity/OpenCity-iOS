//
//  dashboardCV.h
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "locationVC.h"

@interface dashboardCV : UIView
@property (strong, nonatomic) IBOutlet UIButton *hideButton;
@property (assign, nonatomic) int state;
@property (strong, nonatomic) NSString *test;
@property (strong, nonatomic) NSMutableSet *postItList;
@property (strong, nonatomic) locationVC *locationManager;

@end
