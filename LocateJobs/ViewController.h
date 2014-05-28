//
//  ViewController.h
//  LocateJobs
//
//  Created by lrm on 5/28/14.
//  Copyright (c) 2014 NotYours. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
