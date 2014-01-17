//
//  ModelController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeFellow.h"
#import "RoundedProfileView.h"
#import "CodeFellowUITableViewCell.h"

/**
 * ModelController is a singleton model object that contains
 * info about every Code Fellow.
 */

@interface ModelController : NSObject <UITableViewDataSource>
{
    NSMutableArray *teachers;
    NSMutableArray *students;
}

/** Returns the ModelController singleton. */
+ (ModelController *)modelController;

/** Adds a Code Fellow to the listOfCodeFellows array */
- (void)addCodeFellow:(CodeFellow *)theCodeFellow;

@property (nonatomic, strong) NSMutableArray *listOfCodeFellows;

- (void)sortCodeFellowsUsingSortDescriptors:(NSArray *)theDescriptors;

- (NSMutableArray *)teachers;
- (NSMutableArray *)students;

@end







