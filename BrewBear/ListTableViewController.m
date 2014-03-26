//
//  ListTableViewController.m
//  BrewBear
//
//  Created by Jacob Howcroft on 3/26/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self initTableView];
    [self initNavigationBar];
    [self initRefreshControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.top = -44;
    [self.tableView setContentInset:insets];
    UIScrollView *tableViewScrollView = (UIScrollView *)self.tableView.superview;
    tableViewScrollView.delegate = self;
}

- (void)initNavigationBar {
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
    [navigationBar setBackgroundImage:[UIImage new]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    
    [navigationBar setBackgroundColor:[UIColor blueColor]];
    
    [navigationBar setShadowImage:[UIImage new]];
}

- (void)initRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    
    [refreshControl addTarget:self
                    action:@selector(refreshTable)
                    forControlEvents:UIControlEventValueChanged];
    
    [refreshControl setAttributedTitle:[[NSAttributedString alloc] initWithString:@"Updating data..."]];
    
    [self setRefreshControl:refreshControl];
}

- (void)refreshTable {
    [self.tableView reloadData];
    NSLog(@"refreshed");
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self.tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    } else {
        return [self.tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // UITableViewHeaderFooterView *headerView = [self.tableView headerViewForSection:section];
    return 44;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrolled: %f", scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top = 0;
        [self.tableView setContentInset:insets];
    } else if (scrollView.contentOffset.y > 10) {
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top = -44;
        [self.tableView setContentInset:insets];
    }
    
}

@end
