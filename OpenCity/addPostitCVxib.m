//
//  addPostitCVxib.m
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "addPostitCVxib.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "dataClass.h"

@implementation addPostitCVxib

-(id)init
{
    if (self = [super init])
    {}
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (IBAction)taptapta:(id)sender
{
    [self.titleField resignFirstResponder];
    [self.descriptionField resignFirstResponder];
}
- (IBAction)annulerButton:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)thumbDownClicked:(id)sender {
    [self.thumbDownButton setImage:[UIImage imageNamed:@"thumb_down.png"] forState:UIControlStateNormal];
    [self.thumbUpButton setImage:[UIImage imageNamed:@"grey_thumb_up.png"] forState:UIControlStateNormal];
    self.test = @"negative";
}
- (IBAction)thumbUpClicked:(id)sender {
    [self.thumbDownButton setImage:[UIImage imageNamed:@"grey_thumb_down.png"] forState:UIControlStateNormal];
    [self.thumbUpButton setImage:[UIImage imageNamed:@"thumb_up.png"] forState:UIControlStateNormal];
    self.test = @"positive";
}

- (IBAction)okButtonTapped:(id)sender
{
    if (self.test != nil && self.titleField.text.length > 1 && self.descriptionField.text.length > 1)
    {
        dataClass *obj = [dataClass getInstance];
        NSMutableString *token = [[NSMutableString alloc] init];
        [token appendString:@"Bearer "];
        [token appendString:obj.token];
        self.lat = [[NSString alloc] initWithFormat:@"%f", obj.marker.position.latitude];
        self.lon = [[NSString alloc] initWithFormat:@"%f", obj.marker.position.longitude];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
        [manager POST:@"http://opencity-moonshot.herokuapp.com/api/postits"
           parameters:@{@"title": self.titleField.text,
                        @"description": self.descriptionField.text,
                        @"type": self.test,
                        @"lon": self.lon,
                        @"lat": self.lat}
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Création réussie!"
                                                             message:@"Post-it envoyé!"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
             [self removeFromSuperview];
             [alert show];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                             message:error.localizedDescription
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
             [alert show];
         }];
    }
}
//
//not working yet
//
- (IBAction)tapOutsidePostit:(id)sender
{
    NSLog(@"test");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"test");
}

@end
