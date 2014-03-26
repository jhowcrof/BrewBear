//
//  BrewBearDatabase.m
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import "BrewBearDatabase.h"
#import "AppDelegate.h"

@implementation BrewBearDatabase

+ (NSManagedObjectContext *)context {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return [appDelegate managedObjectContext];
}

+ (void)saveContext {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
}

+ (NSArray *)recipes {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Recipe"
                                   inManagedObjectContext:[BrewBearDatabase context]];
    [request setEntity:entity];
    
    //    // retrive the objects with a given value for a certain property
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"sbid == *"];
    //    [request setPredicate:predicate];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    
//    // Edit the section name key path and cache name if appropriate.
//    // nil for section name key path means "no sections".
//    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc]
//                                                             initWithFetchRequest:request
//                                                             managedObjectContext:[BrewBearDatabase context]
//                                                             sectionNameKeyPath:nil
//                                                             cacheName:@"Root"];
//    aFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    NSArray *result = [[BrewBearDatabase context] executeFetchRequest:request error:&error];
    
    return result;
}

+ (NSArray *)brews {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Brew"
                                   inManagedObjectContext:[BrewBearDatabase context]];
    [request setEntity:entity];
    
    //    // retrive the objects with a given value for a certain property
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"sbid == *"];
    //    [request setPredicate:predicate];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"start_date" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    NSArray *result = [[BrewBearDatabase context] executeFetchRequest:request error:&error];
    
    return result;
}

+ (Recipe *)recipeWithTitle:(NSString *)title style:(int16_t)style {
    Recipe *recipe = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Recipe"
                      inManagedObjectContext:[BrewBearDatabase context]];
    
    [recipe setTitle:title];
    [recipe setStyle:style];
    [self saveContext];
    return recipe;
}

+ (Brew *)brewWithRecipe:(Recipe *)recipe name:(NSString *)name {
    return [self brewWithRecipe:recipe name:@"" startDate:[[NSDate date] timeIntervalSince1970]];
}

+ (Brew *)brewWithRecipe:(Recipe *)recipe name:(NSString *)name startDate:(NSTimeInterval)startDate{
    Brew *brew = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Brew"
                  inManagedObjectContext:[BrewBearDatabase context]];
    
    [brew setRecipe:recipe];
    [brew setStart_date:startDate];
    [self saveContext];
    return brew;
}

+ (Brew *)brewWithRecipe:(Recipe *)recipe {
    return [self brewWithRecipe:recipe name:@""];
}

+ (BrewAction *)addBrewActionWithType:(int16_t)type brew:(Brew *)brew {
    BrewAction *brewAction = [NSEntityDescription
                              insertNewObjectForEntityForName:@"BrewAction"
                              inManagedObjectContext:[BrewBearDatabase context]];
    
    [brewAction setBrew:brew];
    [brewAction setAction_type:type];
    return brewAction;
}

@end
