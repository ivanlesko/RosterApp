//
//  ViewController.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.nameStore = [ModelController modelController];
    
    self.namesTableView.delegate = self;

    self.namesTableView.dataSource = self.nameStore;
    
    self.sortActionSheet.delegate = self;
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refreshTableView)
                  forControlEvents:UIControlEventValueChanged];
    
    [self.namesTableView addSubview:self.refreshControl];
}

- (void)refreshTableView
{
    [self.refreshControl beginRefreshing];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.namesTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        
        NSIndexPath *indexPath = [self.namesTableView indexPathForSelectedRow];
        
        CodeFellowDetailViewController *detailVC = [segue destinationViewController];
        
        if (indexPath.section == 0) {
            detailVC.theCodeFellow = [[self.nameStore teachers] objectAtIndex:indexPath.row];
        } else if (indexPath.section == 1) {
            detailVC.theCodeFellow = [[self.nameStore students] objectAtIndex:indexPath.row];
        }
    }
}

#pragma mark - Sort Action Sheet Methods

- (IBAction)sortTable:(id)sender
{
    self.sortActionSheet = [[UIActionSheet alloc] initWithTitle:@"Sort By:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Ascending", @"Descending", nil];
    
    [self.sortActionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = @[nameDescriptor];
        
        [self.nameStore sortCodeFellowsUsingSortDescriptors:sortDescriptors];
        
        [self.namesTableView reloadData];
        
        NSLog(@"Ascending");
    }
    
    if (buttonIndex == 1) {
        NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
        NSArray *sortDescriptors = @[nameDescriptor];
        
        [self.nameStore sortCodeFellowsUsingSortDescriptors:sortDescriptors];
        
        [self.namesTableView reloadData];
        
        /**
         * Need to figure out why the table view is not reloading the rows.
         * The sort descriptor is working, but the table is not updating.
         */
    }
}

@end











