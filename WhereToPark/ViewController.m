//
//  ViewController.m
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-07.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import "ViewController.h"
#import "ParkingObjectFactory.h"

@interface ViewController ()
@property (nonatomic) NSArray *parkingArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 42.9872178;
    zoomLocation.longitude = -81.2567967;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10000, 10000);
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.parkingArray = [ParkingObjectFactory loadParkingList];
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateParkingSpots];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateParkingSpots {
    //first remove the old annotions that are not needed
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
    //then add any new ones
    for (ParkingObject* parkingSpot in self.parkingArray) {
        [self.mapView addAnnotation:parkingSpot];
    }
}

#pragma mark - MKMapViewDelegate methods

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(ParkingObject*)annotation {
    if ([annotation isKindOfClass:[ParkingObject class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"ParkingObjectIdentifier"];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ParkingObjectIdentifier"];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = annotation.image;
            annotationView.frame = CGRectMake(annotationView.frame.origin.x, annotationView.frame.origin.y, 20, 20);
        } else {
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    
    return nil;
}

#pragma mark - Switch Action

-(IBAction)parkingTypeChanged:(UISwitch*)sender {
    switch (sender.tag) {
        case 1: //car
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeCar) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeCar) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
        case 2: //bike
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeBike) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeBike) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
        case 3: //helicopter
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeHelicopter) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeHelicopter) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
        case 4: //boat
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeBoat) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeBoat) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
        case 5: //motorcycle
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeMotorcycle) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeMotorcycle) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
        case 6: //jetpack
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeJetPack) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeJetPack) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
            
        default:
            if (sender.on) {
                for (ParkingObject* parkingSpot in self.parkingArray) {
                    if (parkingSpot.type == parkingTypeOther) {
                        [self.mapView addAnnotation:parkingSpot];
                    }
                }
            } else {
                for (ParkingObject* parkingSpot in self.mapView.annotations) {
                    if (parkingSpot.type == parkingTypeOther) {
                        [self.mapView removeAnnotation:parkingSpot];
                    }
                }
            }
            break;
    }
}


@end
