//
//  ListViewController.m
//  BrewBear
//
//  Created by Jacob Howcroft on 3/25/14.
//  Copyright (c) 2014 Jacob Howcroft. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.top = -44;
    [self.tableView setContentInset:insets];
    UIScrollView *tableViewScrollView = (UIScrollView *)self.tableView.superview;
    tableViewScrollView.delegate = self;
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
    [navigationBar setBackgroundImage:[UIImage new]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    
    [navigationBar setBackgroundColor:[UIColor blueColor]];
    
    [navigationBar setShadowImage:[UIImage new]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

# pragma mark - UITablewViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self.tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    } else {
        return [self.tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // UITableViewHeaderFooterView *headerView = [self.tableView headerViewForSection:section];
    return 44;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrolled: %f", scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top = 0;
        [self.tableView setContentInset:insets];
    } else if (scrollView.contentOffset.y > 0) {
        UIEdgeInsets insets = self.tableView.contentInset;
        insets.top = -44;
        [self.tableView setContentInset:insets];
    }
    
}

@end
