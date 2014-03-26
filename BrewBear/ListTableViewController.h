//
//  ListTableViewController.h
//  BrewBear
//
//  Created by Jacob Howcroft on 3/26/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewController : UITableViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
