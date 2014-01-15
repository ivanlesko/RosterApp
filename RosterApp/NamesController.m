//
//  NamesController.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/14/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NamesController.h"

@implementation NamesController

+ (NSMutableArray *)arrayOfStudentsForPlist:(NSString *)plistFilePath
{
    NSError *error;
    
    NSArray *pList = [NSMutableArray arrayWithContentsOfFile:plistFilePath];
    
    NSMutableArray *students = [NSMutableArray array];
    
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    } else {
        for (NSDictionary *student in pList) {
            [students addObject:student];
        }
    }
    
    return students;
}

@end
