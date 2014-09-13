//
//  addPostitCVxib.h
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface addPostitCVxib : UIView

@property (strong, nonatomic) IBOutlet UITextView *descriptionField;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) NSString *lon;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) GMSMarker *marker;
@property (strong, nonatomic) IBOutlet UIButton *thumbDownButton;
@property (strong, nonatomic) IBOutlet UIButton *thumbUpButton;
@property (strong, nonatomic) NSString *test;

@end
