//
//  Recipes.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Brew;

@interface Recipes : NSManagedObject

@property (nonatomic) double final_gravity;
@property (nonatomic) double initial_gravity;
@property (nonatomic) int64_t rid;
@property (nonatomic) int16_t style;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Brew *brews;
@property (nonatomic, retain) NSManagedObject *events;

@end
