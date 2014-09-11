//
//  addPostit.m
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "addPostit.h"
#import <GoogleMaps/GoogleMaps.h>

@interface addPostit ()

@end

@implementation addPostit

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

-(void)setResponseData:(GMSReverseGeocodeResponse *)response
{
    self.response = response;
}

- (void)setGeocoder:(GMSGeocoder*)geocoder
{
    self.geocoder = geocoder;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
