//
//  NamesTableViewDataSource.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/14/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NamesTableViewDataSource.h"

@implementation NamesTableViewDataSource

#pragma mark - Roster Names Table View Data Source Protocol Methods

- (id)init
{
    if (self = [super init]) {
        self.nameStore = [RosterNamesStore rosterNamesStore];
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
    
    NSString *name;
    
    /** Cell text for a teacher */
    if (indexPath.section == 0) {
        CodeFellow *codeFellowTeacher = [[self.nameStore codeFellowTeachers] objectAtIndex:indexPath.row];
        name = [NSString stringWithFormat:@"%@", codeFellowTeacher.name];
    }
    
    /** Define the cell text for a student */
    if (indexPath.section == 1) {
        CodeFellow *codeFellowStudent = [[self.nameStore codeFellowStudents] objectAtIndex:indexPath.row];
        name = [NSString stringWithFormat:@"%@", codeFellowStudent.name];
    }
    
    cell.textLabel.text = name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
            /** Teachers Section **/
        case 0:
            return [[self.nameStore codeFellowTeachers] count];
            break;
            
            /** Student Section **/
        case 1:
            return [[self.nameStore codeFellowStudents] count];
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


@end
