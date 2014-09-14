//
//  viewPostit.h
//  OpenCity
//
//  Created by Apollo on 13/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customMarker.h"

@interface viewPostit : UIView

@property (assign, nonatomic) float lastScroll;
@property (strong, nonatomic) NSString *test;
@property (strong, nonatomic) GMSMarker *marker;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *thumbUpButton;
@property (strong, nonatomic) IBOutlet UIButton *thumbDownButton;
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;

-(void)showMarkerData;

@end
