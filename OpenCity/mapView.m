//
//  mapView.m
//  OpenCity
//
//  Created by Apollo on 11/09/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "mapView.h"
#import "locationVC.h"
#import "dataClass.h"
#import "addPostit.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "addPostitCVxib.h"
#import "customMarker.h"

@interface mapView () <GMSMapViewDelegate>

@property (strong, nonatomic) GMSCameraPosition *camera;
@property (strong, nonatomic) NSMutableSet *markers;
@property (strong, nonatomic) GMSMapView *mapView_;
@property (strong, nonatomic) locationVC *locationManager;
@property (strong, nonatomic) GMSMarker  *marker;

@end

@implementation mapView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

-(void)addMarker
{
    self.marker.map = nil;
    self.marker = [GMSMarker markerWithPosition:self.camera.target];
    self.marker.title = @"Ajouter un post-it";
    self.marker.map = self.mapView_;
}

-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    self.marker.map = nil;
    self.marker = [GMSMarker markerWithPosition:coordinate];
    self.marker.title = @"Ajouter un post-it";
    self.marker.map = self.mapView_;
}

- (void) mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    dataClass *obj = [dataClass getInstance];
    if ([marker isKindOfClass:[customMarker class]])
    {
        if (obj.isConnected == TRUE)
        {
            UIView *test = [[[NSBundle mainBundle] loadNibNamed:@"viewPostitCV" owner:self options:nil] objectAtIndex:0];
            test.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
            if ([test isKindOfClass:[viewPostit class]])
            {
                dataClass *obj = [dataClass getInstance];
                obj.marker = marker;
                obj.cMarker = (customMarker*)marker;
                [(viewPostit*)test showMarkerData];
            }
            [self.view addSubview:test];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec!"
                                                            message:@"Connectez vous pour consulter le contenu d'un post-it!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else
    {
        if (obj.isConnected == TRUE)
        {
            obj.marker = marker;
            GMSGeocoder *geocoder = [GMSGeocoder geocoder];
            [geocoder reverseGeocodeCoordinate:marker.position completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error)
             {
                 UIView *test = [[[NSBundle mainBundle] loadNibNamed:@"addPostitCView" owner:self options:nil] objectAtIndex:0];
                 test.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
                 obj.marker = marker;
                 marker.map = nil;
                 [self.view addSubview:test];
             }];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec!"
                                                            message:@"Connectez vous pour ajouter un post-it!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void) mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    
}

- (void) mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position
{
    self.camera = position;
    [self refreshMap];
}

- (void) mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position
{
    self.marker.position = position.target;
}

-(void)changeCamera
{
    dataClass *obj = [dataClass getInstance];
    GMSCameraPosition *newPosition = [GMSCameraPosition cameraWithLatitude:obj.currentLocation.coordinate.latitude longitude:obj.currentLocation.coordinate.longitude zoom:14];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://opencity-moonshot.herokuapp.com/api/postits/searchByLocation?"
       parameters:@{@"lat": [NSString stringWithFormat:@"%f", obj.currentLocation.coordinate.latitude],
                    @"lon": [NSString stringWithFormat:@"%f", obj.currentLocation.coordinate.longitude]}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              self.postItList = responseObject;
              [self showPlaces];
              [self drawMarkers];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                              message:error.localizedDescription
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
              [alert show];
          }];

    [self.mapView_ setCamera:newPosition];
}

- (void)showPlaces
{
    for (id key in self.postItList)
    {
        [self placeMarker:key[@"title"] details:key[@"description"] lat:key[@"location"][0] lon:key[@"location"][1] type:key[@"type"] objID:key[@"_id"]];
    }
}

- (void)drawMarkers
{
    for (customMarker *marker in self.markers)
    {
        if (marker.map == nil)
        {
            marker.map = self.mapView_;
        }
    }
}

- (void)placeMarker:(NSString *)title details:(NSString *)details lat:(NSString *)lat lon:(NSString *)lon type:(NSString *)type objID:(NSString*)objID
{
    customMarker *marker = [[customMarker alloc] init];
    
    marker.position = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
    marker.title = title;
    marker.snippet = details;
    marker.objectID = objID;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    if ([type isEqualToString:@"positive"])
        marker.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    else
        marker.icon = [GMSMarker markerImageWithColor:[UIColor redColor]];
    marker.map = nil;
    [self.markers addObject:marker];
}

-(void)refreshMap
{
    dataClass *obj = [dataClass getInstance];
    CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:self.camera.target.latitude longitude:self.camera.target.longitude];
    obj.currentLocation = currentLocation;
    [self changeCamera];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[locationVC alloc] init];
    [self.locationManager startManager:self];
    self.markers = [[NSMutableSet alloc] init];
    self.camera = [GMSCameraPosition cameraWithLatitude:45.755038
                                              longitude:4.85
                                                   zoom:15];
    self.mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:self.camera];
    self.mapView_.delegate = self;
    self.view = self.mapView_;
    self.mapView_.mapType = kGMSTypeNormal;
    self.mapView_.settings.compassButton = YES;
    self.mapView_.settings.myLocationButton = YES;
    [self.navigationItem.rightBarButtonItem setTarget:self];
    [self.navigationItem.rightBarButtonItem setAction:@selector(refreshMap)];
}

- (BOOL) didTapMyLocationButtonForMapView:(GMSMapView *)mapView
{
    [self.locationManager startTracking];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
