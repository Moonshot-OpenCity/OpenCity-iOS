//
//  dataClass.m
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "dataClass.h"

@implementation dataClass
@synthesize token;
@synthesize currentLocation;
@synthesize isConnected;

static dataClass *instance = nil;

+(dataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance == nil)
        {
            instance= [dataClass new];
        }
    }
    return instance;
}

@end
