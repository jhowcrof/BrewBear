//
//  BrewAction.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Brew;

@interface BrewAction : NSManagedObject

@property (nonatomic) int16_t action_type;
@property (nonatomic) int64_t aid;
@property (nonatomic) BOOL target_met;
@property (nonatomic) NSTimeInterval time;
@property (nonatomic, retain) Brew *brew;

@end
