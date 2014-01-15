//
//  NamesController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/14/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NamesController : NSObject

+ (NSMutableArray *)arrayOfStudentsForPlist:(NSString *)plistFilePath;

@end
