//
//  createAccount.m
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "createAccount.h"

@implementation createAccount

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {}
    return self;
}

- (IBAction)tapOutside:(id)sender
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.lastScroll = 0.0;
    [self.emailField resignFirstResponder];
    [self.passField resignFirstResponder];
    [self.pseudoField resignFirstResponder];
}

- (IBAction)pseudoBegin:(id)sender {
    UITextField *textField = (UITextField *)sender;
    self.lastScroll = textField.frame.origin.y;
    [self.scrollView setContentOffset:CGPointMake(0, self.lastScroll/3) animated:YES];
}

- (IBAction)emailBegin:(id)sender {
    UITextField *textField = (UITextField *)sender;
    self.lastScroll = textField.frame.origin.y;
    [self.scrollView setContentOffset:CGPointMake(0, self.lastScroll/3) animated:YES];
}

- (IBAction)passwordBegin:(id)sender {
    UITextField *textField = (UITextField *)sender;
    self.lastScroll = textField.frame.origin.y;
    [self.scrollView setContentOffset:CGPointMake(0, self.lastScroll/3) animated:YES];
}

- (IBAction)retourButton:(id)sender
{
    [self removeFromSuperview];
}

- (IBAction)createAccount:(id)sender
{
    NSLog(@"test");
    if (self.emailField.text.length > 1 && self.pseudoField.text.length > 0
        && self.passField.text.length > 1)
    {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://opencity-moonshot.herokuapp.com/api/users"
       parameters:@{@"email": self.emailField.text,
                    @"password": self.passField.text,
                    @"name": self.pseudoField.text}
    success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         dataClass *obj = [dataClass getInstance];
         obj.token = responseObject[@"token"];
         obj.isConnected = true;
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Création réussie!"
                                                         message:@"vous êtes connecté!"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
         [alert show];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                         message:error.localizedDescription
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
         NSLog(@"%@", error);
         [alert show];
         
     }];
    }
}

@end
