//
//  mainViewController.m
//  OpenCity
//
//  Created by Apollo on 10/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "mainViewController.h"
#import "SWRevealViewController.h"


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
    // Change button color
    //self.menuButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController){
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector(revealToggle:)];
        [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
