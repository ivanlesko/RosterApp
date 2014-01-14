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
    
    self.namesTableView.delegate = self;
    self.namesTableView.dataSource = self;
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
    NSLog(@"refreshing table view");
    [self.refreshControl beginRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
    
    NSString *name;
    
    /** Cell text for a teacher */
    if (indexPath.section == 0) {
        CodeFellow *codeFellowTeacher = [[[RosterNamesStore rosterNamesStore] codeFellowTeachers] objectAtIndex:indexPath.row];
        name = [NSString stringWithFormat:@"%@ %@", codeFellowTeacher.firstName, codeFellowTeacher.lastName];
    }
    
    /** Define the cell text for a student */
    if (indexPath.section == 1) {
        CodeFellow *codeFellowStudent = [[[RosterNamesStore rosterNamesStore] codeFellowStudents] objectAtIndex:indexPath.row];
        name = [NSString stringWithFormat:@"%@ %@", codeFellowStudent.firstName, codeFellowStudent.lastName];
    }
    
    cell.textLabel.text = name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
            /** Teachers Section **/
        case 0:
            return [[[RosterNamesStore rosterNamesStore] codeFellowTeachers] count];
            break;
            
            /** Student Section **/
        case 1:
            return [[[RosterNamesStore rosterNamesStore] codeFellowStudents] count];
            break;
            
        default:
            return 1;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    
    switch (section) {
        case 0:
            title = @"Teachers";
            break;
            
        case 1:
            title = @"Students";
            break;
            
        default:
            title = @"Missing Title";
            break;
    }
    
    return title;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        
        NSIndexPath *indexPath = [self.namesTableView indexPathForSelectedRow];
        
        CodeFellowDetailViewController *detailVC = [segue destinationViewController];
        
        switch (indexPath.section) {
            case 0:
                detailVC.theCodeFellow = [[[RosterNamesStore rosterNamesStore] codeFellowTeachers] objectAtIndex:indexPath.row];
                break;
                
            case 1:
                detailVC.theCodeFellow = [[[RosterNamesStore rosterNamesStore] codeFellowStudents] objectAtIndex:indexPath.row];
                
            default:
                break;
        }
    }
}

@end











