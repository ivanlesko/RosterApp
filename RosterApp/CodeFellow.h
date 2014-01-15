//
//  CodeFellow.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeFellow : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *github;
@property (nonatomic, strong) NSString *twitter;

/** This is the designated initializer */
- (id)initWithName:(NSString *)theName
       andCategory:(NSString *)theCategory
         andGithub:(NSString *)theGithub
        andTwitter:(NSString *)theTwitter;

@end
