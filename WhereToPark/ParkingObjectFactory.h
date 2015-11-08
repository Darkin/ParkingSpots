//
//  ParkingObjectFactory.h
//  WhereToPark
//
//  Created by Darren Larkin on 2015-11-08.
//  Copyright © 2015 D2tech Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParkingObject.h"

@interface ParkingObjectFactory : NSObject

+ (NSArray*)loadParkingList;

+ (ParkingObject*)ParkingObjectFromDictionary:(NSDictionary*)dictionary;

@end
