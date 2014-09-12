//
//  createAccount.h
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataClass.h"
#import "AFHTTPRequestOperationManager.h"

@interface createAccount : UIView

@property (strong, nonatomic) IBOutlet UITextField *pseudoField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) IBOutlet UIButton *createButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (assign, nonatomic) float lastScroll;

@end
