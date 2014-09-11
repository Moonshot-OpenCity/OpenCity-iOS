//
//  ViewController.m
//  OpenCity
//
//  Created by Apollo on 06/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "mainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    CAGradientLayer *bgLayer = [self blueGradient];
//    bgLayer.frame = self.view.bounds;
//    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundf.jpg"]];
//    self.view.backgroundColor = background;

    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    CGRect endFrame = [[self view] frame];
    [self.logo setFrame: CGRectMake([[self view] frame].origin.x, [[self view] frame].origin.y + 480.0, [[self view] frame].size.width, [[self view] frame].size.height)];
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: 1];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [self.logo setFrame: endFrame];
    [UIView commitAnimations];
    NSTimer *aTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(aTime) userInfo:nil repeats:NO];
    aTimer = aTimer;
}

-(void)aTime
{
    SWRevealViewController *revealVC = [[self storyboard] instantiateViewControllerWithIdentifier:@"revealViewController"];
    [self presentViewController:revealVC animated:YES completion:nil];
}

-(CAGradientLayer*)blueGradient
{
    UIColor *colorOne = [UIColor colorWithRed:0.408 green:0.616 blue:0.835 alpha:1];
    UIColor *colorTwo = [UIColor colorWithRed:0.302 green:0.451 blue:0.616 alpha:1];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
