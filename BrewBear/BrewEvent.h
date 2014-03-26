//
//  BrewEvent.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface BrewEvent : NSManagedObject

@property (nonatomic) int64_t eid;
@property (nonatomic) int16_t event_type;
@property (nonatomic) int32_t time;
@property (nonatomic, retain) Recipe *recipe;

@end
