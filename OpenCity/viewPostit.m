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

-(void)showMarkerData
{
    dataClass *obj = [dataClass getInstance];
    NSMutableString *token = [[NSMutableString alloc] init];
    [token appendString:@"Bearer "];
    [token appendString:obj.token];
    self.titleLabel.text = obj.cMarker.title;
    self.descriptionLabel.text = obj.cMarker.snippet;
    NSString *markerID = obj.cMarker.objectID;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [manager GET:@"http://opencity-moonshot.herokuapp.com/api/comments/getByPostit"
       parameters:@{@"postit": markerID}
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
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
//    dataClass *obj = [dataClass getInstance];
//    NSMutableString *token = [[NSMutableString alloc] init];
//    [token appendString:@"Bearer "];
//    [token appendString:obj.token];
//    self.lat = [[NSString alloc] initWithFormat:@"%f", obj.marker.position.latitude];
//    self.lon = [[NSString alloc] initWithFormat:@"%f", obj.marker.position.longitude];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
//    [manager POST:@"http://opencity-moonshot.herokuapp.com/api/postits"
//       parameters:@{@"title": self.titleField.text,
//                    @"description": self.descriptionField.text,
//                    @"type": self.test,
//                    @"lon": self.lon,
//                    @"lat": self.lat}
//          success:^(AFHTTPRequestOperation *operation, id responseObject)
//     {
//         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opération réussie!"
//                                                         message:@"Votre avis est envoyé!"
//                                                        delegate:nil
//                                               cancelButtonTitle:@"OK"
//                                               otherButtonTitles:nil];
//         [self removeFromSuperview];
//         [alert show];
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
//     {
//         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
//                                                         message:error.localizedDescription
//                                                        delegate:nil
//                                               cancelButtonTitle:@"OK"
//                                               otherButtonTitles:nil];
//         [alert show];
//     }];
}


- (IBAction)cancelTapped:(id)sender
{
    [self removeFromSuperview];
}

@end
