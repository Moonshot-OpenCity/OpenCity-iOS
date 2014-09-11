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

@property (strong, nonatomic) NSString *token;

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

-(void)userLogged:(NSString*)token
{
    
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    destViewController.navigationItem.hidesBackButton = false;
    UIBarButtonItem *_customBackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStyleDone target:nil action:nil];
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController){
        [_customBackButton setTarget: self.revealViewController];
        [_customBackButton setAction: @selector(revealToggle:)];
        [destViewController.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
        destViewController.navigationItem.leftBarButtonItem = _customBackButton;
    }
    if ([segue isKindOfClass:[SWRevealViewControllerSegueSetController class]])
         {
             UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
             [navController setViewControllers: @[destViewController] animated: NO ];
             [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
         }
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
