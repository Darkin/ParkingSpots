//
//  ParkingObjectFactory.m
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-08.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import "ParkingObjectFactory.h"

@implementation ParkingObjectFactory

+ (NSArray*)loadParkingList {
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"ParkingList" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filename];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in array) {
        [newArray addObject:[ParkingObjectFactory ParkingObjectFromDictionary:dictionary]];
    }
    return newArray;
}

+ (ParkingObject*)ParkingObjectFromDictionary:(NSDictionary*)dictionary {
    ParkingObject *newParkingSpot = [[ParkingObject alloc] init];
    newParkingSpot.name = dictionary[@"name"];
    newParkingSpot.capacity = dictionary[@"capacity"];
    newParkingSpot.latitude = dictionary[@"latitude"];
    newParkingSpot.longitude = dictionary[@"longitude"];
    
    NSString *type = dictionary[@"type"];
    if ([type isEqualToString:@"car"]) {
        newParkingSpot.type = parkingTypeCar;
    } else if ([type isEqualToString:@"helicopter"]) {
        newParkingSpot.type = parkingTypeHelicopter;
    } else if ([type isEqualToString:@"jetpack"]) {
        newParkingSpot.type = parkingTypeJetPack;
    } else if ([type isEqualToString:@"boat"]) {
        newParkingSpot.type = parkingTypeBoat;
    } else if ([type isEqualToString:@"bike"]) {
        newParkingSpot.type = parkingTypeBike;
    } else if ([type isEqualToString:@"motorcycle"]) {
        newParkingSpot.type = parkingTypeMotorcycle;
    } else {
        newParkingSpot.type = parkingTypeOther;
    }
    
    return newParkingSpot;
}

@end
