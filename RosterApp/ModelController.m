//
//  ModelController.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ModelController.h"

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        
        self.listOfCodeFellows  = [NSKeyedUnarchiver unarchiveObjectWithFile:[self codeFellowsArchivePath]];
        teachers = [NSMutableArray array];
        students = [NSMutableArray array];
        
        [self populateCodeFellowsStore];
    }
    
    return self;
}

+ (ModelController *)modelController
{
    static ModelController *modelController = nil;
    if (!modelController) {
        modelController = [[super alloc] init];
        
    }
    
    return modelController;
}

- (void)addCodeFellow:(CodeFellow *)theCodeFellow
{
    [self.listOfCodeFellows addObject:theCodeFellow];
    
    if ([theCodeFellow.category isEqualToString:@"Teacher"]) {
        [teachers addObject:theCodeFellow];
    } else if ([theCodeFellow.category isEqualToString:@"Student"]) {
        [students addObject:theCodeFellow];
    }
}

- (NSMutableArray *)teachers
{
    return teachers;
}

- (NSMutableArray *)students
{
    return students;
}

- (void)populateCodeFellowsStore
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    
    NSError *error;
    
    NSArray *pList = [NSMutableArray arrayWithContentsOfFile:path];
    
    NSMutableArray *codeFellows = [NSMutableArray arrayWithArray:pList];
    
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    } else {
        for (NSDictionary *codeFellow in codeFellows) {
            CodeFellow *newCodeFellow = [[CodeFellow alloc] initWithName:codeFellow[@"name"]
                                                             andCategory:codeFellow[@"category"]
                                                               andGithub:codeFellow[@"github"]
                                                              andTwitter:codeFellow[@"twitter"]];
            
            [self addCodeFellow:newCodeFellow];
        }
    }
}

- (void)sortCodeFellowsUsingSortDescriptors:(NSArray *)theDescriptors
{
    NSArray *sortedCodeFellows = [[self listOfCodeFellows] sortedArrayUsingDescriptors:theDescriptors];
    NSMutableArray *sortedCodeFellowsMutable = [NSMutableArray arrayWithArray:sortedCodeFellows];
    
    [self setListOfCodeFellows:sortedCodeFellowsMutable];

    NSArray *sortedTeachers = [teachers sortedArrayUsingDescriptors:theDescriptors];
    NSMutableArray *sortedTeachersMutable = [NSMutableArray arrayWithArray:sortedTeachers];
    
    teachers = sortedTeachersMutable;
    
    NSArray *sortedStudents = [students sortedArrayUsingDescriptors:theDescriptors];
    NSMutableArray *sortedStudentsMutable = [NSMutableArray arrayWithArray:sortedStudents];
    
    students = sortedStudentsMutable;
}

#pragma mark
#pragma mark - Table View Data Source Protocol Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CodeFellowUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CodeFellowCell"];
    
    CodeFellow *codeFellow;
    
    if (indexPath.section == 0) {
        codeFellow = [teachers objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1) {
        codeFellow = [students objectAtIndex:indexPath.row];
    }
    
    cell.codeFellow = codeFellow;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        /** Teachers Section **/
        case 0:
            return [teachers count];
            break;
            
        /** Student Section **/
        case 1:
            return [students count];
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

- (NSString *)docsDirPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [searchPaths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingString:@"/"];
    
    return documentsPath;
}

- (NSString *)codeFellowsArchivePath
{
    return [[self docsDirPath] stringByAppendingString:@"archive/"];
}

@end





