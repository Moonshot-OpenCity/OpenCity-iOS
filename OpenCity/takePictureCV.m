//
//  takePictureCV.m
//  OpenCity
//
//  Created by Apollo on 12/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "takePictureCV.h"

@implementation takePictureCV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}


- (IBAction)takePicture:(id)sender
{
}

- (IBAction)cancelButton:(id)sender
{
    [self removeFromSuperview];
}

@end
