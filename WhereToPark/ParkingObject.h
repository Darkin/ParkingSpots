//
//  ParkingObject.h
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-08.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef NS_ENUM(NSInteger, ParkingType) {
    parkingTypeOther = -1,
    parkingTypeCar,
    parkingTypeBike,
    parkingTypeMotorcycle,
    parkingTypeHelicopter,
    parkingTypeBoat,
    parkingTypeJetPack,
};


@interface ParkingObject : NSObject <MKAnnotation>

@property (nonatomic) NSString *name;
@property (nonatomic) ParkingType type;
@property (nonatomic) NSNumber *capacity;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

@property (nonatomic, readonly) UIImage *image;

@end
