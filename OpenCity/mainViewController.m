//
//  mainViewController.m
//  OpenCity
//
//  Created by Apollo on 10/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "mainViewController.h"
#import "SWRevealViewController.h"
#import "dashboardCV.h"

@interface mainViewController ()

@end

@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"dashboard-bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController){
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector(revealToggle:)];
        [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
    UIView *test = [[[NSBundle mainBundle] loadNibNamed:@"dashboardVC" owner:self options:nil] objectAtIndex:0];
    test.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    test.frame = CGRectMake(0, 500, self.view.frame.size.width, 500);
    [self.view addSubview:test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
