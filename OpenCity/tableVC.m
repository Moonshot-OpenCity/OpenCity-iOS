//
//  tableVC.m
//  OpenCity
//
//  Created by Apollo on 10/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "tableVC.h"
#import "SWRevealViewController.h"
#import "loginViewController.h"

@interface tableVC ()

@end

@implementation tableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
    self.menuItems = @[@"title", @"dashboard", @"carte", @"connect"];
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    if ([segue isKindOfClass:[SWRevealViewControllerSegueSetController class]])
         {
//             SWRevealViewControllerSegueSetController *swSegue = (SWRevealViewControllerSegueSetController*) segue;
             UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
             [navController setViewControllers: @[destViewController] animated: NO ];
             [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
         }
//    if ([segue isKindOfClass: [SWRevealViewControllerSegueSetController class]] ) {
//        SWRevealViewControllerSegueSetController *swSegue = (SWRevealViewControllerSegue*) segue;
//        
//        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
//            
//            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//            [navController setViewControllers: @[dvc] animated: NO ];
//            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
  //      };
        
//    }
//    NSLog(@"%@", [self.menuItems objectAtIndex:indexPath.row]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
