//
//  dashboardCV.m
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "dashboardCV.h"
#import "locationVC.h"
#import "dataClass.h"
#import "addPostit.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

#define UP 1
#define DOWN 0

@implementation dashboardCV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}

-(void)fetchPostits
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://opencity-moonshot.herokuapp.com/api/postits/searchByLocation?"
      parameters:@{@"lat": @"45.761806",
                   @"lon": @"4.857674",
                   @"limit": @"9"}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             self.postItList = responseObject;
             NSLog(@"%@", responseObject);
             [self showPlaces];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                             message:error.localizedDescription
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
             [alert show];
             NSLog(@"%@", error);
         }];
    
}

- (void)showPlaces
{
    int i = 0;
    
    for (id key in self.postItList)
    {
        //[self placeMarker:key[@"title"] details:key[@"description"] lat:key[@"location"][0] lon:key[@"location"][1] type:key[@"type"]];
    }
}



- (IBAction)pushButton:(id)sender
{
    if (self.test == nil)
    {
        self.test = [[NSString alloc] init];
        self.state = UP;
        [self fetchPostits];
    }
    if (self.state == UP)
    {
        self.frame = CGRectMake(0, 67, 320, 500);
        [self.hideButton setImage:[UIImage imageNamed:@"arrow103bot.png"] forState:UIControlStateNormal];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.state = DOWN;
    }
    else
    {
        self.frame = CGRectMake(0, 500, 320, 500);
        [self.hideButton setImage:[UIImage imageNamed:@"arrow103.png"] forState:UIControlStateNormal];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.state = UP;
    }
}

@end
