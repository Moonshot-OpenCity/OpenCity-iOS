//
//  viewPostit.m
//  OpenCity
//
//  Created by Apollo on 13/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "viewPostit.h"
#import "dataClass.h"
#import "AFHTTPRequestOperationManager.h"

@implementation viewPostit

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}

- (IBAction)thumbUpTap:(id)sender {
    [self.thumbDownButton setImage:[UIImage imageNamed:@"grey_thumb_down.png"] forState:UIControlStateNormal];
    [self.thumbUpButton setImage:[UIImage imageNamed:@"thumb_up.png"] forState:UIControlStateNormal];
    self.test = @"positive";
}

- (IBAction)thumbDownTap:(id)sender {
    [self.thumbDownButton setImage:[UIImage imageNamed:@"thumb_down.png"] forState:UIControlStateNormal];
    [self.thumbUpButton setImage:[UIImage imageNamed:@"grey_thumb_up.png"] forState:UIControlStateNormal];
    self.test = @"negative";
}

-(void)showMarkerData
{
    dataClass *obj = [dataClass getInstance];
    NSMutableString *token = [[NSMutableString alloc] init];
    [token appendString:@"Bearer "];
    [token appendString:obj.token];
    self.titleLabel.text = obj.cMarker.title;
    self.descriptionLabel.text = obj.cMarker.snippet;
    NSString *markerID = obj.cMarker.objectID;
    NSMutableString *testString = [[NSMutableString alloc] init];
    [testString appendString:@"http://opencity-moonshot.herokuapp.com/api/postits/"];
    [testString appendString:markerID];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager GET:testString
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableString *scoreString = [[NSMutableString alloc] init];
         [scoreString appendFormat:@"Score: %@", responseObject[@"score"]];
         self.scoreLabel.text = scoreString;
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

-(void)showComments
{
    dataClass *obj = [dataClass getInstance];
    NSMutableString *token = [[NSMutableString alloc] init];
    [token appendString:@"Bearer "];
    [token appendString:obj.token];
    NSString *markerID = obj.cMarker.objectID;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager GET:@"http://opencity-moonshot.herokuapp.com/api/comments/getByPostit"
      parameters:@{@"postit": markerID}
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
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

- (IBAction)okTapped:(id)sender
{
    if (self.test != nil)
    {
    dataClass *obj = [dataClass getInstance];
    NSMutableString *token = [[NSMutableString alloc] init];
    [token appendString:@"Bearer "];
    [token appendString:obj.token];
    NSMutableString *postRequest = [[NSMutableString alloc] init];
    [postRequest appendString:@"http://opencity-moonshot.herokuapp.com/api/postits/"];
    [postRequest appendString:obj.cMarker.objectID];
    [postRequest appendString:@"/vote"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager POST:postRequest
       parameters:@{@"type": self.test}
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opération réussie!"
                                                         message:@"Votre vote est envoyé!"
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
         [alert show];
     }];
    }
    if (self.commentTextView.text.length > 0)
    {
        dataClass *obj = [dataClass getInstance];
        NSMutableString *token = [[NSMutableString alloc] init];
        [token appendString:@"Bearer "];
        [token appendString:obj.token];
        NSMutableString *postRequest = [[NSMutableString alloc] init];
        [postRequest appendString:@"http://opencity-moonshot.herokuapp.com/api/comments/"];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
        [manager POST:postRequest
           parameters:@{@"description": self.commentTextView.text,
                        @"postit": obj.cMarker.objectID}
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opération réussie!"
                                                             message:@"Votre avis est envoyé!"
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
             [alert show];
         }];
    }
}



- (IBAction)cancelTapped:(id)sender
{
    [self removeFromSuperview];
}

@end
