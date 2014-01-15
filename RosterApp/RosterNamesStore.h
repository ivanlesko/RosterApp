//
//  RosterNamesStore.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeFellow.h"
#import "NamesController.h"

/**
 * RosterNamesStore is a singleton model object that contains 
 * info about every Code Fellow.
 */

@interface RosterNamesStore : NSObject
{
    NSMutableArray *codeFellowStudents;
    NSMutableArray *codeFellowTeachers;
}

/** Returns the RosterNamesStore singleton. */
+ (RosterNamesStore *)rosterNamesStore;

/** Returns all Code Fellows students. */
- (NSMutableArray *)codeFellowStudents;

/** Returns all Code Fellows teachers. */
- (NSMutableArray *)codeFellowTeachers;

- (NSMutableArray *)listOfAllNames;

/** Adds a Code Fellow to the listOfCodeFellows array */
- (void)addCodeFellow:(CodeFellow *)theCodeFellow;

@property (nonatomic, strong) NSMutableArray *listOfCodeFellows;

@end
