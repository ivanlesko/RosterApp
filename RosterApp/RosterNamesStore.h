//
//  RosterNamesStore.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeFellow.h"

@interface RosterNamesStore : NSObject
{
    NSMutableArray *codeFellowStudents;
    NSMutableArray *codeFellowTeachers;
}

+ (RosterNamesStore *)rosterNamesStore;

- (NSMutableArray *)codeFellowStudents;
- (NSMutableArray *)codeFellowTeachers;

- (void)addCodeFellowStudent:(CodeFellow *)theCodeFellow;
- (void)addCodeFellowTeacher:(CodeFellow *)theCodeFellow;

@end
