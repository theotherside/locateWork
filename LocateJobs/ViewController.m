//
//  ViewController.m
//  LocateJobs
//
//  Created by lrm on 5/28/14.
//  Copyright (c) 2014 NotYours. All rights reserved.
//

#import "ViewController.h"
#import "myAnnotation.h"
//#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    //5
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 44.7901557;
    coordinate1.longitude = -91.4961361;
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Roof on State St."];
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 44.8021776;
    coordinate2.longitude = -91.50977130000001;
    myAnnotation *annotation2 = [[myAnnotation alloc] initWithCoordinate:coordinate2 title:@"Deck on Water St."];
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 44.8069672;
    coordinate3.longitude = -91.5097667;
    myAnnotation *annotation3 = [[myAnnotation alloc] initWithCoordinate:coordinate3 title:@"Grarage on 5th Ave"];
    [self.mapView addAnnotation:annotation3];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 44.811349000000000000;
    zoomLocation.longitude= -91.498494100000020000;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






//#pragma mark -MapView Delegate Methods
//6
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}
@end