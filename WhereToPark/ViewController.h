//
//  ViewController.h
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-07.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *firstTitle;
@property (weak, nonatomic) IBOutlet UILabel *secondTitle;

@property (weak, nonatomic) IBOutlet UISwitch *carSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *bikeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *helicopterSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *boatSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *motorcycleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *jetpackSwitch;

-(IBAction)parkingTypeChanged:(UISwitch*)sender;

@end

