//
//  Brew.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Brew : NSManagedObject

@property (nonatomic) int64_t bid;
@property (nonatomic) int64_t final_gravity;
@property (nonatomic) double initial_gravity;
@property (nonatomic) NSTimeInterval start_date;
@property (nonatomic, retain) NSManagedObject *actions;
@property (nonatomic, retain) NSManagedObject *recipe;

@end
