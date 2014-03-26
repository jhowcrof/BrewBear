//
//  BrewBearDatabase.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrewBearManagedObjects.h"

@interface BrewBearDatabase : NSObject <NSFetchedResultsControllerDelegate>

+ (NSManagedObjectContext *)context;

+ (void)saveContext;

+ (Recipe *)recipeWithName:(NSString *)title style:(int16_t)style;

@end
