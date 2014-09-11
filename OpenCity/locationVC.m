//
//  locationVC.m
//  
//
//  Created by Apollo on 11/09/14.
//
//

#import "locationVC.h"
#import <CoreLocation/CoreLocation.h>
#import "dataClass.h"

@interface locationVC () <CLLocationManagerDelegate>

@end

@implementation locationVC
{
    CLLocationManager *locationManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error localisation: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil)
    {
        dataClass *obj = [dataClass getInstance];
        obj.currentLocation = currentLocation;
        [self.mapview changeCamera];
    }
    [locationManager stopUpdatingLocation];
}

-(void)startTracking
{
    [locationManager startUpdatingLocation];
}

-(void)startManager:(mapView *)mapview
{
    self.mapview = mapview;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
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
