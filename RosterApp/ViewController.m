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
    
    [self.namesTableView reloadData];
}

#pragma mark - Table View Methods

- (void)refreshTableView
{
    [self.refreshControl beginRefreshing];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        
        NSIndexPath *indexPath = [self.namesTableView indexPathForSelectedRow];
        
        CodeFellowDetailViewController *detailVC = [segue destinationViewController];
        detailVC.delegate = self;
        
        if (indexPath.section == 0) {
            detailVC.theCodeFellow = [[self.nameStore teachers] objectAtIndex:indexPath.row];
            NSLog(@"selected code fellow: %@", detailVC.theCodeFellow);
        } else if (indexPath.section == 1) {
            detailVC.theCodeFellow = [[self.nameStore students] objectAtIndex:indexPath.row];
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
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
        
        [self.namesTableView reloadData];;
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

#pragma mark - Detail View Controller Delegate Methods

- (void)updatedCodeFellowInfo:(CodeFellow *)theCodeFellow
{
    NSIndexPath *indexPath;
    
    if ([theCodeFellow.category isEqualToString:@"Teacher"]) {
        indexPath = [NSIndexPath indexPathForRow:[[self.nameStore teachers] indexOfObject:theCodeFellow] inSection:0];
    } else if ([theCodeFellow.category isEqualToString:@"Student"]) {
        indexPath = [NSIndexPath indexPathForRow:[[self.nameStore students] indexOfObject:theCodeFellow] inSection: 1];
    }
    
    [self.namesTableView reloadData];
    
    [self.namesTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end











