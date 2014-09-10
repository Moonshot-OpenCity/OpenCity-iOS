//
//  ViewController.h
//  OpenCity
//
//  Created by Apollo on 06/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"


@interface ViewController : UIViewController

-(CAGradientLayer*)blueGradient;
-(void)aTime;
@property (nonatomic,strong) MMDrawerController * drawerController;
@property (strong, nonatomic) IBOutlet UIImageView *logo;

@end
