//
//  ParkingObject.m
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-08.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import "ParkingObject.h"

@implementation ParkingObject

- (UIImage *)image {
    switch (self.type) {
        case parkingTypeCar:
            return [UIImage imageNamed:@"car"];
            break;
        case parkingTypeBike:
            return [UIImage imageNamed:@"bike"];
            break;
        case parkingTypeMotorcycle:
            return [UIImage imageNamed:@"motorcycle"];
            break;
        case parkingTypeJetPack:
            return [UIImage imageNamed:@"jetpack"];
            break;
        case parkingTypeBoat:
            return [UIImage imageNamed:@"boat"];
            break;
        case parkingTypeHelicopter:
            return [UIImage imageNamed:@"helicopter"];
            break;
        default:
            return [UIImage imageNamed:@"other"];
            break;
    }
}


#pragma mark - MKAnnotation requirments

- (CLLocationCoordinate2D) coordinate{
    CLLocationCoordinate2D place;
    place.latitude = [self.latitude doubleValue];
    place.longitude = [self.longitude doubleValue];
    return place;
}

- (NSString*)title {
    return self.name;
}

- (NSString*)subtitle{
    return [NSString stringWithFormat:@"capacity %ld",(long)[self.capacity integerValue]];
}

@end
