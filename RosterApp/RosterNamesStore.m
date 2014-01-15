//
//  RosterNamesStore.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "RosterNamesStore.h"

@implementation RosterNamesStore

- (id)init
{
    self = [super init];
    if (self) {
        
        self.listOfCodeFellows  = [NSMutableArray array];
        codeFellowStudents = [NSMutableArray array];
        codeFellowTeachers = [NSMutableArray array];
        
        [self populateCodeFellowsStore];
    }
    
    return self;
}

+ (RosterNamesStore *)rosterNamesStore
{
    static RosterNamesStore *rosterNamesStore = nil;
    if (!rosterNamesStore) {
        rosterNamesStore = [[super alloc] init];
        
    }
    
    return rosterNamesStore;
}

- (NSMutableArray *)codeFellowStudents
{
    return codeFellowStudents;
}

- (NSMutableArray *)codeFellowTeachers
{
    return codeFellowTeachers;
}

- (void)addCodeFellow:(CodeFellow *)theCodeFellow
{
    if ([theCodeFellow.category isEqualToString:@"Teacher"]) {
        [codeFellowTeachers addObject:theCodeFellow];
    } else if ([theCodeFellow.category isEqualToString:@"Student"]) {
        [codeFellowStudents addObject:theCodeFellow];
    }
}

- (void)populateCodeFellowsStore
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Bootcamp" ofType:@"plist"];
    
    self.listOfCodeFellows = [NamesController arrayOfStudentsForPlist:path];
    
    for (NSDictionary *codeFellow in self.listOfCodeFellows) {
        CodeFellow *newCodeFellow = [[CodeFellow alloc] initWithName:codeFellow[@"name"]
                                                         andCategory:codeFellow[@"category"]
                                                           andGithub:codeFellow[@"github"]
                                                          andTwitter:codeFellow[@"twitter"]];
        
        [self addCodeFellow:newCodeFellow];
    }
}

- (NSMutableArray *)listOfAllNames
{
    return self.listOfCodeFellows;
}

@end

















