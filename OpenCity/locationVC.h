//
//  locationVC.h
//  
//
//  Created by Apollo on 11/09/14.
//
//

#import <UIKit/UIKit.h>
#import "mapView.h"

@interface locationVC : UIViewController

-(void)startManager:(mapView *)mapview;
-(void)startTracking;
@property (strong, nonatomic) mapView *mapview;
@end
